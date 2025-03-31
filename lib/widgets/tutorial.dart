/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class TutorialOverlay extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  final String content;
  final void Function() accept;

  const TutorialOverlay({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.content,
    required this.accept,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: EzAlertDialog(
          content: Text(content, textAlign: TextAlign.center),
          materialActions: <EzMaterialAction>[
            EzMaterialAction(text: Lang.of(context)!.gOk, onPressed: accept)
          ],
          cupertinoActions: <EzCupertinoAction>[
            EzCupertinoAction(text: Lang.of(context)!.gOk, onPressed: accept)
          ],
          needsClose: false,
        ),
      );
}
