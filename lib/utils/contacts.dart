/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// Prompt the user to save their first contact
/// Users must select at least one emergency contact to use the app
/// Include error handling
Future<List<String>?> addEMC(
  BuildContext context,
  List<String>? curr, {
  bool loop = true,
}) async {
  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = EFUILang.of(context)!;

  // Check for first run
  if (curr == null || curr.isEmpty) {
    curr = <String>[];
    await firstContactMsg(context);
  }

  // Check contact permissions
  final bool contactsGranted =
      await FlutterContacts.requestPermission(readonly: true);

  // If denied: re-iterate that SOS is useless without contacts, and exit
  while (!contactsGranted) {
    if (context.mounted) {
      await ezLogAlert(
        context,
        title: el10n.gError,
        message: l10n.hsNeedContacts,
        customActions: (
          <EzMaterialAction>[
            EzMaterialAction(text: el10n.gCancel, onPressed: () => exit(0)),
            EzMaterialAction(
              text: l10n.gOk,
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ],
          <EzCupertinoAction>[
            EzCupertinoAction(text: el10n.gCancel, onPressed: () => exit(0)),
            EzCupertinoAction(
              text: l10n.gOk,
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ],
        ),
      );
    } else {
      // This also runs when the app returns to the foreground
      // I think
      // So check if permission was granted in the meantime
      if (await Permission.contacts.isDenied ||
          await Permission.contacts.isPermanentlyDenied) {
        exit(0);
      }
    }
  }

  // Save the first emergency contact
  Contact? contact;
  while (true) {
    contact = await FlutterContacts.openExternalPick();

    if (contact == null ||
        (contact.phones.isEmpty || contact.phones.first.number.isEmpty)) {
      if (context.mounted) {
        // Invalid contact, warn the user and optionally retry
        await ezSnackBar(
          context: context,
          message: l10n.hsNoNumber,
        ).closed;
      }
    } else if (curr.contains(contact.phones.first.number)) {
      // Contact already exists, exit func with no changes
      return curr;
    } else {
      // Valid contact, escape the loop
      break;
    }

    if (!loop) return curr;
  }

  curr.add(contact.phones.first.number);
  await EzConfig.setStringList(emcKey, curr);
  return curr;
}
