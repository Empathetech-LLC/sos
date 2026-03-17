/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:after_layout/after_layout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen>, WidgetsBindingObserver {
  // Define the build data //

  // Core
  CameraDescription? cameraDesc;
  CameraController? camera;

  bool recording = false;
  final Stopwatch watch = Stopwatch();

  bool showRights = false;

  Timer? sosTimer;

  // Tutorial(s)
  final OverlayPortalController sosTutorial =
      OverlayPortalController(debugLabel: 'sos');
  final OverlayPortalController cameraTutorial =
      OverlayPortalController(debugLabel: 'camera');
  final OverlayPortalController settingsTutorial =
      OverlayPortalController(debugLabel: 'settings');

  // Define custom functions //

  /// Initialize the [camera]
  Future<PermissionStatus> initCamera() async {
    if (camera != null) return PermissionStatus.granted;

    if (cameraDesc != null) {
      try {
        camera = CameraController(cameraDesc!, ResolutionPreset.max);
        await camera!.initialize();
        return PermissionStatus.granted;
      } catch (_) {
        // Continue/try again, might be a permissions thing
        // Actual catch happens below
      }
    }

    final PermissionStatus status = await Permission.camera.request();
    if (deniedPermCheck(status)) return status;

    await Permission.microphone.request(); // Not required

    final List<CameraDescription> cameras = await availableCameras();
    cameraDesc = cameras.firstWhere(
        (CameraDescription c) => c.lensDirection == CameraLensDirection.back);
    if (cameraDesc == null) return PermissionStatus.denied;

    try {
      camera = CameraController(cameraDesc!, ResolutionPreset.max);
      await camera!.initialize();
      return PermissionStatus.granted;
    } catch (e) {
      final String message = e.toString();

      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        (mounted)
            ? await ezLogAlert(context, message: message)
            : ezLog(message);
      } else {
        ezLog('CameraException from initCamera.../n$message');
      }
      return PermissionStatus.denied;
    }
  }

  Future<bool> sosChecks() async {
    // Check permissions
    if (!isIOS && deniedPermCheck(await Permission.sms.status)) {
      mounted
          ? await ezLogAlert(
              context,
              message: l10n.sosNeedSMS,
              customActions: <Widget>[
                EzMaterialAction(
                    text: EzConfig.l10n.ssPageTitle,
                    onPressed: openAppSettings,
                    style: EzConfig.styles.bodyLarge?.copyWith(
                      color: EzConfig.colors.primary,
                    )),
              ],
            )
          : ezLog(l10n.sosNeedSMS);
      return false;
    }

    // Check contacts
    if (emc.isEmpty) {
      if (mounted) {
        ezSnackBar(
          context,
          message: l10n.bsSnackRequest,
        );
        await context.pushNamed(sosSettingsPath);
        if (mounted) setState(() {});
      }
      return false;
    }

    return true;
  }

  /// Runs [backgroundSOS] on successful [sosChecks]
  Future<void> startBackgroundSOS() async {
    if (await sosChecks() == true) await backgroundSOS();
  }

  /// [foregroundSOS] every 5 minutes on successful [sosChecks]
  Future<void> startForegroundSOS({bool showSnack = false}) async {
    // Cleanup any existing timer and run checks
    sosTimer?.cancel();
    if (await sosChecks() == false) return;

    // Make it so (immediate SOS)
    await foregroundSOS();

    // Make it so (periodic SOS)
    if (mounted) {
      setState(() => sosTimer =
          Timer.periodic(const Duration(minutes: 5), (_) => foregroundSOS()));
    }

    // Double reminder/option to cancel
    if (showSnack && mounted) {
      ezSnackBar(
        context,
        message: l10n.hsBroadcasting,
        undo: () async => stopForegroundSOS(),
        undoMessage: l10n.hsStop,
      );
    }
  }

  /// Cancel the [sosTimer]
  void stopForegroundSOS() {
    if (mounted) setState(() => sosTimer?.cancel());
  }

  // Init //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // Check for fresh installs
    if (EzConfig.get(setupCompleteKey) != true) {
      while (EzConfig.get(setupCompleteKey) != true) {
        // While loop re-opens the dialog on locale change
        await appSetupModal(context, initCamera: initCamera);
      }
    } else {
      // Check for auto SOS
      final bool taskRunning = EzConfig.get(taskRunningKey);

      if (taskRunning) await stopBackgroundSOS(context);
      if (sosOnOpen || taskRunning) await startForegroundSOS(showSnack: true);

      // Setup the camera/preview
      await initCamera();
    }

    // Run the tutorial (if unfinished)
    if (showTutorial) {
      sosTutorial.show();
    } else {
      if (mounted) setState(() => showRights = true);
    }
  }

  //* Return the build *//

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      Stack(
        children: <Widget>[
          // Camera preview and rights view
          Center(
            child: GestureDetector(
              onLongPress: () {
                if (mounted) setState(() => showRights = !showRights);
              },
              child: Container(
                height: heightOf(context) * 0.667,
                width: double.infinity,
                color: EzConfig.colors.surface,
                child: camera == null
                    ? Visibility(
                        visible: showRights,
                        child: const RightsView(),
                      )
                    : Stack(children: <Widget>[
                        Center(
                          child: Semantics(
                            hint: l10n.hsPreviewHint,
                            excludeSemantics: showRights,
                            child: CameraPreview(camera!),
                          ),
                        ),
                        Visibility(
                          visible: showRights,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Theme.of(context)
                                .textButtonTheme
                                .style!
                                .backgroundColor!
                                .resolve(<WidgetState>{WidgetState.focused}),
                            child: const RightsView(),
                          ),
                        ),
                      ]),
              ),
            ),
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
                  builder: (_, AsyncSnapshot<int> snapshot) => EzText(
                    Duration(seconds: snapshot.data ?? 0)
                        .toString()
                        .split('.')
                        .first,
                    backgroundColor: videoColor,
                    style: EzConfig.styles.labelLarge
                        ?.copyWith(color: videoTextColor),
                  ),
                ),
              ),
            ),
          ),

          // SOS/broadcast button
          Positioned(
            top: EzConfig.spargin,
            left: 0,
            right: 0,
            child: Center(
              child: OverlayPortal(
                controller: sosTutorial,
                overlayChildBuilder: (_) => EzTutorial(
                  top: safeTop(context) +
                      EzConfig.spargin +
                      EzConfig.iconSize * 1.5 +
                      EzConfig.spacing,
                  left: 0,
                  right: 0,
                  title: EzIcon(
                    Icons.arrow_upward,
                    color: EzConfig.colors.onSurface,
                  ),
                  content: isIOS
                      ? l10n.hsBroadcastTutorial
                      : '${l10n.hsBroadcastTutorial}\n\n${l10n.hsBroadcastTutorialAndroid}',
                  contentSemantics: isIOS
                      ? l10n.hsBroadcastTutorialFix
                      : '${l10n.hsBroadcastTutorialFix}\n\n${l10n.hsBroadcastTutorialAndroid}',
                  acceptMessage: '1/4\t>>',
                  acceptSemantics: l10n.hsOneOfFour,
                  onAccept: () {
                    sosTutorial.hide();
                    settingsTutorial.show();
                  },
                ),
                child: sosTimer?.isActive == true
                    ? EzIconButton(
                        icon: const SOSIcon(),
                        iconSize: EzConfig.iconSize * 1.5,
                        onPressed: stopForegroundSOS,
                      )
                    : EzIconButton(
                        fauxDisabled: emc.isEmpty,
                        icon: Icon(Icons.sos, semanticLabel: l10n.hsStartSOS),
                        iconSize: EzConfig.iconSize * 1.5,
                        onPressed: startForegroundSOS,
                      ),
              ),
            ),
          ),

          // Settings
          Positioned(
            top: EzConfig.marginVal,
            right: EzConfig.isLefty ? null : EzConfig.marginVal,
            left: EzConfig.isLefty ? EzConfig.marginVal : null,
            child: OverlayPortal(
              controller: settingsTutorial,
              overlayChildBuilder: (_) => EzTutorial(
                top: safeTop(context) + EzConfig.marginVal,
                right:
                    EzConfig.isLefty ? 0 : EzConfig.spargin + EzConfig.iconSize,
                left:
                    EzConfig.isLefty ? EzConfig.spargin + EzConfig.iconSize : 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    EzIcon(
                      Icons.arrow_forward,
                      color: EzConfig.colors.onSurface,
                    ),
                  ],
                ),
                content: l10n.hsSettingsTutorial,
                contentSemantics: l10n.hsSettingsTutorialFix,
                acceptMessage: '2/4\t>>',
                acceptSemantics: l10n.hsTwoOfFour,
                onAccept: () {
                  settingsTutorial.hide();
                  cameraTutorial.show();
                },
              ),
              child: EzIconButton(
                icon: Icon(
                  Icons.settings,
                  semanticLabel: EzConfig.l10n.ssPageTitle,
                ),
                enabled: !recording,
                onPressed: () => context.goNamed(settingsHomePath),
              ),
            ),
          ),

          // Safe close - iff sosOnClose is true
          Positioned(
            top: EzConfig.marginVal,
            right: EzConfig.isLefty ? EzConfig.marginVal : null,
            left: EzConfig.isLefty ? null : EzConfig.marginVal,
            child: Visibility(
              visible: sosOnClose,
              child: EzIconButton(
                icon: Icon(
                  Icons.thumb_up,
                  semanticLabel: l10n.hsSafeCloseHint,
                ),
                enabled: !recording,
                onPressed: () {
                  if (sosTimer?.isActive == true) stopForegroundSOS();
                  exit(0);
                },
              ),
            ),
          ),

          // Controls
          Positioned(
            bottom: EzConfig.spacing,
            left: 0,
            right: 0,
            child: Center(
              child: EzScrollView(
                scrollDirection: Axis.horizontal,
                reverseHands: true,
                startCentered: true,
                showScrollHint: true,
                children: <Widget>[
                  // Take picture/know your rights
                  (camera == null || recording)
                      ? EzIconButton(
                          icon: showRights
                              ? Icon(
                                  Icons.visibility_off,
                                  semanticLabel: l10n.hsHideRights,
                                )
                              : Icon(
                                  Icons.gavel,
                                  semanticLabel: l10n.hsShowRights,
                                ),
                          onPressed: () {
                            if (mounted) {
                              setState(() => showRights = !showRights);
                            }
                          },
                        )
                      : EzIconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            semanticLabel: l10n.hsCameraHint,
                          ),
                          onPressed: () async {
                            try {
                              // Take a picture
                              final XFile image = await camera!.takePicture();

                              // Attempt to save the image
                              await saveToGallery(image.path, true);

                              // Attempt to share (config based)
                              if (autoShareMedia && context.mounted) {
                                final RenderBox? box =
                                    context.findRenderObject() as RenderBox?;

                                await SharePlus.instance.share(ShareParams(
                                  text: await getCoordinates(
                                    linkType.base,
                                    nullable: true,
                                  ),
                                  files: <XFile>[image],
                                  sharePositionOrigin:
                                      box!.localToGlobal(Offset.zero) &
                                          box.size,
                                ));
                              }
                            } catch (e) {
                              (context.mounted)
                                  ? await ezLogAlert(
                                      context,
                                      message: e.toString(),
                                    )
                                  : ezLog(e.toString());
                            }
                          },
                        ),
                  EzConfig.separator,

                  // Record
                  OverlayPortal(
                    controller: cameraTutorial,
                    overlayChildBuilder: (_) => EzTutorial(
                      bottom: safeBottom(context) +
                          EzConfig.spargin +
                          EzConfig.iconSize * 2 +
                          EzConfig.spacing,
                      left: 0,
                      right: 0,
                      title: EzIcon(
                        Icons.arrow_downward,
                        color: EzConfig.colors.onSurface,
                      ),
                      content: isIOS
                          ? l10n.hsIOSVideoTutorial
                          : l10n.hsVideoTutorial,
                      acceptMessage: '3/4\t>>',
                      acceptSemantics: l10n.hsThreeOfFour,
                      onAccept: () async {
                        cameraTutorial.hide();

                        await showDialog(
                          context: context,
                          builder: (_) => EzAlertDialog(
                            title: Text(
                              l10n.hsTutorialComplete,
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              l10n.hsAddEMC,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        await EzConfig.setBool(showTutorialKey, false);
                        if (mounted) setState(() => showRights = true);
                      },
                    ),
                    child: recording
                        ? EzIconButton(
                            style: IconButton.styleFrom(
                              foregroundColor: videoColor,
                              side: EzConfig.borderSide(videoTextColor),
                            ),
                            icon: Icon(
                              Icons.stop,
                              semanticLabel: l10n.hsEndRecord,
                            ),
                            iconSize: EzConfig.iconSize * 2,
                            onPressed: () async {
                              late final XFile? video;
                              try {
                                // Stop recording
                                video = await camera!.stopVideoRecording();
                              } catch (e) {
                                (context.mounted)
                                    ? await ezLogAlert(
                                        context,
                                        message: e.toString(),
                                      )
                                    : ezLog(e.toString());
                              }
                              watch.stop();

                              // Update the UI
                              if (mounted) setState(() => recording = false);
                              watch.reset();

                              if (video == null) return;
                              try {
                                // Videos are saved as tmp files
                                // We need to fix that before proceeding
                                final File tmpFile = File(video.path);

                                // Create a unique mp4 file path
                                final Directory appDir =
                                    await getApplicationDocumentsDirectory();
                                final String mp4Path =
                                    '${appDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

                                // Copy the tmp file to the new mp4
                                await tmpFile.copy(mp4Path);

                                // Attempt to save the video
                                await saveToGallery(mp4Path, false);

                                // Attempt to share the video (config based)
                                if (autoShareMedia && context.mounted) {
                                  final RenderBox? box =
                                      context.findRenderObject() as RenderBox?;

                                  await SharePlus.instance.share(ShareParams(
                                    text: await getCoordinates(
                                      linkType.base,
                                      nullable: true,
                                    ),
                                    files: <XFile>[XFile(mp4Path)],
                                    sharePositionOrigin:
                                        box!.localToGlobal(Offset.zero) &
                                            box.size,
                                  ));
                                }
                              } catch (e) {
                                (context.mounted)
                                    ? await ezLogAlert(
                                        context,
                                        message: e.toString(),
                                      )
                                    : ezLog(e.toString());
                              }
                            },
                          )
                        : EzIconButton(
                            fauxDisabled: camera == null,
                            style: IconButton.styleFrom(
                              foregroundColor: videoColor,
                              side: EzConfig.borderSide(
                                  EzConfig.colors.onSurface),
                            ),
                            icon: Icon(
                              Icons.circle,
                              semanticLabel: l10n.hsStartRecord,
                            ),
                            iconSize: EzConfig.iconSize * 2,
                            onLongPress:
                                camera == null ? openAppSettings : null,
                            onPressed: () async {
                              if (camera == null) {
                                final PermissionStatus cameraPerm =
                                    await initCamera();

                                if (allowedPermCheck(cameraPerm)) {
                                  if (mounted) setState(() {});
                                }
                                return;
                              }

                              try {
                                await camera!.startVideoRecording();
                                watch.start();
                                if (mounted) setState(() => recording = true);
                              } catch (e) {
                                (context.mounted)
                                    ? await ezLogAlert(
                                        context,
                                        message: e.toString(),
                                      )
                                    : ezLog(e.toString());
                              }
                            },
                          ),
                  ),
                  EzConfig.separator,

                  // Flash
                  camera == null
                      ? EzIconButton(
                          fauxDisabled: true,
                          icon: const Icon(Icons.flash_off),
                          onPressed: () async {
                            final PermissionStatus cameraPerm =
                                await initCamera();

                            if (allowedPermCheck(cameraPerm)) {
                              if (mounted) setState(() {});
                            }
                            return;
                          },
                          onLongPress: openAppSettings,
                        )
                      : FlashButton(camera!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Cleanup //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        break; // Do nothing

      case AppLifecycleState.hidden:
        final bool alreadyRunning = EzConfig.get(taskRunningKey);
        final bool active = sosTimer?.isActive == true;

        if (recording) {
          // SOS based on user state/settings
          if (!isIOS &&
              !alreadyRunning &&
              (active || sosOnClose || sosOnInterrupt)) {
            if (active) stopForegroundSOS();
            await startBackgroundSOS();
          }

          // Attempt to save the partial recording
          try {
            final XFile video = await camera!.stopVideoRecording();

            // Videos are saved as tmp files
            // We need to fix that before proceeding
            final File tmpFile = File(video.path);

            // Create a unique mp4 file path
            final Directory appDir = await getApplicationDocumentsDirectory();
            final String mp4Path =
                '${appDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

            // Copy the tmp file to the new mp4
            await tmpFile.copy(mp4Path);

            // Attempt to save the video
            await saveToGallery(mp4Path, false);
          } catch (e) {
            // The app is unfocussed, so we can't do anything
            ezLog('Error saving the partial recording');
            ezLog(e.toString());
          }

          watch.stop();
          watch.reset();
          if (mounted) setState(() => recording = false);
        } else {
          // Not recording
          // SOS based on user state/settings
          if (!isIOS && !alreadyRunning && (active || sosOnClose)) {
            if (active) stopForegroundSOS();
            await startBackgroundSOS();
          }
        }
        break;

      case AppLifecycleState.resumed:
        // Restore camera
        if (cameraDesc != null) {
          try {
            camera = CameraController(cameraDesc!, ResolutionPreset.max);
            await camera!.initialize();
          } catch (e) {
            if (e is! CameraException || e.code != 'CameraAccessDenied') {
              mounted
                  ? await ezLogAlert(context, message: e.toString())
                  : ezLog(e.toString());
            }
          }
          if (mounted) setState(() {});
        }

        // Check SOS state
        if (EzConfig.get(taskRunningKey) == true) {
          // stopBackgroundSOS handles the async context
          // ignore: use_build_context_synchronously
          await stopBackgroundSOS(context);
          await startForegroundSOS(showSnack: true);
        }
        break;
    }
  }

  @override
  void dispose() {
    sosTimer?.cancel();
    camera?.dispose();
    camera = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
