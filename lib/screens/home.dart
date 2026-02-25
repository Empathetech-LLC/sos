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
      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        mounted
            ? await ezLogAlert(context, message: e.toString())
            : ezLog(e.toString());
      } else {
        ezLog('CameraException from initCamera.../n${e.toString()}');
      }
      return PermissionStatus.denied;
    }
  }

  /// [foregroundSOS] every 5 minutes
  Future<void> startForegroundSOS({bool showSnack = false}) async {
    // Cleanup any existing timer and send an immediate SOS
    sosTimer?.cancel();
    await foregroundSOS();

    // Initiate a periodic SOS
    setState(() => sosTimer =
        Timer.periodic(const Duration(minutes: 5), (_) => foregroundSOS()));

    if (showSnack && mounted) {
      ezSnackBar(
        context,
        message: l10n.hsAutoSOS,
        undo: () async => stopForegroundSOS(),
        undoMessage: l10n.hsStop,
      );
    }
  }

  /// Cancel the [sosTimer]
  void stopForegroundSOS() => setState(() => sosTimer?.cancel());

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
      if (mounted) setState(() {});
    } else {
      // Check for auto SOS
      final bool taskRunning = EzConfig.get(taskRunningKey);
      if (taskRunning) await stopBackgroundSOS(context);
      if (sosOnOpen || taskRunning) await startForegroundSOS(showSnack: true);

      // Setup the camera/preview
      await initCamera();
      if (mounted) setState(() {});
    }

    // Run the tutorial (if unfinished)
    if (showTutorial) sosTutorial.show();
  }

  //* Return the build *//

  @override
  Widget build(BuildContext context) => SosScaffold(
        Stack(
          children: <Widget>[
            // Camera preview and rights view
            Center(
              child: GestureDetector(
                onLongPress: () => setState(() => showRights = !showRights),
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
                  controller: sosTutorial, // TODO: restore counter on all 3
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
                    content: isIOS // TODO: update lang for new options
                        ? l10n.hsIOSBroadcastTutorial
                        : l10n.hsBroadcastTutorial,
                    acceptMessage: l10n.gOk,
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
                          icon: Icon(Icons.sos, semanticLabel: l10n.hsStartSOS),
                          iconSize: EzConfig.iconSize * 1.5,
                          onPressed: () async {
                            // Check permissions
                            final PermissionStatus smsStatus = isIOS
                                ? PermissionStatus.granted
                                : await Permission.sms.request();

                            if (deniedPermCheck(smsStatus)) {
                              (context.mounted)
                                  ? await ezLogAlert(
                                      context,
                                      message: l10n.sosNeedSMS,
                                    )
                                  : ezLog(l10n.sosNeedSMS);
                              return;
                            }

                            // Check contacts
                            if (emc == null || emc!.isEmpty) {
                              if (context.mounted) {
                                ezSnackBar(
                                  context,
                                  message: 'Please add emergency contacts',
                                ); // TODO: l10n
                                await context.pushNamed(sosSettingsPath);
                                setState(() {});
                              }
                              return;
                            }

                            // Make it so
                            await startForegroundSOS();
                          },
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
                  right: EzConfig.isLefty
                      ? 0
                      : EzConfig.spargin + EzConfig.iconSize,
                  left: EzConfig.isLefty
                      ? EzConfig.spargin + EzConfig.iconSize
                      : 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      EzIcon(
                        Icons.arrow_forward,
                        color: EzConfig.colors.onSurface,
                      ),
                    ],
                  ),
                  content: l10n.hsSettingsTutorial, // TODO: center to camera
                  acceptMessage: l10n.gOk,
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
                            onPressed: () =>
                                setState(() => showRights = !showRights),
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
                                if (autoShare && context.mounted) {
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
                        content: camera == null
                            ? isIOS
                                ? l10n.hsIOSRightsTutorial
                                : l10n.hsRightsTutorial
                            : isIOS
                                ? l10n.hsIOSVideoTutorial
                                : l10n.hsVideoTutorial,
                        acceptMessage: l10n.gOk,
                        onAccept: () async {
                          cameraTutorial.hide();

                          await showDialog(
                            context: context,
                            builder: (_) => EzAlertDialog(
                              title: const Text(
                                'Tutorial complete',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                "If you're using SOS alerts, please head to the settings page and add your emergency contacts.",
                                style: EzConfig.styles.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                          await EzConfig.setBool(showTutorialKey, false);
                        },
                      ),
                      child: recording
                          ? EzIconButton(
                              style: IconButton.styleFrom(
                                foregroundColor: videoColor,
                                side: BorderSide(
                                  color: videoTextColor,
                                  width: borderWidth,
                                ),
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
                                setState(() => recording = false);
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
                                  if (autoShare && context.mounted) {
                                    final RenderBox? box = context
                                        .findRenderObject() as RenderBox?;

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
                              style: IconButton.styleFrom(
                                foregroundColor: videoColor,
                                side: BorderSide(
                                  color: EzConfig.colors.onSurface,
                                  width: borderWidth,
                                ),
                              ),
                              icon: Icon(
                                Icons.circle,
                                semanticLabel: l10n.hsStartRecord,
                              ),
                              iconSize: EzConfig.iconSize * 2,
                              onPressed: () async {
                                if (camera == null) {
                                  final PermissionStatus cameraPerm =
                                      await initCamera();

                                  if (allowedPermCheck(cameraPerm)) {
                                    setState(() {});
                                  }
                                  return;
                                }

                                try {
                                  await camera!.startVideoRecording();
                                  watch.start();
                                  setState(() => recording = true);
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
                            icon: const Icon(Icons.flash_off),
                            fauxDisabled: true,
                            onPressed: () async {
                              final PermissionStatus cameraPerm =
                                  await initCamera();

                              if (allowedPermCheck(cameraPerm)) {
                                setState(() {});
                              }
                              return;
                            },
                          )
                        : FlashButton(camera!),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  // Cleanup //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        break; // Do nothing

      case AppLifecycleState.inactive:
        camera?.dispose();
        camera = null;
        break;

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
          setState(() => recording = false);
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
