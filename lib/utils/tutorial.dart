/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<dynamic> firstEMCMsg(BuildContext context) async {
  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: Navigator.of(context).pop,
    confirmMsg: EFUILang.of(context)!.gContinue,
    onDeny: () => exit(1),
    denyMsg: EFUILang.of(context)!.gCancel,
  );

  return showPlatformDialog(
    context: context,
    builder: (_) => EzAlertDialog(
      title: const Text('Welcome to SOS', textAlign: TextAlign.center),
      content: const Text(
        '''This app is designed to share your evidence and location with emergency contacts in a moment of crisis.

Please choose your first emergency contact.
The contact must have a phone number.

Just one for now, you can add more later.''',
        textAlign: TextAlign.center,
      ),
      materialActions: materialActions,
      cupertinoActions: cupertinoActions,
      needsClose: false,
    ),
  );
}
