/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void showTutorial(BuildContext context) async {
  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: Navigator.of(context).pop,
    onDeny: Navigator.of(context).pop,
  );

  showPlatformDialog(
    context: context,
    builder: (_) => EzAlertDialog(
      title: const Text('Tutorial'),
      content: const Text('Are you not entertained?'),
      materialActions: materialActions,
      cupertinoActions: cupertinoActions,
      needsClose: false,
    ),
  );
}
