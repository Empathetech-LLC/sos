/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Explains InstaSOS
/// App closes on cancel
Future<dynamic> firstContactMsg(BuildContext context) {
  final Lang l10n = Lang.of(context)!;
  final EFUILang el10n = ezL10n(context);

  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: Navigator.of(context).pop,
    confirmIsDefault: true,
    confirmMsg: el10n.gContinue,
    onDeny: () => exit(0),
    denyIsDestructive: true,
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

/// Warns about future permissions
/// Returns false if the user would rather skip
Future<dynamic> permissionsMsg(BuildContext context) {
  final Lang l10n = Lang.of(context)!;
  final EFUILang el10n = ezL10n(context);

  final (
    List<EzMaterialAction> materialActions,
    List<EzCupertinoAction> cupertinoActions
  ) = ezActionPairs(
    context: context,
    onConfirm: () => Navigator.of(context).pop(true),
    confirmIsDefault: true,
    confirmMsg: l10n.gOk,
    onDeny: () => Navigator.of(context).pop(false),
    denyMsg: el10n.gNo,
  );

  return showPlatformDialog(
    context: context,
    builder: (_) => EzAlertDialog(
      title: Text(l10n.hsPermissionsTutorialTitle, textAlign: TextAlign.center),
      content: Text(l10n.hsPermissionsTutorial, textAlign: TextAlign.center),
      materialActions: materialActions,
      cupertinoActions: cupertinoActions,
      needsClose: false,
    ),
  );
}
