/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';
import 'package:efui_bios/efui_bios.dart';

import 'dart:io';
import 'dart:async';
import 'package:gal/gal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:after_layout/after_layout.dart';
import 'package:path_provider/path_provider.dart';
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
  // Gather the fixed theme data //

  // Layout
  late final double safeTop = MediaQuery.paddingOf(context).top;
  late final double safeBottom = MediaQuery.paddingOf(context).bottom;

  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double spacing = EzConfig.get(spacingKey);
  late final double spargin = spacing + margin;

  static const EzSeparator separator = EzSeparator();

  final double iconSize = EzConfig.get(iconSizeKey);
  final bool isLefty = EzConfig.get(isLeftyKey);

  // Color

  final Color videoColor = Color(EzConfig.get(videoColorKey));
  late final Color videoTextColor = getTextColor(videoColor);

  // Text
  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

  // Define the build data //

  // Core
  /// EMergency Contacts; [List] of phone number [String]s
  List<String>? emc = EzConfig.get(emcKey);

  bool broadcasting = false; // TODO: consolidate these two?
  Timer? sosTimer;

  final bool sosOnOpen = EzConfig.get(onOpenKey);
  final bool sosOnClose = EzConfig.get(onCloseKey);
  final bool sosOnInterrupt = EzConfig.get(onInterruptKey);

  final bool autoShare = EzConfig.get(autoShareKey);

  // Tutorial
  final OverlayPortalController broadcastOverlay =
      OverlayPortalController(debugLabel: 'broadcast');
  final OverlayPortalController settingsOverlay =
      OverlayPortalController(debugLabel: 'settings');
  final OverlayPortalController recordOverlay =
      OverlayPortalController(debugLabel: 'record');

  // Camera
  CameraDescription? cameraDesc;
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
    await Permission.microphone.request();

    final List<CameraDescription> cameras = await availableCameras();
    cameraDesc = cameras.first;

    try {
      camera = CameraController(cameraDesc!, ResolutionPreset.max);
      await camera!.initialize();
      return true;
    } catch (e) {
      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        if (mounted) ezLogAlert(context, message: e.toString());
      }
    }

    return false;
  }

  /// [foregroundSOS] every 5 minutes
  Future<void> startForegroundSOS() async {
    sosTimer?.cancel();

    // Send an immediate SOS
    await foregroundSOS(emc, l10n);

    // Initiate a periodic SOS
    sosTimer = Timer.periodic(
      const Duration(minutes: 5),
      (_) => foregroundSOS(emc, l10n),
    );

    setState(() => broadcasting = true);
  }

  /// nullify the [sosTimer] and set [broadcasting] to false
  void stopForegroundSOS() {
    sosTimer?.cancel();
    sosTimer = null;
    setState(() => broadcasting = false);
  }

  /// Assumes an [emc] null/empty check has already been done
  Future<void> startBackgroundSOS() async {
    try {
      await backgroundSOS(emc!, l10n);
    } catch (e) {
      ezLog(e.toString());
      // We still want to continue. Could be a partial success...
      // and setting taskRunningKey to true will trigger foregroundSOS when the app is resumed
    }
    await EzConfig.setBool(taskRunningKey, true);
  }

  Future<void> stopBackgroundSOS() async {
    try {
      await cancelBackgroundSOS();
    } catch (e) {
      if (mounted) {
        await ezLogAlert(context, message: e.toString());
        // Improvement: check the error code
        // The most likely error is that the task is already stopped
        // But there are theoretical scenarios where taskRunningKey should remain true
      }
    }
    await EzConfig.setBool(taskRunningKey, false);
  }

  /// Take users to their platform settings if SOS doesn't have the permissions it needs
  Future<void> openSOSPermissions() async {
    final PermissionStatus smsPerm = Platform.isIOS
        ? PermissionStatus.granted
        : await Permission.sms.request();
    final LocationPermission geoPerm = await Geolocator.requestPermission();

    if (smsPerm == PermissionStatus.denied ||
        smsPerm == PermissionStatus.permanentlyDenied ||
        geoPerm != LocationPermission.always) {
      await openAppSettings();
    }
  }

  /// Save the file at [path] to the gallery
  /// Includes error handling
  Future<void> saveToGallery(String path, bool image) async {
    final bool galAccess = await Gal.requestAccess();

    if (galAccess) {
      try {
        image ? await Gal.putImage(path) : await Gal.putVideo(path);
      } catch (e) {
        // If this fails, it's likely the user has bigger problems at hand
        // We can still try to share the file without saving it to the gallery
        ezLog('Error saving to gallery');
        ezLog(e.toString());
      }
    }
  }

  // Init //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    final bool newUser = emc == null || emc!.isEmpty;

    // Verify the emergency contacts
    if (newUser) emc = await addEMC(context, emc);

    // Check for auto SOS
    final bool taskRunning = EzConfig.get(taskRunningKey);

    if (taskRunning) await stopBackgroundSOS();
    if (sosOnOpen || taskRunning) await startForegroundSOS();

    // Setup the camera/preview
    if (newUser && context.mounted) {
      // Allow new users to opt out of camera requests their first time
      if (await permissionsMsg(context) == true) await initCamera();
      // Currently, this is just to avoid potential 'request overload'
      // Users will be asked again later (in the else below)
    } else {
      await initCamera();
    }
    if (mounted) setState(() {});

    // Run the tutorial (if unfinished)
    if (EzConfig.get(tutorialKey) == true) broadcastOverlay.show();
  }

  @override
  Widget build(BuildContext context) {
    // Gather the dynamic theme data //

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color rightsBackgroundColor = Theme.of(context)
        .textButtonTheme
        .style!
        .backgroundColor!
        .resolve(<WidgetState>{WidgetState.focused})!;

    // Return the build //

    return SosScaffold(
      Stack(
        children: <Widget>[
          // Camera preview and rights view
          Center(
            child: GestureDetector(
              onLongPress: () => setState(() => showRights = !showRights),
              child: Container(
                height: heightOf(context) * 0.667,
                width: double.infinity,
                color: colorScheme.surface,
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
                            color: rightsBackgroundColor,
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
                overlayChildBuilder: (_) => EzTutorial(
                  top: safeTop + spargin + iconSize * 1.5 + spacing,
                  left: 0,
                  right: 0,
                  title: '3/5',
                  content: Platform.isIOS
                      ? l10n.hsIOSBroadcastTutorial
                      : l10n.hsBroadcastTutorial,
                  acceptMessage: l10n.gOk,
                  onAccept: () async {
                    broadcastOverlay.hide();
                    if (!Platform.isIOS) await Permission.sms.request();
                    final LocationPermission choice =
                        await Geolocator.requestPermission();

                    if (choice == LocationPermission.whileInUse &&
                        Platform.isAndroid &&
                        context.mounted) {
                      final (
                        List<EzMaterialAction>,
                        List<EzCupertinoAction>
                      ) customActions = ezActionPairs(
                        context: context,
                        onConfirm: () async {
                          await openAppSettings();
                          if (context.mounted) Navigator.of(context).pop();
                        },
                        confirmMsg: l10n.gOk,
                        onDeny: () => Navigator.of(context).pop(false),
                        denyMsg: el10n.gNo,
                      );

                      await showDialog(
                        context: context,
                        builder: (_) => EzAlertDialog(
                          title: Text(
                            l10n.hsPermissionsTutorialTitle,
                            textAlign: TextAlign.center,
                          ),
                          contents: <Widget>[
                            Text(
                              l10n.hsPermissionsAlways,
                              textAlign: TextAlign.center,
                            )
                          ],
                          materialActions: customActions.$1,
                          cupertinoActions: customActions.$2,
                          needsClose: false,
                        ),
                      );
                    }

                    settingsOverlay.show();
                  },
                ),
                child: broadcasting
                    ? EzIconButton(
                        icon: const SOSIcon(),
                        iconSize: iconSize * 1.5,
                        onPressed: stopForegroundSOS,
                        onLongPress: openSOSPermissions,
                      )
                    : EzIconButton(
                        icon: Icon(Icons.sos, semanticLabel: l10n.hsStartSOS),
                        iconSize: iconSize * 1.5,
                        onPressed: () async {
                          final PermissionStatus smsStatus = Platform.isIOS
                              ? PermissionStatus.granted
                              : await Permission.sms.request();

                          if (smsStatus == PermissionStatus.denied ||
                              smsStatus == PermissionStatus.permanentlyDenied) {
                            if (context.mounted) {
                              await ezLogAlert(
                                context,
                                message: l10n.sosNeedSMS,
                              );
                            }
                            return;
                          }

                          await startForegroundSOS();
                        },
                        onLongPress: openSOSPermissions,
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
              overlayChildBuilder: (_) => EzTutorial(
                top: safeTop + margin,
                right: isLefty ? 0 : margin + iconSize + spacing,
                left: isLefty ? margin + iconSize + spacing : 0,
                title: '4/5',
                content: l10n.hsSettingsTutorial,
                acceptMessage: l10n.gOk,
                onAccept: () {
                  settingsOverlay.hide();
                  recordOverlay.show();
                },
              ),
              child: EzIconButton(
                icon: Icon(
                  PlatformIcons(context).settings,
                  semanticLabel: el10n.ssPageTitle,
                ),
                enabled: !recording,
                onPressed: () => context.goNamed(settingsHomePath),
                onLongPress: () => ezFeedback(
                  parentContext: context,
                  l10n: el10n,
                  supportEmail: empathSupport,
                  appName: appName,
                ),
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
                icon: Icon(
                  PlatformIcons(context).thumbUp,
                  semanticLabel: l10n.hsSafeCloseHint,
                ),
                enabled: !recording,
                onPressed: () {
                  if (broadcasting) stopForegroundSOS();
                  exit(0);
                },
              ),
            ),
          ),

          // Controls
          Positioned(
            bottom: spacing,
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
                                  PlatformIcons(context).eyeSlash,
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
                            PlatformIcons(context).photoCamera,
                            semanticLabel: l10n.hsCameraHint,
                          ),
                          onPressed: () async {
                            try {
                              // Take a picture
                              final XFile image = await camera!.takePicture();

                              // Attempt to save the image
                              await saveToGallery(image.path, true);

                              // Attempt to share (config based)
                              if (autoShare) {
                                await SharePlus.instance.share(ShareParams(
                                  text: await getCoordinates(l10n),
                                  files: <XFile>[image],
                                ));
                              }
                            } catch (e) {
                              if (context.mounted) {
                                await ezLogAlert(
                                  context,
                                  message: e.toString(),
                                );
                              }
                            }
                          },
                        ),
                  separator,

                  // Record
                  OverlayPortal(
                    controller: recordOverlay,
                    overlayChildBuilder: (_) => EzTutorial(
                      bottom: safeBottom + spargin + iconSize * 2 + spacing,
                      left: 0,
                      right: 0,
                      title: '5/5',
                      content: camera == null
                          ? Platform.isIOS
                              ? l10n.hsIOSRightsTutorial
                              : l10n.hsRightsTutorial
                          : Platform.isIOS
                              ? l10n.hsIOSVideoTutorial
                              : l10n.hsVideoTutorial,
                      acceptMessage: l10n.gOk,
                      onAccept: () async {
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
                            icon: Icon(
                              Icons.stop,
                              semanticLabel: l10n.hsEndRecord,
                            ),
                            iconSize: iconSize * 2,
                            onPressed: () async {
                              late final XFile? video;
                              try {
                                // Stop recording
                                video = await camera!.stopVideoRecording();
                              } catch (e) {
                                if (context.mounted) {
                                  await ezLogAlert(
                                    context,
                                    message: e.toString(),
                                  );
                                }
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
                                if (autoShare) {
                                  await SharePlus.instance.share(ShareParams(
                                    text: await getCoordinates(l10n),
                                    files: <XFile>[XFile(mp4Path)],
                                  ));
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  await ezLogAlert(
                                    context,
                                    message: e.toString(),
                                  );
                                }
                              }
                            },
                          )
                        : EzIconButton(
                            style: IconButton.styleFrom(
                              foregroundColor: videoColor,
                              side: BorderSide(color: colorScheme.onSurface),
                            ),
                            icon: Icon(
                              Icons.circle,
                              semanticLabel: l10n.hsStartRecord,
                            ),
                            iconSize: iconSize * 2,
                            onPressed: () async {
                              if (camera == null) {
                                final bool hasAccess = await initCamera();

                                if (hasAccess) {
                                  setState(() {});
                                } else {
                                  return;
                                }
                              }

                              try {
                                await camera!.startVideoRecording();
                                watch.start();

                                setState(() => recording = true);
                              } catch (e) {
                                if (context.mounted) {
                                  await ezLogAlert(
                                    context,
                                    message: e.toString(),
                                  );
                                }
                              }
                            },
                            onLongPress: () async {
                              if (camera == null) {
                                await openAppSettings();
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
      case AppLifecycleState.paused:
        break; // Do nothing

      case AppLifecycleState.inactive:
        camera?.dispose();
        camera = null;
        break;

      case AppLifecycleState.hidden:
        final bool alreadyRunning = EzConfig.get(taskRunningKey);

        if (recording) {
          // SOS based on user state/settings
          if (Platform.isAndroid &&
              !alreadyRunning &&
              (broadcasting || sosOnClose || sosOnInterrupt)) {
            if (broadcasting) stopForegroundSOS();
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
          if (Platform.isAndroid &&
              !alreadyRunning &&
              (broadcasting || sosOnClose)) {
            if (broadcasting) stopForegroundSOS();
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
              if (mounted) ezLogAlert(context, message: e.toString());
            }
          }
          if (mounted) setState(() {});
        }

        // Check SOS state
        if (EzConfig.get(taskRunningKey) == true) {
          await stopBackgroundSOS();
          await startForegroundSOS();
        }
        break;
    }
  }

  @override
  void dispose() {
    sosTimer?.cancel();
    sosTimer = null;
    camera?.dispose();
    camera = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
