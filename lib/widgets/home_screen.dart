/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class FlashButton extends StatefulWidget {
  final CameraController camera;

  /// [EzIconButton] for toggling the [camera]s [FlashMode]
  const FlashButton(this.camera, {super.key});

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  bool works = true;

  @override
  Widget build(BuildContext context) {
    return EzIconButton(
      enabled: works,
      icon: switch (widget.camera.value.flashMode) {
        FlashMode.off => Icon(Icons.flash_off, semanticLabel: l10n.hsFlashOff),
        FlashMode.auto =>
          Icon(Icons.flash_auto, semanticLabel: l10n.hsFlashAuto),
        FlashMode.always => Icon(Icons.flash_on, semanticLabel: l10n.hsFlashOn),
        FlashMode.torch =>
          Icon(Icons.flashlight_on, semanticLabel: l10n.hsFlashTorch),
      },
      onPressed: () async {
        try {
          switch (widget.camera.value.flashMode) {
            case FlashMode.off:
              try {
                await widget.camera.setFlashMode(FlashMode.auto);
              } catch (_) {
                await widget.camera.setFlashMode(FlashMode.torch);
              }
              break;
            case FlashMode.auto:
              try {
                await widget.camera.setFlashMode(FlashMode.always);
              } catch (_) {
                await widget.camera.setFlashMode(FlashMode.torch);
              }
              break;
            case FlashMode.always:
              await widget.camera.setFlashMode(FlashMode.torch);
              break;
            case FlashMode.torch:
              await widget.camera.setFlashMode(FlashMode.off);
              break;
          }
          setState(() {});
        } catch (e) {
          if (context.mounted) await ezLogAlert(context, message: e.toString());
          setState(() => works = false);
        }
      },
    );
  }
}

class SOSIcon extends StatefulWidget {
  const SOSIcon({super.key});

  @override
  State<SOSIcon> createState() => _PulsingIconWidgetState();
}

class _PulsingIconWidgetState extends State<SOSIcon>
    with SingleTickerProviderStateMixin {
  // Define the animation data //

  late AnimationController controller;
  late Animation<double> ping;

  // Init //

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    ping = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.repeat(reverse: true);
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: ping,
        builder: (_, __) => Icon(
          ping.value < 0.5 ? Icons.notifications : Icons.notifications_active,
          semanticLabel: l10n.hsEndSOS,
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
