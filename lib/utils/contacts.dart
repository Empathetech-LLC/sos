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

/// :
const String contactSplit = ':';

/// Prompt the user to save their first contact
/// Users must select at least one emergency contact to use the app
/// Include error handling
Future<List<String>?> addEMC(
  BuildContext context,
  List<String>? curr, {
  required Lang l10n,
  required EFUILang el10n,
  bool loop = true,
}) async {
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
              onPressed: () => openAppSettings(),
            ),
          ],
          <EzCupertinoAction>[
            EzCupertinoAction(text: el10n.gCancel, onPressed: () => exit(0)),
            EzCupertinoAction(
              text: l10n.gOk,
              onPressed: () => openAppSettings(),
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

  // Permission granted, make it so
  Contact? contact;
  String? initials;
  String? number;

  while (true) {
    contact = await FlutterContacts.openExternalPick();

    // Check for user cancel
    if (contact == null) {
      if (loop) continue; // else...
      return curr;
    }

    if (contact.phones.isEmpty) {
      if (context.mounted) {
        // Invalid contact, warn the user and optionally retry
        await ezSnackBar(
          context: context,
          message: l10n.hsNumError,
        ).closed;
      }
    } else {
      // We have a valid contact, now validate the phone number
      number = contact.phones
          .firstWhere((Phone phone) => phone.number.isNotEmpty,
              orElse: () => contact!.phones.first)
          .number;

      if (number.isEmpty) {
        if (context.mounted) {
          await ezSnackBar(
            context: context,
            message: l10n.hsNumError,
          ).closed;
        }
      } else {
        // We have a number, remove any dupes then break the loop
        curr.removeWhere((String emc) => emc.contains(number!));
        break;
      }
    }

    if (!loop) return curr;
  }

  initials = contact.displayName.isNotEmpty
      ? contact.displayName
              .split(' ')
              .where((String name) => name.isNotEmpty)
              .map((String name) => name[0].toUpperCase())
              .join() +
          contactSplit
      : '';

  curr.add(initials + number);
  await EzConfig.setStringList(emcKey, curr);
  return curr;
}
