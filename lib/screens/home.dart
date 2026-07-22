/* sos
 * Copyright (c) 2025 YWT (Empathetech LLC). All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:after_layout/after_layout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_ui/open_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen>, WidgetsBindingObserver {
  // Define the build data //

  bool showRights = false;

  CameraDescription? cameraDesc;
  CameraController? camera;

  bool recording = false;
  final Stopwatch stopwatch = Stopwatch();

  Timer? sosTimer;

  final OverlayPortalController sosTutorial = OverlayPortalController(debugLabel: 'sos');
  final OverlayPortalController cameraTutorial = OverlayPortalController(debugLabel: 'camera');
  final OverlayPortalController settingsTutorial = OverlayPortalController(debugLabel: 'settings');

  // Define custom functions //

  Future<bool> initCamera(EzCP config) async {
    if (camera != null) return true;

    if (cameraDesc != null) {
      try {
        camera = CameraController(cameraDesc!, ResolutionPreset.max);
        await camera!.initialize();
        return true;
      } catch (_) {
        // Continue/try again
        // Actual catch happens below
      }
    }

    if (!(await Permission.camera.isGranted)) return false;

    final List<CameraDescription> cameras = await availableCameras();
    cameraDesc = cameras.firstWhere(
      (CameraDescription c) => c.lensDirection == CameraLensDirection.back,
    );
    if (cameraDesc == null) return false;

    try {
      camera = CameraController(cameraDesc!, ResolutionPreset.max);
      await camera!.initialize();
      return true;
    } catch (e) {
      final String message = e.toString();

      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        (mounted) ? await ezLogAlert(config, context: context, message: message) : ezLog(message);
      } else {
        ezLog('CameraException from initCamera.../n$message');
      }
      return false;
    }
  }

  Future<bool> sosChecks(EzCP config) async {
    // Check permissions
    if (!isIOS && deniedPermCheck(await Permission.sms.status)) {
      mounted
          ? await ezLogAlert(
              config,
              context: context,
              message: l10n(config).sosNeedSMS,
              customActions: <Widget>[
                EzAction(
                  config,
                  text: config.ezL10n.gSettings,
                  onPressed: openAppSettings,
                  style: config.bodyStyle?.copyWith(color: config.colors.primary),
                ),
              ],
            )
          : ezLog(l10n(config).sosNeedSMS);
      return false;
    }

    // Check contacts
    if (emc.isEmpty) {
      if (mounted) {
        ezSnackBar(config, context: context, message: l10n(config).bsSnackRequest);
        await context.pushNamed(sosSettingsPath);
        if (mounted) setState(() {});
      }
      return false;
    }

    return true;
  }

  /// Runs [backgroundSOS] on successful [sosChecks]
  Future<void> startBackgroundSOS(EzCP config) async {
    if (await sosChecks(config) == true) await backgroundSOS(l10n(config));
  }

  /// [foregroundSOS] every 5 minutes on successful [sosChecks]
  Future<void> startForegroundSOS(EzCP config, {bool showSnack = false}) async {
    // Cleanup any existing timer and run checks
    sosTimer?.cancel();
    if (await sosChecks(config) == false) return;

    // Make it so (immediate SOS)
    final bool started = await foregroundSOS(l10n(config));
    if (!started) return;

    // Make it so (periodic SOS)
    if (mounted) {
      setState(
        () => sosTimer = Timer.periodic(
          const Duration(minutes: 5),
          (_) => foregroundSOS(l10n(config)),
        ),
      );
    }

    // Double reminder/option to cancel
    if (showSnack && mounted) {
      ezSnackBar(
        config,
        context: context,
        message: l10n(config).hsBroadcasting,
        undo: () async => stopForegroundSOS(),
        undoMessage: l10n(config).hsStop,
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
  Future<void> afterFirstLayout(BuildContext context) async {
    final EzCP config = configWatcher(context);

    // Check for fresh installs
    if (EzCM.get(setupCompleteKey) != true) {
      while (EzCM.get(setupCompleteKey) != true) {
        // While loop re-opens the dialog on locale change
        await appSetupModal(config, context);
      }
      await initCamera(config);
    } else {
      // Check for auto SOS
      final bool taskRunning = EzCM.get(taskRunningKey);

      if (taskRunning) await stopBackgroundSOS(config, context: context);
      if (sosOnOpen || taskRunning) await startForegroundSOS(config, showSnack: true);

      // Setup the camera/preview
      await initCamera(config);
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
    return Consumer<EzCP>(
      builder: (_, EzCP config, __) => SosScaffold(
        config,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // Camera preview and rights view
              Center(
                child: GestureDetector(
                  onLongPress: () {
                    if (mounted) setState(() => showRights = !showRights);
                  },
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: heightOf(context) * 0.667,
                    width: double.infinity,
                    color: config.colors.surface,
                    child: camera == null
                        ? EzAnimVis(
                            config,
                            mod: 0.5,
                            visible: showRights,
                            forceType: EzTransitionType.none,
                            forceFade: true,
                            kid: RightsView(config),
                          )
                        : Stack(
                            children: <Widget>[
                              Center(
                                child: Semantics(
                                  hint: l10n(config).hsPreviewHint,
                                  excludeSemantics: showRights,
                                  child: CameraPreview(camera!),
                                ),
                              ),
                              EzAnimVis(
                                config,
                                mod: 0.5,
                                visible: showRights,
                                forceType: EzTransitionType.none,
                                forceFade: true,
                                kid: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  color: config.colors.surfaceContainer.withValues(
                                    alpha: config.textBackgroundOpacity,
                                  ),
                                  child: RightsView(config),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              // Video timer
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: EzAnimVis(
                  config,
                  mod: 0.5,
                  visible: recording,
                  forceType: EzTransitionType.none,
                  forceFade: true,
                  kid: Center(
                    child: StreamBuilder<int>(
                      stream: Stream<int>.periodic(
                        const Duration(seconds: 1),
                        (_) => stopwatch.elapsed.inSeconds,
                      ),
                      builder: (_, AsyncSnapshot<int> snapshot) => EzText(
                        config,
                        text: Duration(seconds: snapshot.data ?? 0).toString().split('.').first,
                        backgroundColor: videoColor(config),
                        style: config.labelStyle?.copyWith(color: videoTextColor(config)),
                      ),
                    ),
                  ),
                ),
              ),

              // SOS/broadcast button
              Positioned(
                top: config.spacing + config.marginVal,
                left: 0,
                right: 0,
                child: Center(
                  child: OverlayPortal(
                    controller: sosTutorial,
                    overlayChildBuilder: (_) => EzTutorial(
                      config,
                      top: safeTop(context) +
                          config.spacing * 2 +
                          config.iconSize * 1.5 +
                          config.marginVal,
                      left: 0,
                      right: 0,
                      title: EzIcon(config, Icons.arrow_upward, color: config.colors.onSurface),
                      content: isIOS
                          ? l10n(config).hsBroadcastTutorial
                          : '${l10n(config).hsBroadcastTutorial}\n\n${l10n(config).hsBroadcastTutorialAndroid}',
                      contentSemantics: isIOS
                          ? l10n(config).hsBroadcastTutorialFix
                          : '${l10n(config).hsBroadcastTutorialFix}\n\n${l10n(config).hsBroadcastTutorialAndroid}',
                      acceptMessage: '1/4\t>>',
                      acceptSemantics: l10n(config).hsOneOfFour,
                      onAccept: () {
                        sosTutorial.hide();
                        settingsTutorial.show();
                      },
                    ),
                    child: sosTimer?.isActive == true
                        ? EzIconButton(
                            config,
                            icon: SOSIcon(config),
                            iconSize: config.iconSize * 1.5,
                            onPressed: stopForegroundSOS,
                          )
                        : EzIconButton(
                            config,
                            fauxDisabled: emc.isEmpty,
                            icon: Icon(Icons.sos, semanticLabel: l10n(config).hsStartSOS),
                            iconSize: config.iconSize * 1.5,
                            onPressed: () => startForegroundSOS(config),
                          ),
                  ),
                ),
              ),

              // Settings
              Positioned(
                top: config.marginVal,
                right: config.isLefty ? null : config.marginVal,
                left: config.isLefty ? config.marginVal : null,
                child: OverlayPortal(
                  controller: settingsTutorial,
                  overlayChildBuilder: (_) => EzTutorial(
                    config,
                    top: safeTop(context) + config.marginVal,
                    right: config.isLefty ? null : config.spargin + config.iconSize,
                    left: config.isLefty ? config.spargin + config.iconSize : null,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        EzIcon(config, Icons.arrow_forward, color: config.colors.onSurface),
                      ],
                    ),
                    content: l10n(config).hsSettingsTutorial,
                    contentSemantics: l10n(config).hsSettingsTutorialFix,
                    acceptMessage: '2/4\t>>',
                    acceptSemantics: l10n(config).hsTwoOfFour,
                    onAccept: () {
                      settingsTutorial.hide();
                      cameraTutorial.show();
                    },
                  ),
                  child: EzIconButton(
                    config,
                    icon: Icon(Icons.settings, semanticLabel: config.ezL10n.gSettings),
                    enabled: !recording,
                    onPressed: () => context.goNamed(settingsHomePath),
                  ),
                ),
              ),

              // Safe close (conditional)
              if (sosOnClose)
                Positioned(
                  top: config.marginVal,
                  right: config.isLefty ? config.marginVal : null,
                  left: config.isLefty ? null : config.marginVal,
                  child: EzIconButton(
                    config,
                    icon: Icon(Icons.thumb_up, semanticLabel: l10n(config).hsSafeCloseHint),
                    enabled: !recording,
                    onPressed: () {
                      if (sosTimer?.isActive == true) stopForegroundSOS();
                      exit(0);
                    },
                  ),
                ),

              // Controls
              Positioned(
                bottom: config.spacing,
                left: 0,
                right: 0,
                child: Center(
                  child: EzScrollView(
                    config,
                    scrollDirection: Axis.horizontal,
                    reverseHands: true,
                    startCentered: true,
                    showScrollHint: true,
                    children: <Widget>[
                      // Take picture/know your rights
                      (camera == null || recording)
                          ? EzIconButton(
                              config,
                              icon: showRights
                                  ? Icon(
                                      Icons.visibility_off,
                                      semanticLabel: l10n(config).hsHideRights,
                                    )
                                  : Icon(Icons.gavel, semanticLabel: l10n(config).hsShowRights),
                              onPressed: () {
                                if (mounted) {
                                  setState(() => showRights = !showRights);
                                }
                              },
                            )
                          : EzIconButton(
                              config,
                              icon: Icon(
                                Icons.camera_alt,
                                semanticLabel: l10n(config).hsCameraHint,
                              ),
                              onPressed: () async {
                                try {
                                  // Take a picture
                                  final XFile image = await camera!.takePicture();

                                  // Attempt to save the image
                                  await saveToGallery(image.path, true);

                                  // Attempt to share (config based)
                                  if (autoShareMedia && context.mounted) {
                                    final RenderBox? box = context.findRenderObject() as RenderBox?;

                                    await SharePlus.instance.share(
                                      ShareParams(
                                        text: await getCoordinates(
                                          l10n(config),
                                          linkBase: linkType.base,
                                          nullable: true,
                                        ),
                                        files: <XFile>[image],
                                        sharePositionOrigin:
                                            box!.localToGlobal(Offset.zero) & box.size,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  (context.mounted)
                                      ? await ezLogAlert(
                                          config,
                                          context: context,
                                          message: e.toString(),
                                        )
                                      : ezLog(e.toString());
                                }
                              },
                            ),
                      config.separator,

                      // Record
                      OverlayPortal(
                        controller: cameraTutorial,
                        overlayChildBuilder: (_) => EzTutorial(
                          config,
                          bottom: safeBottom(context) +
                              config.spacing * 2 +
                              config.iconSize * 2 +
                              config.marginVal,
                          left: 0,
                          right: 0,
                          title: EzIcon(
                            config,
                            Icons.arrow_downward,
                            color: config.colors.onSurface,
                          ),
                          content: isIOS
                              ? l10n(config).hsIOSVideoTutorial
                              : l10n(config).hsVideoTutorial,
                          acceptMessage: '3/4\t>>',
                          acceptSemantics: l10n(config).hsThreeOfFour,
                          onAccept: () async {
                            cameraTutorial.hide();

                            await showDialog(
                              context: context,
                              builder: (_) => EzAlertDialog(
                                config,
                                title: Text(
                                  l10n(config).hsTutorialComplete,
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  l10n(config).hsAddEMC,
                                  style: config.bodyStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                            await EzCM.setBool(showTutorialKey, false);
                            if (mounted) setState(() => showRights = true);
                          },
                        ),
                        child: recording
                            ? EzIconButton(
                                config,
                                style: IconButton.styleFrom(
                                  foregroundColor: videoColor(config),
                                  side: config.borderSide(color: videoTextColor(config)),
                                ),
                                icon: Icon(Icons.stop, semanticLabel: l10n(config).hsEndRecord),
                                iconSize: config.iconSize * 2,
                                onPressed: () async {
                                  late final XFile? video;
                                  try {
                                    // Stop recording
                                    video = await camera!.stopVideoRecording();
                                  } catch (e) {
                                    (context.mounted)
                                        ? await ezLogAlert(
                                            config,
                                            context: context,
                                            message: e.toString(),
                                          )
                                        : ezLog(e.toString());
                                  }
                                  stopwatch.stop();

                                  // Update the UI
                                  if (mounted) setState(() => recording = false);
                                  stopwatch.reset();

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

                                      await SharePlus.instance.share(
                                        ShareParams(
                                          text: await getCoordinates(
                                            l10n(config),
                                            linkBase: linkType.base,
                                            nullable: true,
                                          ),
                                          files: <XFile>[XFile(mp4Path)],
                                          sharePositionOrigin:
                                              box!.localToGlobal(Offset.zero) & box.size,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    (context.mounted)
                                        ? await ezLogAlert(
                                            config,
                                            context: context,
                                            message: e.toString(),
                                          )
                                        : ezLog(e.toString());
                                  }
                                },
                              )
                            : EzIconButton(
                                config,
                                style: (camera == null)
                                    ? IconButton.styleFrom(
                                        foregroundColor: config.colors.outline,
                                        side: config.borderSide(
                                          color: config.colors.outlineVariant,
                                        ),
                                      )
                                    : IconButton.styleFrom(
                                        foregroundColor: videoColor(config),
                                        side: config.borderSide(color: config.colors.onSurface),
                                      ),
                                icon: Icon(Icons.circle, semanticLabel: l10n(config).hsStartRecord),
                                iconSize: config.iconSize * 2,
                                onLongPress:
                                    camera == null ? () => context.goNamed(settingsHomePath) : null,
                                onPressed: () async {
                                  if (camera == null) {
                                    final bool worked = await initCamera(config);

                                    if (worked) {
                                      if (mounted) setState(() {});
                                    } else {
                                      if (context.mounted) {
                                        ezSnackBar(
                                          config,
                                          context: context,
                                          message: l10n(config).hsCameraSnack,
                                        );
                                      }
                                    }

                                    return;
                                  }

                                  try {
                                    await camera!.startVideoRecording();
                                    stopwatch.start();
                                    if (mounted) setState(() => recording = true);
                                  } catch (e) {
                                    (context.mounted)
                                        ? await ezLogAlert(
                                            config,
                                            context: context,
                                            message: e.toString(),
                                          )
                                        : ezLog(e.toString());
                                  }
                                },
                              ),
                      ),
                      config.separator,

                      // Flash
                      camera == null
                          ? EzIconButton(
                              config,
                              fauxDisabled: true,
                              icon: const Icon(Icons.flash_off),
                              onPressed: () async {
                                final bool worked = await initCamera(config);

                                if (worked) {
                                  if (mounted) setState(() {});
                                } else {
                                  if (context.mounted) {
                                    ezSnackBar(
                                      config,
                                      context: context,
                                      message: l10n(config).hsCameraSnack,
                                    );
                                  }
                                }
                              },
                              onLongPress: () => context.goNamed(settingsHomePath),
                            )
                          : FlashButton(config, camera: camera!),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        isHome: true,
      ),
    );
  }

  // Cleanup //

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        break; // Do nothing

      case AppLifecycleState.hidden:
        final EzCP config = configWatcher(context);

        final bool alreadyRunning = EzCM.get(taskRunningKey);
        final bool active = sosTimer?.isActive == true;

        if (recording) {
          // SOS based on user state/settings
          if (!isIOS && !alreadyRunning && (active || sosOnClose || sosOnInterrupt)) {
            if (active) stopForegroundSOS();
            await startBackgroundSOS(config);
          }

          // Attempt to save the partial recording
          try {
            final XFile video = await camera!.stopVideoRecording();

            // Videos are saved as tmp files
            // We need to fix that before proceeding
            final File tmpFile = File(video.path);

            // Create a unique mp4 file path
            final Directory appDir = await getApplicationDocumentsDirectory();
            final String mp4Path = '${appDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

            // Copy the tmp file to the new mp4
            await tmpFile.copy(mp4Path);

            // Attempt to save the video
            await saveToGallery(mp4Path, false);
          } catch (e) {
            // The app is unfocussed, so we can't do anything
            ezLog('Error saving the partial recording');
            ezLog(e.toString());
          }

          stopwatch.stop();
          stopwatch.reset();
          if (mounted) setState(() => recording = false);
        } else {
          // Not recording
          // SOS based on user state/settings
          if (!isIOS && !alreadyRunning && (active || sosOnClose)) {
            if (active) stopForegroundSOS();
            await startBackgroundSOS(config);
          }
        }
        break;

      case AppLifecycleState.resumed:
        final EzCP config = configWatcher(context);

        // Restore camera
        if (cameraDesc != null) {
          try {
            camera = CameraController(cameraDesc!, ResolutionPreset.max);
            await camera!.initialize();
          } catch (e) {
            if (e is! CameraException || e.code != 'CameraAccessDenied') {
              mounted
                  ? await ezLogAlert(config, context: context, message: e.toString())
                  : ezLog(e.toString());
            }
          }
          if (mounted) setState(() {});
        }

        // Check SOS state
        if (EzCM.get(taskRunningKey) == true) {
          // stopBackgroundSOS handles the async context
          // ignore: use_build_context_synchronously
          await stopBackgroundSOS(config, context: context);
          await startForegroundSOS(config, showSnack: true);
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
