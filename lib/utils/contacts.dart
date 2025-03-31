/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// Prompt the user to save their first contact
/// Users must select at least one emergency contact to use the app
Future<List<String>?> addEMC(BuildContext context, List<String>? curr) async {
  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = EFUILang.of(context)!;

  // Check for first run
  if (curr == null || curr.isEmpty) {
    curr = <String>[];
    await firstEMCMsg(context);
  }

  // Check contact permissions
  final bool contactsGranted =
      await FlutterContacts.requestPermission(readonly: true);

  // If denied: re-iterate that SOS is useless without contacts, and exit
  if (!contactsGranted) {
    if (context.mounted) {
      ezLogAlert(
        context,
        title: el10n.gAttention,
        message: l10n.hsNeedContacts,
        customActions: (
          <EzMaterialAction>[
            EzMaterialAction(text: l10n.gOk, onPressed: () => exit(0))
          ],
          <EzCupertinoAction>[
            EzCupertinoAction(text: l10n.gOk, onPressed: () => exit(0))
          ],
        ),
      );
    }
    return curr;
  }

  // Save the first emergency contact
  Contact? contact;
  while (true) {
    contact = await FlutterContacts.openExternalPick();

    if (contact == null ||
        (contact.phones.isEmpty || contact.phones.first.number.isEmpty)) {
      if (context.mounted) {
        await ezSnackBar(
          context: context,
          message: l10n.hsNoNumber,
        ).closed;
      }
    } else {
      break;
    }
  }

  curr.add(contact.phones.first.number);
  await EzConfig.setStringList(emcKey, curr);
  return curr;
}
