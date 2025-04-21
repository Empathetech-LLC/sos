/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

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
  Widget build(BuildContext context) {
    final Lang l10n = Lang.of(context)!;

    return EzIconButton(
      icon: switch (camera.value.flashMode) {
        FlashMode.off => Icon(
            Icons.flash_off,
            semanticLabel: l10n.hsFlashOff,
          ),
        FlashMode.auto => Icon(
            Icons.flash_auto,
            semanticLabel: l10n.hsFlashAuto,
          ),
        FlashMode.always => Icon(
            Icons.flash_on,
            semanticLabel: l10n.hsFlashOn,
          ),
        FlashMode.torch => Icon(
            Icons.flashlight_on,
            semanticLabel: l10n.hsFlashTorch,
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
}
