/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

// ignore_for_file: dead_code
// The exit(0) confuses the linter for some reason... it only runs on a button press

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:efui_bios/efui_bios.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // Gather the theme data //

  final double iconSize = EzConfig.get(iconSizeKey);
  final double margin = EzConfig.get(marginKey);
  final double spacing = EzConfig.get(spacingKey);

  final bool isLefty = EzConfig.get(isLeftyKey);

  late final EFUILang el10n = EFUILang.of(context)!;

  // Define the build data //

  late CameraController camControl;
  late Future<void> camStatus;

  bool recording = false;
  final Stopwatch watch = Stopwatch();

  final bool notifyOnClose = EzConfig.get(onCloseKey) ?? false;

  // Define custom functions //

  Future<void> initCamera() async {
    final List<CameraDescription> cameras = await availableCameras();

    camControl = CameraController(cameras.first, ResolutionPreset.max);

    camStatus = camControl.initialize().then((_) {
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

  Future<String> getCoordinates() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return 'Cannot access location (disabled)';

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Cannot access location (denied)';
      }
    } else if (permission == LocationPermission.deniedForever) {
      return 'Cannot access location (denied)';
    }

    final Position pos = await Geolocator.getCurrentPosition();
    return pos.toString();
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
    initCamera();
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
                    Positioned.fill(child: CameraPreview(camControl)),

                    // Record timer
                    Positioned(
                      top: margin,
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
                              return EzText(elapsed.toString());
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
                      child: EzIconButton(
                        icon: Icon(PlatformIcons(context).settings),
                        onPressed: () => context.goNamed(settingsHomePath),
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
                          onPressed: exit(0),
                        ),
                      ),
                    ),

                    // Controls
                    Positioned(
                      bottom: margin + spacing,
                      left: 0,
                      right: 0,
                      child: EzRow(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Capture
                          EzIconButton(
                            icon: Icon(
                              PlatformIcons(context).photoCamera,
                              size: iconSize * 1.5,
                            ),
                            onPressed: () async {
                              try {
                                final XFile image =
                                    await camControl.takePicture();

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
                          const EzSeparator(),

                          // Record
                          EzIconButton(
                            icon: Icon(
                              Icons.circle,
                              size: iconSize * 2,
                              color: Colors.red,
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
                                      final XFile video =
                                          await camControl.stopVideoRecording();

                                      setState(() => recording = false);
                                      watch.stop();
                                      watch.reset();

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
