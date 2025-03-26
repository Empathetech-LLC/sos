/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';
import '../widgets/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // Define the build data //

  late CameraController controller;

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, appTitle);
  }

  @override
  void initState() {
    super.initState();
    getCamera();
  }

  void getCamera() async {
    final List<CameraDescription> cameras = await availableCameras();

    controller = CameraController(cameras.first, ResolutionPreset.max);
    controller.initialize().then((_) {
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

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      showAppBar: false,
      title: appTitle,
      body: EzScreen(child: CameraPreview(controller)),
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
