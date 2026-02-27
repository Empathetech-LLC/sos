/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';
import '../widgets/export.dart';

import 'package:gal/gal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// Camera //

/// Save the file at [path] to the gallery
/// Includes error handling
Future<void> saveToGallery(String path, bool image) async {
  final bool galAccess = await Gal.requestAccess();
  if (!galAccess) return;

  try {
    image ? await Gal.putImage(path) : await Gal.putVideo(path);
  } catch (e) {
    // If this fails, it's likely the user has bigger problems at hand
    // We can still try to share the file without saving it to the gallery
    ezLog('Error saving to gallery');
    ezLog(e.toString());
  }
}

// Contacts //

/// Open a native contact picker and updates [emc] accordingly
Future<void> addEMC(BuildContext context, {bool loop = true}) async {
  final List<String> currEMC = List<String>.from(emc);

  // Check contact permissions
  final bool contactsGranted =
      await FlutterContacts.requestPermission(readonly: true);

  if (!contactsGranted) {
    // TODO: l10n
    if (context.mounted) {
      ezSnackBar(context, message: 'Cannot add contacts without permission');
    }
    return;
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
        await ezSnackBar(context, message: l10n.hsNumError).closed;
      }
    } else {
      // We have a valid contact, gather the phones with numbers
      final List<Phone> phones = contact.phones
          .where((Phone phone) => phone.number.isNotEmpty)
          .toList();

      if (phones.isEmpty) {
        // No valid numbers, warn the user and optionally retry
        if (context.mounted) {
          await ezSnackBar(context, message: l10n.hsNumError).closed;
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

// Fresh install //

/// Allow the user to enable what parts of InstaSOS they want
/// TODO: l10n and semantics
Future<void> appSetupModal(
  BuildContext context, {
  required Future<PermissionStatus> Function() initCamera,
}) async {
  final bool? setup = await ezModal(
    context: context,
    enableDrag: false,
    isDismissible: false,
    showDragHandle: false,
    builder: (BuildContext mContext) => Padding(
      padding: EdgeInsets.symmetric(horizontal: EzConfig.marginVal),
      child: EzScrollView(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Title
          EzConfig.margin,
          Text(
            l10n.hsWelcome,
            style: EzConfig.styles.titleLarge,
            textAlign: TextAlign.center,
          ),
          EzConfig.margin,

          // Locale setting
          EzLocaleSetting(
            doNothing,
            locales: Lang.supportedLocales,
            skip: <Locale>{arabic, english, chinese}, // Dupes
          ),
          EzConfig.spacer,

          // Have it your way
          Text(
            showTutorial
                ? 'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.'
                : "The latest update was a big one, let's make sure everything is ready below.",
            style: EzConfig.styles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          EzConfig.centerLine,
          Text(
            'You can change your mind/permission at any time.',
            style: EzConfig.styles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          EzConfig.divider,

          // Permission checklist
          CameraSetup(initCamera),
          EzConfig.spacer,

          const ContactsSetup(),
          EzConfig.spacer,

          if (!isIOS) ...<Widget>[
            const SMSSetup(),
            EzConfig.spacer,
          ],

          const LocationSetup(),
          EzConfig.spacer,

          // Finish/leave
          EzTextButton(
            text: 'Done',
            textStyle: EzConfig.styles.bodyLarge
                ?.copyWith(color: EzConfig.colors.primary),
            textAlign: TextAlign.center,
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            onPressed: () => Navigator.of(mContext).pop(true),
          ),
          EzSpacer(space: EzConfig.spargin),
        ],
      ),
    ),
  );

  if (setup == true) await EzConfig.setBool(setupCompleteKey, true);
}

// Permission //

/// Take users to their platform settings if SOS doesn't have the permissions it needs
Future<void> openSOSPermissions() async {
  final PermissionStatus smsPerm =
      isIOS ? PermissionStatus.granted : await Permission.sms.request();
  final LocationPermission geoPerm = await Geolocator.requestPermission();

  if (smsPerm == PermissionStatus.denied ||
      smsPerm == PermissionStatus.permanentlyDenied ||
      geoPerm != LocationPermission.always) {
    await openAppSettings();
  }
}

// SOS //

/// Call the [MethodChannel] to send a foregroundSOS
/// Includes error handling
Future<void> foregroundSOS() async {
  final List<String> currEMC = List<String>.from(emc);
  if (currEMC.isEmpty) return;

  final List<String> numbers = currEMC
      .map((String contact) => contact.split(contactSplit).last)
      .toList();

  final Map<String, dynamic> mapData = <String, dynamic>{
    'message': 'SOS\n${await getCoordinates(linkType.base)}',
    'recipients': isIOS ? numbers : numbers.join(';'),
  };

  ezLog('Sending SOS (foreground)');
  ezLog(mapData.toString());

  try {
    await platform.invokeMethod<void>('foregroundSOS', mapData);
  } catch (e) {
    ezLog(e.toString());
  }
}

/// Gets coordinates from [Geolocator]
/// Returns the coordinates injected into a Google Maps URL
/// Includes error handling
Future<String?> getCoordinates(String linkBase, {bool nullable = false}) async {
  late final String? disabled = nullable ? null : l10n.sosDisabled;
  late final String? denied = nullable ? null : l10n.sosDenied;
  late final String? errored = nullable ? null : l10n.sosError;

  final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return disabled;

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) return denied;

  if (permission == LocationPermission.denied) {
    // Changeably denied, ask again
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return denied;
    }
  }

  try {
    ezLog('Building maps link');
    final Position pos = await Geolocator.getCurrentPosition();
    return '$linkBase${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
  } catch (e) {
    ezLog('Error getting coordinates');
    ezLog(e.toString());
    return errored;
  }
}

/// Android only
/// Call a custom worker factory to send periodic SOS messages
/// Assumes an [emc] null/empty check has already been done
Future<void> startBackgroundSOS() async {
  try {
    final List<String> currEMC = List<String>.from(emc);
    if (currEMC.isEmpty) return;

    final List<String> numbers = currEMC
        .map((String contact) => contact.split(contactSplit).last)
        .toList();

    await platform.invokeMethod<void>(
      'backgroundSOS',
      <String, dynamic>{
        'recipients': numbers.join(';'),
        'heading': 'SOS - ${l10n.sosLastKnown}',
      },
    );
  } catch (e) {
    ezLog(e.toString());
    // We still want to continue. Could be a partial success
  }
  await EzConfig.setBool(taskRunningKey, true);
}

/// Android only
/// Safe to send [context], a mounted check is included
Future<void> stopBackgroundSOS(BuildContext context) async {
  try {
    await platform.invokeMethod<void>('cancelBackgroundSOS');
  } catch (e) {
    // Improvement: check the error code
    // The most likely error is that the task is already stopped
    // But there could be scenarios where taskRunningKey should remain true
    context.mounted
        ? await ezLogAlert(context, message: e.toString())
        : ezLog(e.toString());
  }
  await EzConfig.setBool(taskRunningKey, false);
}
