/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// Explains InstaSOS
/// App closes on cancel
Future<dynamic> firstContactMsg(BuildContext context) => showDialog(
      context: context,
      builder: (_) => EzAlertDialog(
        title: Text(l10n.hsWelcome, textAlign: TextAlign.center),
        content: Text(l10n.hsAppTutorial, textAlign: TextAlign.center),
        actions: ezActionPair(
          context: context,
          onConfirm: Navigator.of(context).pop,
          confirmIsDefault: true,
          confirmMsg: EzConfig.l10n.gContinue,
          onDeny: () => exit(0),
          denyIsDestructive: true,
          denyMsg: EzConfig.l10n.gCancel,
        ),
        needsClose: false,
      ),
    );

/// Warns about future permissions
/// Returns false if the user would rather skip
Future<dynamic> permissionsMsg(BuildContext context) => showDialog(
      context: context,
      builder: (_) => EzAlertDialog(
        title:
            Text(l10n.hsPermissionsTutorialTitle, textAlign: TextAlign.center),
        content: Text(l10n.hsPermissionsTutorial, textAlign: TextAlign.center),
        actions: ezActionPair(
          context: context,
          onConfirm: () => Navigator.of(context).pop(true),
          confirmIsDefault: true,
          confirmMsg: l10n.gOk,
          onDeny: () => Navigator.of(context).pop(false),
          denyMsg: EzConfig.l10n.gNo,
        ),
        needsClose: false,
      ),
    );
