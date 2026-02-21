/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class CameraCard extends StatefulWidget {
  final Future<PermissionStatus> Function() initCamera;

  const CameraCard(this.initCamera, {super.key});

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  // Define the build data //

  PermissionStatus? perm;

  Widget get icon {
    switch (perm) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        return Icon(
          Icons.check_circle_outline,
          color: EzConfig.colors.primary,
        );
      case PermissionStatus.restricted:
        return Icon(
          Icons.cancel_outlined,
          color: EzConfig.colors.outline,
        );
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
        return Icon(
          Icons.cancel_outlined,
          color: EzConfig.colors.error,
        );
      case null:
        return Icon(
          Icons.help_outline,
          color: EzConfig.colors.primary,
        );
    }
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => Card(
        child: EzRow(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Camera & Microphone',
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Enables video recording (and picture taking)',
                    style: EzConfig.styles.labelLarge,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            EzConfig.rowSpacer,
            EzIconButton(
                onPressed: () async {
                  final PermissionStatus result = await widget.initCamera();
                  if (perm != result) setState(() => perm = result);
                },
                icon: icon),
          ],
        ),
      );
}
