/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';
import '../utils/export.dart';
import '../widgets/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:efui_bios/efui_bios.dart';
import 'package:go_router/go_router.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // Gather the theme data //

  final double margin = EzConfig.get(marginKey);

  final bool isLefty = EzConfig.get(isLeftyKey);

  late final EFUILang el10n = EFUILang.of(context)!;

  // Define the build data //

  late CameraController controller;
  late Future<void> cameraStatus;

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  Future<void> initCamera() async {
    final List<CameraDescription> cameras = await availableCameras();

    controller = CameraController(cameras.first, ResolutionPreset.max);

    cameraStatus = controller.initialize().then((_) {
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
        future: cameraStatus,
        builder: (_, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return EzScreen(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: CameraPreview(controller)),
                    Positioned(
                      top: margin,
                      right: isLefty ? null : margin,
                      left: isLefty ? margin : null,
                      child: EzIconButton(
                        icon: Icon(PlatformIcons(context).settings),
                        onPressed: () => context.goNamed(settingsHomePath),
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
    controller.dispose();
    super.dispose();
  }
}
