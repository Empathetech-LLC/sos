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
    with AfterLayoutMixin<HomeScreen>, WidgetsBindingObserver {
  // Gather the theme data //

  // Layout
  final double iconSize = EzConfig.get(iconSizeKey);
  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double spacing = EzConfig.get(spacingKey);

  late final double spargin = margin + spacing;
  late final double safeTop =
      Platform.isIOS ? padding : MediaQuery.paddingOf(context).top;
  late final double safeBottom =
      Platform.isIOS ? padding : MediaQuery.paddingOf(context).bottom;

  static const EzSeparator separator = EzSeparator();

  final bool isLefty = EzConfig.get(isLeftyKey);

  // Color
  final Color videoColor = Color(EzConfig.get(videoColorKey) ?? 0xFFFF0000);

  // Text
  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = EFUILang.of(context)!;
  late final TextStyle? labelStyle = Theme.of(context).textTheme.labelLarge;

  // Define the build data //

  CameraController? camera;

  // Tutorial
  final OverlayPortalController broadcastOverlay =
      OverlayPortalController(debugLabel: 'broadcast');
  final OverlayPortalController settingsOverlay =
      OverlayPortalController(debugLabel: 'settings');
  final OverlayPortalController recordOverlay =
      OverlayPortalController(debugLabel: 'record');

  /// EMergency Contacts; [List] of phone number [String]s
  List<String>? emc = EzConfig.get(emcKey);

  bool broadcasting = false;

  bool recording = false;
  final Stopwatch watch = Stopwatch();

  bool showRights = false;

  /// true == indefinite
  /// false == once
  final bool sosOnClose = EzConfig.get(onCloseKey) ?? false;

  // Define custom functions //

  /// Register [broadcastTask] (aka [sendSOS]) with [Workmanager]
  Future<dynamic> startBroadcast() {
    return Workmanager().registerPeriodicTask(
      broadcastTask,
      broadcastTask,
      frequency: const Duration(seconds: 3),
    );
  }

  /// Initialize the [camera]
  Future<bool> initCamera() async {
    if (camera != null) return true;

    final PermissionStatus status = await Permission.camera.request();

    if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      return false;
    }

    final List<CameraDescription> cameras = await availableCameras();
    camera = CameraController(cameras.first, ResolutionPreset.max);

    try {
      await camera!.initialize();
      return true;
    } catch (e) {
      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        if (mounted) {
          ezLogAlert(context, message: e.toString());
        }
      }
    }

    return false;
  }

  /// Users must select at least one emergency contact to use the app
  Future<void> gatherEMC() async {
    if (emc == null || emc!.isEmpty) {
      await firstEMCMsg(context);

      // Confirm contacts access
      final bool contactsGranted =
          await FlutterContacts.requestPermission(readonly: true);

      if (!contactsGranted) {
        if (mounted) {
          ezLogAlert(
            context,
            title: el10n.gAttention,
            message: l10n.hsNeedContacts,
            customActions: (
              <EzMaterialAction>[
                EzMaterialAction(text: l10n.gOk, onPressed: () => exit(0))
              ],
              <EzCupertinoAction>[
                EzCupertinoAction(text: l10n.gOk, onPressed: () => exit(0))
              ],
            ),
          );
        }
        return;
      }

      Contact? contact;

      while (true) {
        contact = await FlutterContacts.openExternalPick();

        if (contact == null ||
            (contact.phones.isEmpty || contact.phones.first.number.isEmpty)) {
          if (mounted) {
            await ezSnackBar(
              context: context,
              message: l10n.hsNoNumber,
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

  // Define custom Widgets //

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // Check for auto-SOS
    final PermissionStatus locationStatus = await Permission.location.request();

    if (locationStatus != PermissionStatus.denied &&
        locationStatus != PermissionStatus.permanentlyDenied) {
      // SOS on open can't be setup without contact access already being granted
      if (EzConfig.get(onOpenKey) == true) startBroadcast();
    }

    // Gather the emergency contacts
    // Checks are in the function (only runs if needed)
    await gatherEMC();

    // Setup the camera (and preview)
    final bool hasCamera = await initCamera();

    // User interaction is done, refresh the screen
    setState(hasCamera ? () {} : () => showRights = true);

    if (EzConfig.get(tutorialKey) == true) broadcastOverlay.show();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Preview (or loading)
            camera == null
                ? Center(
                    child: SizedBox(
                      height: heightOf(context) * 0.667,
                      width: double.infinity,
                      child: showRights
                          ? const RightsView()
                          : EmpathetechLoadingAnimation(
                              semantics: el10n.gLoadingAnim),
                    ),
                  )
                : Center(child: CameraPreview(camera!)),

            // Video timer
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
                          color: getTextColor(videoColor),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // SOS/broadcast button
            Positioned(
              top: spargin,
              left: 0,
              right: 0,
              child: Center(
                child: OverlayPortal(
                  controller: broadcastOverlay,
                  overlayChildBuilder: (_) => Positioned(
                    top: safeTop + spargin + iconSize * 1.5 + spacing,
                    left: 0,
                    right: 0,
                    child: EzAlertDialog(
                      content: Text(
                        l10n.hsBTutorial,
                        textAlign: TextAlign.center,
                      ),
                      materialActions: <EzMaterialAction>[
                        EzMaterialAction(
                          text: l10n.gOk,
                          onPressed: () {
                            broadcastOverlay.hide();
                            settingsOverlay.show();
                          },
                        )
                      ],
                      cupertinoActions: <EzCupertinoAction>[
                        EzCupertinoAction(
                          text: l10n.gOk,
                          onPressed: () {
                            broadcastOverlay.hide();
                            settingsOverlay.show();
                          },
                        )
                      ],
                      needsClose: false,
                    ),
                  ),
                  child: broadcasting
                      ? EzIconButton(
                          icon: const SOSIcon(),
                          iconSize: iconSize * 1.5,
                          onPressed: () async {
                            await Workmanager()
                                .cancelByUniqueName(broadcastTask);
                            setState(() => broadcasting = false);
                          },
                        )
                      : EzIconButton(
                          icon: const Icon(Icons.sos),
                          iconSize: iconSize * 1.5,
                          onPressed: () async {
                            await startBroadcast();
                            setState(() => broadcasting = true);
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
                  top: safeTop + margin,
                  right: isLefty ? null : margin + iconSize + spacing,
                  left: isLefty ? margin + iconSize + spacing : null,
                  child: EzAlertDialog(
                    content: Text(
                      l10n.hsSTutorial,
                      textAlign: TextAlign.center,
                    ),
                    materialActions: <EzMaterialAction>[
                      EzMaterialAction(
                        text: l10n.gOk,
                        onPressed: () {
                          settingsOverlay.hide();
                          recordOverlay.show();
                        },
                      )
                    ],
                    cupertinoActions: <EzCupertinoAction>[
                      EzCupertinoAction(
                        text: l10n.gOk,
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

            // Safe close - iff sosOnClose is true
            Positioned(
              top: margin,
              right: isLefty ? margin : null,
              left: isLefty ? null : margin,
              child: Visibility(
                visible: sosOnClose,
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
                  // Capture/Know your rights
                  (camera == null || recording)
                      ? EzIconButton(
                          icon: showRights
                              ? Icon(PlatformIcons(context).eyeSlash)
                              : const Icon(Icons.gavel),
                          onPressed: () =>
                              setState(() => showRights = !showRights),
                        )
                      : EzIconButton(
                          icon: Icon(PlatformIcons(context).photoCamera),
                          onPressed: () async {
                            try {
                              final XFile image = await camera!.takePicture();

                              await Gal.requestAccess();
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
                      bottom: safeBottom + spargin + iconSize * 2 + spacing,
                      right: 0,
                      left: 0,
                      child: EzAlertDialog(
                        content: Text(
                          camera == null
                              ? l10n.hsRightTutorial
                              : l10n.hsRecTutorial,
                          textAlign: TextAlign.center,
                        ),
                        materialActions: <EzMaterialAction>[
                          EzMaterialAction(
                            text: l10n.gOk,
                            onPressed: () async {
                              recordOverlay.hide();
                              await EzConfig.setBool(tutorialKey, false);
                            },
                          )
                        ],
                        cupertinoActions: <EzCupertinoAction>[
                          EzCupertinoAction(
                            text: l10n.gOk,
                            onPressed: () async {
                              recordOverlay.hide();
                              await EzConfig.setBool(tutorialKey, false);
                            },
                          )
                        ],
                        needsClose: false,
                      ),
                    ),
                    child: recording
                        ? EzIconButton(
                            icon: Icon(
                              Icons.stop,
                              size: iconSize * 2,
                              color: videoColor,
                            ),
                            onPressed: () async {
                              try {
                                final XFile video =
                                    await camera!.stopVideoRecording();

                                setState(() => recording = false);
                                watch.stop();
                                watch.reset();

                                await Gal.requestAccess();
                                await Gal.putVideo(video.path);
                                await Share.shareXFiles(
                                  <XFile>[video],
                                  text: await getCoordinates(),
                                );
                              } catch (e) {
                                if (context.mounted) {
                                  ezLogAlert(context, message: e.toString());
                                }
                              }
                            },
                          )
                        : EzIconButton(
                            icon: Icon(
                              Icons.circle,
                              size: iconSize * 2,
                              color: videoColor,
                            ),
                            onPressed: () async {
                              if (camera == null) {
                                final bool worksNow = await initCamera();
                                if (worksNow) {
                                  setState(() {});
                                } else {
                                  return;
                                }
                              }
                              await Permission.microphone.request();

                              try {
                                await camera!.startVideoRecording();

                                setState(() => recording = true);
                                watch.start();
                              } catch (e) {
                                if (context.mounted) {
                                  ezLogAlert(context, message: e.toString());
                                }
                              }
                            },
                          ),
                  ),
                  separator,

                  // Flash
                  camera != null
                      ? EzIconButton(
                          icon: switch (camera!.value.flashMode) {
                            FlashMode.off => const Icon(Icons.flash_off),
                            FlashMode.auto => const Icon(Icons.flash_auto),
                            FlashMode.always => const Icon(Icons.flash_on),
                            FlashMode.torch => const Icon(Icons.flashlight_on),
                          },
                          onPressed: () async {
                            switch (camera!.value.flashMode) {
                              case FlashMode.off:
                                await camera!.setFlashMode(FlashMode.auto);
                                break;
                              case FlashMode.auto:
                                await camera!.setFlashMode(FlashMode.always);
                                break;
                              case FlashMode.always:
                                await camera!.setFlashMode(FlashMode.off);
                                break;
                              case FlashMode.torch:
                                await camera!.setFlashMode(FlashMode.off);
                                break;
                            }
                            setState(() {});
                          },
                        )
                      : const EzIconButton(
                          icon: Icon(Icons.flash_off),
                          enabled: false,
                          onPressed: doNothing,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cleanup //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (recording &&
        (state == AppLifecycleState.detached ||
            state == AppLifecycleState.hidden ||
            state == AppLifecycleState.inactive ||
            state == AppLifecycleState.paused)) {
      sosOnClose ? startBroadcast() : sendSOS();
    }
  }

  @override
  void dispose() {
    camera?.dispose();
    super.dispose();
  }
}
