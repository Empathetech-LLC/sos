/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
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
Future<void> addEMC(BuildContext context, {bool loop = true}) async {
  // Check for first run
  final List<String> currEMC = List<String>.from(emc ?? <String>[]);
  if (currEMC.isEmpty) await firstContactMsg(context);

  // Check contact permissions
  final bool contactsGranted =
      await FlutterContacts.requestPermission(readonly: true);

  // If denied: re-iterate that SOS is useless without contacts, and exit
  while (!contactsGranted) {
    if (context.mounted) {
      await ezLogAlert(
        context,
        title: EzConfig.l10n.gError,
        message: l10n.hsNeedContacts,
        customActions: <EzMaterialAction>[
          EzMaterialAction(
            text: EzConfig.l10n.gCancel,
            onPressed: () => exit(0),
          ),
          EzMaterialAction(
            text: l10n.gOk,
            onPressed: () => openAppSettings(),
          ),
        ],
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
  List<String>? numbers;

  // The way iOS handles partial contacts is hot garbage
  // Best thing we can do is remind users that they will see all contacts, not just the shared ones
  if (isIOS && EzConfig.get(showContactsMsgKey) == true) {
    final bool show = await Permission.contacts.isLimited;

    if (show && context.mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext dContext) => EzAlertDialog(
          title: Text(l10n.gReminder, textAlign: TextAlign.center),
          content: Text(l10n.hsPartialContacts, textAlign: TextAlign.center),
          actions: ezActionPair(
            context: context,
            confirmMsg: l10n.gOk,
            onConfirm: () => Navigator.of(dContext).pop(),
            denyMsg: l10n.gNotAgain,
            onDeny: () async {
              await EzConfig.setBool(showContactsMsgKey, false);
              if (dContext.mounted) Navigator.of(dContext).pop();
            },
            denyIsDestructive: true,
          ),
          needsClose: false,
        ),
      );
    }
  }

  while (true) {
    contact = await FlutterContacts.openExternalPick();

    // Check for user cancel
    if (contact == null) {
      if (loop) continue;
      return;
    }

    if (contact.phones.isEmpty) {
      // Invalid contact, warn the user and optionally retry
      if (context.mounted) {
        await ezSnackBar(context: context, message: l10n.hsNumError).closed;
      }
    } else {
      // We have a valid contact, gather the phones with numbers
      final List<Phone> phones = contact.phones
          .where((Phone phone) => phone.number.isNotEmpty)
          .toList();

      if (phones.isEmpty) {
        // No valid numbers, warn the user and optionally retry
        if (context.mounted) {
          await ezSnackBar(context: context, message: l10n.hsNumError).closed;
        }
      } else {
        // We have at least one valid number, proceed
        numbers = phones.map((Phone phone) => phone.number).toList();

        // Remove dupes
        for (final String number in numbers) {
          currEMC.removeWhere((String emc) => emc.contains(number));
        }
        break;
      }
    }

    if (!loop) return;
  }

  initials = contact.displayName.isNotEmpty
      ? contact.displayName
              .split(' ')
              .where((String name) => name.isNotEmpty)
              .map((String name) => name[0].toUpperCase())
              .join() +
          contactSplit
      : '';

  for (final String number in numbers) {
    currEMC.add(initials + number);
  }

  await EzConfig.setStringList(emcKey, currEMC);
}
