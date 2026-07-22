/* sos
 * Copyright (c) 2025 YWT (Empathetech LLC). All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FlashButton extends StatefulWidget {
  final EzCP config;
  final CameraController camera;

  /// [EzIconButton] for toggling the [camera]s [FlashMode]
  const FlashButton(this.config, {super.key, required this.camera});

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  final Map<FlashMode, bool> working = <FlashMode, bool>{
    FlashMode.off: true,
    FlashMode.auto: true,
    FlashMode.always: true,
    FlashMode.torch: true,
  };

  @override
  Widget build(BuildContext context) => EzIconButton(
        widget.config,
        enabled: working.values.contains(true),
        icon: switch (widget.camera.value.flashMode) {
          FlashMode.off => Icon(Icons.flash_off, semanticLabel: l10n(widget.config).hsFlashOff),
          FlashMode.auto => Icon(Icons.flash_auto, semanticLabel: l10n(widget.config).hsFlashAuto),
          FlashMode.always => Icon(Icons.flash_on, semanticLabel: l10n(widget.config).hsFlashOn),
          FlashMode.torch =>
            Icon(Icons.flashlight_on, semanticLabel: l10n(widget.config).hsFlashTorch),
        },
        onPressed: () async {
          bool hasResult = false;

          while (!hasResult) {
            switch (widget.camera.value.flashMode) {
              case FlashMode.off:
                try {
                  if (working[FlashMode.auto] == true) {
                    await widget.camera.setFlashMode(FlashMode.auto);
                    hasResult = true;
                    break;
                  }
                  // else: continue
                } catch (_) {
                  working[FlashMode.auto] = false;

                  if (!working.values.contains(true)) {
                    hasResult = true;
                    break;
                  }
                  // ditto
                }
              case FlashMode.auto:
                try {
                  if (working[FlashMode.always] == true) {
                    await widget.camera.setFlashMode(FlashMode.always);
                    hasResult = true;
                    break;
                  }
                  // else: continue
                } catch (_) {
                  working[FlashMode.always] = false;

                  if (!working.values.contains(true)) {
                    hasResult = true;
                    break;
                  }
                  // ditto
                }
              case FlashMode.always:
                try {
                  if (working[FlashMode.torch] == true) {
                    await widget.camera.setFlashMode(FlashMode.torch);
                    hasResult = true;
                    break;
                  }
                  // else: continue
                } catch (_) {
                  working[FlashMode.torch] = false;

                  if (!working.values.contains(true)) {
                    hasResult = true;
                    break;
                  }
                  // ditto
                }
              case FlashMode.torch:
                try {
                  if (working[FlashMode.off] == true) {
                    await widget.camera.setFlashMode(FlashMode.off);
                    hasResult = true;
                    break;
                  }
                  // else: continue
                } catch (_) {
                  working[FlashMode.off] = false;

                  if (!working.values.contains(true)) {
                    hasResult = true;
                    break;
                  }
                  // ditto
                }
            }
          }

          if (mounted) setState(() {});
        },
      );
}

class SOSIcon extends StatefulWidget {
  final EzCP config;

  const SOSIcon(this.config, {super.key});

  @override
  State<SOSIcon> createState() => _PulsingIconWidgetState();
}

class _PulsingIconWidgetState extends State<SOSIcon> with SingleTickerProviderStateMixin {
  // Define the animation data //

  late AnimationController controller;
  late Animation<double> ping;

  // Init //

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    ping = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.repeat(reverse: true);
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: ping,
        builder: (_, __) => Icon(
          ping.value < 0.5 ? Icons.notifications : Icons.notifications_active,
          semanticLabel: l10n(widget.config).hsEndSOS,
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
