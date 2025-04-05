/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'dart:io';
import 'dart:async';
import 'package:gal/gal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feedback/feedback.dart';
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
  // Gather the theme data //

  // Layout
  late final double safeTop = MediaQuery.paddingOf(context).top;
  late final double safeBottom = MediaQuery.paddingOf(context).bottom;

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
  Timer? sosTimer;

  final bool sosOnOpen = EzConfig.get(onOpenKey) ?? false;
  final bool sosOnClose = EzConfig.get(onCloseKey) ?? false;
  final bool sosOnInterrupt = EzConfig.get(onInterruptKey) ?? false;

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
    await Permission.microphone.request();

    final List<CameraDescription> cameras = await availableCameras();
    camera = CameraController(cameras.first, ResolutionPreset.max);

    try {
      await camera!.initialize();
      return true;
    } catch (e) {
      if (e is! CameraException || e.code != 'CameraAccessDenied') {
        if (mounted) ezLogAlert(context, message: e.toString());
      }
    }

    return false;
  }

  // Init //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    final bool newUser = emc == null || emc!.isEmpty;

    // Verify the emergency contacts
    if (newUser) emc = await addEMC(context, emc);

    // Check for auto SOS
    if (sosOnOpen) {
      sosTimer?.cancel();
      sosTimer = Timer.periodic(
        const Duration(minutes: 5),
        (_) => sendSOS(),
      );

      setState(() => broadcasting = true);
    }

    // Setup the camera/preview
    if (newUser && context.mounted) {
      // Allow new users to opt out of camera requests their first time
      if (await permissionsMsg(context) == true) await initCamera();
      // Currently, this is just to avoid potential 'request overload'
      // Users will be asked again later (in the else below)
    } else {
      await initCamera();
    }
    setState(() {});

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
              child: SizedBox(
                height: heightOf(context) * 0.667,
                width: double.infinity,
                child: camera == null
                    ? Visibility(
                        visible: showRights,
                        child: const RightsView(),
                      )
                    : Stack(children: <Widget>[
                        CameraPreview(camera!),
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
                    title: '1/3',
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
                            sosTimer?.cancel();
                            sosTimer = null;

                            setState(() => broadcasting = false);
                          },
                          onLongPress: () async {
                            final LocationPermission permission =
                                await Geolocator.checkPermission();
                            if (permission == LocationPermission.denied ||
                                permission ==
                                    LocationPermission.deniedForever) {
                              await openAppSettings();
                            }
                          },
                        )
                      : EzIconButton(
                          icon: const Icon(Icons.sos),
                          iconSize: iconSize * 1.5,
                          onPressed: () {
                            sosTimer?.cancel();
                            sosTimer = Timer.periodic(
                              const Duration(minutes: 5),
                              (_) => sendSOS(),
                            );

                            setState(() => broadcasting = true);
                          },
                          onLongPress: () async {
                            final LocationPermission permission =
                                await Geolocator.checkPermission();
                            if (permission == LocationPermission.denied ||
                                permission ==
                                    LocationPermission.deniedForever) {
                              await openAppSettings();
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
                overlayChildBuilder: (_) => TutorialOverlay(
                  top: safeTop + margin,
                  right: isLefty ? 0 : margin + iconSize + spacing,
                  left: isLefty ? margin + iconSize + spacing : 0,
                  title: '2/3',
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
                              // Take a picture
                              final XFile image = await camera!.takePicture();

                              // Attempt to save the image
                              final bool galAccess = await Gal.requestAccess();
                              if (galAccess) {
                                try {
                                  await Gal.putImage(image.path);
                                } catch (e) {
                                  // If this fails, it's likely the user has bigger problems at hand
                                  // We can still try to share the file without saving it to the gallery
                                  ezLog(e.toString());
                                }
                              }

                              // Attempt to share the image
                              await Share.shareXFiles(
                                <XFile>[image],
                                text: await getCoordinates(l10n),
                              );
                            } catch (e) {
                              // More granularity?
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
                      left: 0,
                      right: 0,
                      title: '3/3',
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
                                final bool galAccess =
                                    await Gal.requestAccess();

                                if (galAccess) {
                                  try {
                                    await Gal.putVideo(mp4Path);
                                  } catch (e) {
                                    // If this fails, it's likely the user has bigger problems at hand
                                    ezLog(e.toString());
                                  }
                                }

                                // Attempt to share the video
                                await Share.shareXFiles(
                                  <XFile>[XFile(mp4Path)],
                                  text: await getCoordinates(l10n),
                                );
                              } catch (e) {
                                // More granularity?
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
                                  ezLogAlert(context, message: e.toString());
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
          ],
        ),
      ),
    );
  }

  // Cleanup //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if ((state == AppLifecycleState.detached ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused)) {
      if (recording) {
        // Start broadcast/send ping based on user settings
        if (broadcasting || sosOnClose || sosOnInterrupt) {
          runBackgroundBroadcast();
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

          await Gal.putVideo(mp4Path);
        } catch (e) {
          // The app is unfocussed, so we can't do anything
          ezLog(e.toString());
        }

        watch.stop();
        watch.reset();
        setState(() => recording = false);
      } else {
        if (broadcasting || sosOnClose) runBackgroundBroadcast();
      }
    }
  }

  @override
  void dispose() {
    sosTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    camera?.dispose();
    super.dispose();
  }
}
