/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'dart:io';
import 'package:gal/gal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feedback/feedback.dart';
import 'package:efui_bios/efui_bios.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workmanager/workmanager.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with WidgetsBindingObserver, AfterLayoutMixin<HomeScreen> {
  // Gather the theme data //

  final double iconSize = EzConfig.get(iconSizeKey);
  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double spacing = EzConfig.get(spacingKey);

  late final double spargin = margin + spacing;
  late final double spadding = padding + spacing;

  final bool isLefty = EzConfig.get(isLeftyKey);

  final Color videoColor = Color(EzConfig.get(videoColorKey) ?? 0xFFFF0000);
  late final Color recordTextColor = getTextColor(videoColor);

  late final EFUILang el10n = EFUILang.of(context)!;
  late final TextStyle? labelStyle = Theme.of(context).textTheme.labelLarge;

  static const EzSeparator separator = EzSeparator();

  // Define the build data //

  late Future<void> camStatus;
  late CameraController camControl;

  final OverlayPortalController broadcastOverlay =
      OverlayPortalController(debugLabel: 'broadcast');
  final OverlayPortalController settingsOverlay =
      OverlayPortalController(debugLabel: 'settings');
  final OverlayPortalController recordOverlay =
      OverlayPortalController(debugLabel: 'record');

  List<String>? emc = EzConfig.get(emcKey);

  bool recording = false;
  final Stopwatch watch = Stopwatch();

  bool broadcasting = false;

  final bool notifyOnClose = EzConfig.get(onCloseKey) ?? false;

  // Define custom functions //

  Future<void> initCamera() async {
    final List<CameraDescription> cameras = await availableCameras();

    camControl = CameraController(cameras.first, ResolutionPreset.max);

    camControl.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void gatherEMC() async {
    if (emc == null || emc!.isEmpty) {
      await firstEMCMsg(context);

      Contact? contact;

      while (true) {
        contact = await FlutterContacts.openExternalPick();

        if (contact == null ||
            (contact.phones.isEmpty || contact.phones.first.number.isEmpty)) {
          if (mounted) {
            await ezSnackBar(
              context: context,
              message: 'Contact does not have a phone number',
            ).closed;
          }
        } else {
          break;
        }
      }

      final List<String> toSave = <String>[contact.phones.first.number];
      await EzConfig.setStringList(emcKey, toSave);
      emc = toSave;
    }
  }

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  @override
  void initState() {
    super.initState();
    camStatus = initCamera();
  }

  @override
  void afterFirstLayout(_) async {
    // Finalize permissions
    await Gal.requestAccess();
    await Permission.location.request();
    await FlutterContacts.requestPermission(readonly: true);

    // Populate emc
    gatherEMC();

    if (EzConfig.get(tutorialKey) == true) broadcastOverlay.show();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      showAppBar: false,
      title: appTitle,
      body: FutureBuilder<void>(
        future: camStatus,
        builder: (_, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SafeArea(
                child: Stack(
                  children: <Widget>[
                    // Preview
                    Center(child: CameraPreview(camControl)),

                    // Record timer
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Visibility(
                        visible: recording,
                        child: Center(
                          child: StreamBuilder<int>(
                            stream: Stream<int>.periodic(
                              const Duration(seconds: 1),
                              (_) => watch.elapsed.inSeconds,
                            ),
                            builder: (_, AsyncSnapshot<int> snapshot) {
                              final Duration elapsed =
                                  Duration(seconds: snapshot.data ?? 0);
                              return EzText(
                                elapsed.toString().split('.').first,
                                backgroundColor: videoColor,
                                style: labelStyle?.copyWith(
                                  color: recordTextColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Broadcast button
                    Positioned(
                      top: spargin,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: OverlayPortal(
                          controller: broadcastOverlay,
                          overlayChildBuilder: (_) => Positioned(
                            top: spargin + iconSize * 1.5 + spadding,
                            left: 0,
                            right: 0,
                            child: EzAlertDialog(
                              content: const Text(
                                'Activate SOS to text your EMC your exact location every minute.\n\nIt will continue when the phone is locked.\nDe-activate SOS or fully close the app to stop broadcasting.',
                                textAlign: TextAlign.center,
                              ),
                              materialActions: <EzMaterialAction>[
                                EzMaterialAction(
                                  text: 'Ok',
                                  onPressed: () {
                                    broadcastOverlay.hide();
                                    settingsOverlay.show();
                                  },
                                )
                              ],
                              cupertinoActions: <EzCupertinoAction>[
                                EzCupertinoAction(
                                  text: 'Ok',
                                  onPressed: () {
                                    broadcastOverlay.hide();
                                    settingsOverlay.show();
                                  },
                                )
                              ],
                              needsClose: false,
                            ),
                          ),
                          child: EzIconButton(
                            icon: broadcasting
                                ? const Icon(Icons.notifications)
                                : const Icon(Icons.sos),
                            iconSize: iconSize * 1.5,
                            highlightColor: Colors.red,
                            onPressed: () async {
                              if (broadcasting) {
                                await Workmanager()
                                    .cancelByUniqueName('sos_broadcast');
                                setState(() => broadcasting = false);
                              } else {
                                await Workmanager().registerPeriodicTask(
                                  'sos_broadcast',
                                  'sos_broadcast',
                                  frequency: const Duration(seconds: 3),
                                );
                                setState(() => broadcasting = true);
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    // Settings
                    Positioned(
                      top: margin,
                      right: isLefty ? null : margin,
                      left: isLefty ? margin : null,
                      child: OverlayPortal(
                        controller: settingsOverlay,
                        overlayChildBuilder: (_) => Positioned(
                          top: margin,
                          right: isLefty ? null : margin + iconSize + spadding,
                          left: isLefty ? margin + iconSize + spadding : null,
                          child: EzAlertDialog(
                            content: const Text(
                              'You can customize your SOS message, add more EMC, set the app to auto-SOS, update the appearance, and more in the settings.',
                              textAlign: TextAlign.center,
                            ),
                            materialActions: <EzMaterialAction>[
                              EzMaterialAction(
                                text: 'Ok',
                                onPressed: () {
                                  settingsOverlay.hide();
                                  recordOverlay.show();
                                },
                              )
                            ],
                            cupertinoActions: <EzCupertinoAction>[
                              EzCupertinoAction(
                                text: 'Ok',
                                onPressed: () {
                                  settingsOverlay.hide();
                                  recordOverlay.show();
                                },
                              )
                            ],
                            needsClose: false,
                          ),
                        ),
                        child: EzIconButton(
                          icon: Icon(PlatformIcons(context).settings),
                          enabled: !recording,
                          onPressed: () => context.goNamed(settingsHomePath),
                          onLongPress: () async {
                            await Clipboard.setData(
                                const ClipboardData(text: empathSupport));

                            if (context.mounted) {
                              await ezSnackBar(
                                context: context,
                                message:
                                    '${el10n.gOpeningFeedback}\n${el10n.gClipboard(el10n.gSupportEmail)}',
                              ).closed;
                            }

                            if (context.mounted) {
                              BetterFeedback.of(context).show(
                                (UserFeedback feedback) async {
                                  await Share.shareXFiles(
                                    <XFile>[
                                      XFile.fromData(
                                        feedback.screenshot,
                                        name: 'screenshot.png',
                                        mimeType: 'image/png',
                                      )
                                    ],
                                    text: feedback.text,
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    // Safe close - iff notifyOnClose is true
                    Positioned(
                      top: margin,
                      right: isLefty ? margin : null,
                      left: isLefty ? null : margin,
                      child: Visibility(
                        visible: notifyOnClose,
                        child: EzIconButton(
                          icon: Icon(PlatformIcons(context).thumbUp),
                          enabled: !recording,
                          onPressed: () => exit(0),
                        ),
                      ),
                    ),

                    // Controls
                    Positioned(
                      bottom: spargin,
                      left: 0,
                      right: 0,
                      child: EzRow(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Capture
                          EzIconButton(
                            icon: Icon(PlatformIcons(context).photoCamera),
                            enabled: !recording,
                            onPressed: () async {
                              try {
                                final XFile image =
                                    await camControl.takePicture();

                                await Gal.putImage(image.path);
                                await Share.shareXFiles(
                                  <XFile>[image],
                                  text: await getCoordinates(),
                                );
                              } catch (e) {
                                if (context.mounted) {
                                  ezLogAlert(context, message: e.toString());
                                }
                              }
                            },
                          ),
                          separator,

                          // Record
                          OverlayPortal(
                            controller: recordOverlay,
                            overlayChildBuilder: (_) => Positioned(
                              bottom: spargin + iconSize * 2 + spadding,
                              right: 0,
                              left: 0,
                              child: EzAlertDialog(
                                content: const Text(
                                  'When you take a picture or finish a recording, it will auto-save to your gallery.\nThen, you can choose to share it (and your location) with the native sharing options.\n\nIf a video is interrupted, SOS will auto-activate.\nThis can be changed in the settings.',
                                  textAlign: TextAlign.center,
                                ),
                                materialActions: <EzMaterialAction>[
                                  EzMaterialAction(
                                    text: 'Ok',
                                    onPressed: () {
                                      settingsOverlay.hide();
                                      recordOverlay.show();
                                    },
                                  )
                                ],
                                cupertinoActions: <EzCupertinoAction>[
                                  EzCupertinoAction(
                                    text: 'Ok',
                                    onPressed: () {
                                      settingsOverlay.hide();
                                      recordOverlay.show();
                                    },
                                  )
                                ],
                                needsClose: false,
                              ),
                            ),
                            child: EzIconButton(
                              icon: Icon(
                                recording ? Icons.stop : Icons.circle,
                                size: iconSize * 2,
                                color: videoColor,
                              ),
                              onPressed: !recording
                                  ? () async {
                                      try {
                                        await camControl.startVideoRecording();

                                        setState(() => recording = true);
                                        watch.start();
                                      } catch (e) {
                                        if (context.mounted) {
                                          ezLogAlert(context,
                                              message: e.toString());
                                        }
                                      }
                                    }
                                  : () async {
                                      try {
                                        final XFile video = await camControl
                                            .stopVideoRecording();

                                        setState(() => recording = false);
                                        watch.stop();
                                        watch.reset();

                                        await Gal.putVideo(video.path);
                                        await Share.shareXFiles(
                                          <XFile>[video],
                                          text: await getCoordinates(),
                                        );
                                      } catch (e) {
                                        if (context.mounted) {
                                          ezLogAlert(context,
                                              message: e.toString());
                                        }
                                      }
                                    },
                            ),
                          ),
                          separator,

                          // Flash
                          EzIconButton(
                            icon: switch (camControl.value.flashMode) {
                              FlashMode.off => const Icon(Icons.flash_off),
                              FlashMode.auto => const Icon(Icons.flash_auto),
                              FlashMode.always => const Icon(Icons.flash_on),
                              FlashMode.torch =>
                                const Icon(Icons.flashlight_on),
                            },
                            onPressed: () async {
                              switch (camControl.value.flashMode) {
                                case FlashMode.off:
                                  await camControl.setFlashMode(FlashMode.auto);
                                  break;
                                case FlashMode.auto:
                                  await camControl
                                      .setFlashMode(FlashMode.always);
                                  break;
                                case FlashMode.always:
                                  await camControl.setFlashMode(FlashMode.off);
                                  break;
                                case FlashMode.torch:
                                  await camControl.setFlashMode(FlashMode.off);
                                  break;
                              }
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            default:
              // Replace with a CircularProgressIndicator if you don't have access to efui_bios
              return Center(
                child: EmpathetechLoadingAnimation(
                  height: heightOf(context) * 0.333,
                  semantics: el10n.gLoadingAnim,
                ),
              );
          }
        },
      ),
    );
  }

  // Cleanup //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  void dispose() {
    camControl.dispose();
    super.dispose();
  }
}
