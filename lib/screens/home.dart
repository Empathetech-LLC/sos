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
  late final double safeTop =
      Platform.isIOS ? padding : MediaQuery.paddingOf(context).top;
  late final double safeBottom =
      Platform.isIOS ? margin : MediaQuery.paddingOf(context).bottom;

  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double spacing = EzConfig.get(spacingKey);

  late final double spargin = margin + spacing;

  static const EzSeparator separator = EzSeparator();

  final double iconSize = EzConfig.get(iconSizeKey);
  final bool isLefty = EzConfig.get(isLeftyKey);

  // Color
  final Color videoColor = Color(EzConfig.get(videoColorKey) ?? 0xFFFF0000);
  late final Color videoTextColor = getTextColor(videoColor);
  late final Color rightsBackgroundColor = Theme.of(context)
      .textButtonTheme
      .style!
      .backgroundColor!
      .resolve(<WidgetState>{WidgetState.focused})!;

  // Text
  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = EFUILang.of(context)!;

  // Define the build data //

  // Core
  /// EMergency Contacts; [List] of phone number [String]s
  List<String>? emc = EzConfig.get(emcKey);

  bool broadcasting = false;

  /// true == indefinite
  /// false == once
  final bool sosOnClose = EzConfig.get(onCloseKey) ?? false;

  // Tutorial
  final OverlayPortalController broadcastOverlay =
      OverlayPortalController(debugLabel: 'broadcast');
  final OverlayPortalController settingsOverlay =
      OverlayPortalController(debugLabel: 'settings');
  final OverlayPortalController recordOverlay =
      OverlayPortalController(debugLabel: 'record');

  // Camera
  CameraController? camera;

  bool recording = false;
  final Stopwatch watch = Stopwatch();

  bool showRights = false;

  // Define custom functions //

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

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // Save for later
    final bool cameraIntro = emc == null || emc!.isEmpty;

    // Gather the emergency contacts
    emc = await addEMC(context, emc);

    // Setup the camera/preview
    if (cameraIntro && context.mounted) await cameraMsg(context);
    final bool cameraAccess = await initCamera();
    setState(cameraAccess ? () {} : () => showRights = true);

    // Run the tutorial (if unfinished)
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
            // Preview (or loading) and rights view
            Center(
              child: camera == null
                  ? SizedBox(
                      height: heightOf(context) * 0.667,
                      width: double.infinity,
                      child: showRights
                          ? const RightsView()
                          : EmpathetechLoadingAnimation(
                              semantics: el10n.gLoadingAnim),
                    )
                  : Stack(children: <Widget>[
                      CameraPreview(camera!),
                      Visibility(
                        visible: showRights,
                        child: Container(
                          color: rightsBackgroundColor,
                          child: const RightsView(),
                        ),
                      ),
                    ]),
            ),

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
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: videoTextColor,
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
                  overlayChildBuilder: (_) => TutorialOverlay(
                    top: safeTop + spargin + iconSize * 1.5 + spacing,
                    left: 0,
                    right: 0,
                    content: l10n.hsBroadcastTutorial,
                    accept: () {
                      broadcastOverlay.hide();
                      settingsOverlay.show();
                    },
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
                overlayChildBuilder: (_) => TutorialOverlay(
                  top: safeTop + margin,
                  right: isLefty ? null : margin + iconSize + spacing,
                  left: isLefty ? margin + iconSize + spacing : null,
                  content: l10n.hsSettingsTutorial,
                  accept: () {
                    settingsOverlay.hide();
                    recordOverlay.show();
                  },
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
                    overlayChildBuilder: (_) => TutorialOverlay(
                      bottom: safeBottom + spargin + iconSize * 2 + spacing,
                      right: 0,
                      left: 0,
                      content: camera == null
                          ? l10n.hsRightsTutorial
                          : l10n.hsVideoTutorial,
                      accept: () async {
                        recordOverlay.hide();
                        await EzConfig.setBool(tutorialKey, false);
                      },
                    ),
                    child: recording
                        ? EzIconButton(
                            style: IconButton.styleFrom(
                              foregroundColor: videoColor,
                              side: BorderSide(color: videoTextColor),
                            ),
                            icon: Icon(Icons.stop, size: iconSize * 2),
                            onPressed: () async {
                              try {
                                // Stop recording
                                final XFile video =
                                    await camera!.stopVideoRecording();
                                watch.stop();

                                // Update the UI
                                setState(() => recording = false);
                                watch.reset();

                                // Attempt to save the video
                                final bool galAccess =
                                    await Gal.requestAccess();

                                if (galAccess) {
                                  try {
                                    await Gal.putVideo(video.path);
                                  } catch (_) {
                                    // If it fails, it's likely the user has bigger problems at hand
                                    // We can still try to share the file without saving it to the gallery
                                  }
                                }

                                // Share the video
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
                            style: IconButton.styleFrom(
                              foregroundColor: videoColor,
                              side: BorderSide(color: videoTextColor),
                            ),
                            icon: Icon(Icons.circle, size: iconSize * 2),
                            onPressed: () async {
                              try {
                                await camera!.startVideoRecording();
                                watch.start();

                                setState(() => recording = true);
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
                  camera == null
                      ? const EzIconButton(
                          icon: Icon(Icons.flash_off),
                          enabled: false,
                          onPressed: doNothing,
                        )
                      : FlashButton(
                          camera: camera!,
                          stateCallback: () => setState(() {}),
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
