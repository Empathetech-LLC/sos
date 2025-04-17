/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../screens/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsButton extends StatelessWidget {
  final BuildContext parentContext;

  /// [EzMenuButton] for opening the settings
  const SettingsButton(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) => EzMenuButton(
        onPressed: () => parentContext.goNamed(settingsHomePath),
        icon: EzIcon(
          PlatformIcons(context).settings,
          semanticLabel: 'Settings',
        ),
        label: EFUILang.of(context)!.ssPageTitle,
      );
}

class FlashButton extends StatelessWidget {
  final CameraController camera;

  /// setState((){})
  final void Function() stateCallback;

  /// [EzIconButton] for toggling the [camera]s [FlashMode]
  const FlashButton({
    super.key,
    required this.camera,
    required this.stateCallback,
  });

  @override
  Widget build(BuildContext context) => EzIconButton(
        icon: switch (camera.value.flashMode) {
          FlashMode.off => const Icon(
              Icons.flash_off,
              semanticLabel: 'Off',
            ),
          FlashMode.auto => const Icon(
              Icons.flash_auto,
              semanticLabel: 'Auto',
            ),
          FlashMode.always => const Icon(
              Icons.flash_on,
              semanticLabel: 'Always',
            ),
          FlashMode.torch => const Icon(
              Icons.flashlight_on,
              semanticLabel: 'Torch',
            ),
        },
        onPressed: () async {
          switch (camera.value.flashMode) {
            case FlashMode.off:
              await camera.setFlashMode(FlashMode.auto);
              break;
            case FlashMode.auto:
              await camera.setFlashMode(FlashMode.always);
              break;
            case FlashMode.always:
              await camera.setFlashMode(FlashMode.off);
              break;
            case FlashMode.torch:
              await camera.setFlashMode(FlashMode.off);
              break;
          }
          stateCallback.call();
        },
      );
}
