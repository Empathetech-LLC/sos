/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<dynamic> firstEMCMsg(BuildContext context) async {
  final Lang l10n = Lang.of(context)!;
  final EFUILang el10n = EFUILang.of(context)!;

  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: Navigator.of(context).pop,
    confirmMsg: el10n.gContinue,
    onDeny: () => exit(1),
    denyMsg: el10n.gCancel,
  );

  return showPlatformDialog(
    context: context,
    builder: (_) => EzAlertDialog(
      title: Text(l10n.hsWelcome, textAlign: TextAlign.center),
      content: Text(l10n.hsAppTutorial, textAlign: TextAlign.center),
      materialActions: materialActions,
      cupertinoActions: cupertinoActions,
      needsClose: false,
    ),
  );
}

Future<dynamic> cameraMsg(BuildContext context) async {
  final Lang l10n = Lang.of(context)!;
  final EFUILang el10n = EFUILang.of(context)!;

  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: () => Navigator.of(context).pop(true),
    confirmMsg: el10n.gContinue,
    onDeny: () => Navigator.of(context).pop(false),
    denyMsg: el10n.gCancel,
  );

  return showPlatformDialog(
    context: context,
    builder: (_) => EzAlertDialog(
      content: Text(l10n.hsCameraTutorial, textAlign: TextAlign.center),
      materialActions: materialActions,
      cupertinoActions: cupertinoActions,
      needsClose: false,
    ),
  );
}
