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
import 'package:flutter_contacts/flutter_contacts.dart' as c;
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
  final c.PermissionStatus contactsGranted =
      await c.FlutterContacts.permissions.request(c.PermissionType.read);

  if (!allowedPermCheck(cPermMirror(contactsGranted))) {
    if (context.mounted) {
      ezSnackBar(context, message: l10n.bsNeedPermission);
    }
    return;
  }

  // Permission granted, make it so
  c.Contact? contact;
  String? initials;
  List<String>? numbers;

  // The way iOS handles partial contacts is hot garbage
  // Best thing we can do is remind users that they will see all contacts, not just the shared ones
  if (isIOS && EzConfig.get(showContactsMsgKey) == true) {
    final bool show = await Permission.contacts.isLimited;

    if (show && context.mounted) {
      final bool leaving = await showDialog(
        context: context,
        builder: (BuildContext dContext) => EzAlertDialog(
          title: Text(l10n.gReminder, textAlign: TextAlign.center),
          content: EzRichText(
            <InlineSpan>[
              EzPlainText(
                text: l10n.bsPartialContacts,
                semanticsLabel: l10n.bsPartialContactsFix,
              ),
              EzInlineLink(
                l10n.gSystem.toLowerCase(),
                onTap: () async {
                  Navigator.of(dContext).pop(true);
                  await openAppSettings();
                },
                hint: EzConfig.l10n.gOpenLink,
              ),
              EzPlainText(
                text: '.',
                semanticsLabel: l10n.bsPartialContactsFix,
              ),
            ],
            textBackground: false,
            style: EzConfig.styles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          actions: ezActionPair(
            context: context,
            confirmMsg: l10n.gOk,
            onConfirm: () => Navigator.of(dContext).pop(false),
            confirmIsDefault: true,
            denyMsg: l10n.gNotAgain,
            onDeny: () async {
              await EzConfig.setBool(showContactsMsgKey, false);
              if (dContext.mounted) Navigator.of(dContext).pop(false);
            },
            denyIsDestructive: true,
          ),
          needsClose: false,
        ),
      );

      if (leaving) return;
    }
  }

  while (true) {
    final String? contactID = await c.FlutterContacts.native.showPicker();

    // Check for user cancel
    if (contactID == null) {
      if (loop) continue;
      return;
    }

    try {
      contact = await c.FlutterContacts.get(
        contactID,
        properties: <c.ContactProperty>{
          c.ContactProperty.name,
          c.ContactProperty.identifiers,
          c.ContactProperty.phone,
        },
      );
    } catch (_) {
      if (context.mounted) {
        await ezSnackBar(context, message: l10n.bsNumError).closed;
      }
      if (loop) continue;
      return;
    }

    // Check for failure to retrieve
    if (contact == null) {
      if (loop) continue;
      return;
    }

    if (contact.phones.isEmpty) {
      // Invalid contact, warn the user and optionally retry
      if (context.mounted) {
        await ezSnackBar(context, message: l10n.bsNumError).closed;
      }
    } else {
      // We have a valid contact, gather the phones with numbers
      final List<c.Phone> phones = contact.phones
          .where((c.Phone phone) => phone.number.isNotEmpty)
          .toList();

      if (phones.isEmpty) {
        // No valid numbers, warn the user and optionally retry
        if (context.mounted) {
          await ezSnackBar(context, message: l10n.bsNumError).closed;
        }
      } else {
        // We have at least one valid number, proceed
        numbers = phones.map((c.Phone phone) => phone.number).toList();

        // Remove dupes
        for (final String number in numbers) {
          currEMC.removeWhere((String emc) => emc.contains(number));
        }
        break;
      }
    }

    if (!loop) return;
  }

  initials = (contact.displayName != null && contact.displayName!.isNotEmpty)
      ? contact.displayName!
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

/// I can't believe you've done this @flutter_contacts
/// Even if `notDetermined` is a necessary addition, naming the enum the SAME THING is NOT!
PermissionStatus? cPermMirror(c.PermissionStatus? status) {
  switch (status) {
    case c.PermissionStatus.granted:
      return PermissionStatus.granted;
    case c.PermissionStatus.limited:
      return PermissionStatus.limited;
    case c.PermissionStatus.denied:
      return PermissionStatus.denied;
    case c.PermissionStatus.permanentlyDenied:
      return PermissionStatus.permanentlyDenied;
    case c.PermissionStatus.restricted:
      return PermissionStatus.restricted;
    case c.PermissionStatus.notDetermined:
    case null:
      return null;
  }
}

/// See what I mean?
PermissionStatus? lPermMirror(LocationPermission? status) {
  switch (status) {
    case LocationPermission.always:
    case LocationPermission.whileInUse:
      return PermissionStatus.granted;
    case LocationPermission.denied:
      return PermissionStatus.denied;
    case LocationPermission.deniedForever:
      return PermissionStatus.permanentlyDenied;
    case LocationPermission.unableToDetermine:
    case null:
      return null;
  }
}

// Fresh install //

/// Allow the user to enable what parts of InstaSOS they want
Future<void> appSetupModal(
  BuildContext context, {
  required Future<PermissionStatus> Function() initCamera,
}) async {
  bool locked = false;

  final bool? setup = await ezModal(
    context: context,
    enableDrag: false,
    isDismissible: false,
    showDragHandle: false,
    builder: (BuildContext mContext) => StatefulBuilder(
      builder: (_, StateSetter setModal) => Padding(
        padding: EdgeInsets.symmetric(horizontal: EzConfig.marginVal),
        child: EzScrollView(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Title
            EzConfig.margin,
            Text(
              l10n.hsWelcome,
              semanticsLabel: l10n.hsWelcomeFix,
              style: EzConfig.styles.titleLarge,
              textAlign: TextAlign.center,
            ),
            EzConfig.spacer,

            // Locale setting
            EzLocaleSetting(
              doNothing,
              locales: Lang.supportedLocales,
              skip: <Locale>{arabic, english, chinese}, // Dupes
            ),
            EzConfig.spacer,

            // Have it your way
            Text(
              showTutorial ? l10n.hsAppIntro : l10n.hsAppIntroAlt,
              style: EzConfig.styles.bodyLarge,
              textAlign: TextAlign.center,
            ),
            EzConfig.centerLine,
            Text(
              l10n.hsYourApp,
              style: EzConfig.styles.bodyLarge,
              textAlign: TextAlign.center,
            ),
            EzConfig.divider,

            // Permission checklist
            CameraSetup(
              initCamera: initCamera,
              locked: locked,
              setLock: (bool active) => setModal(() => locked = active),
            ),
            EzConfig.spacer,

            ContactsSetup(
              locked: locked,
              setLock: (bool active) => setModal(() => locked = active),
            ),
            EzConfig.spacer,

            if (!isIOS) ...<Widget>[
              SMSSetup(
                locked: locked,
                setLock: (bool active) => setModal(() => locked = active),
              ),
              EzConfig.spacer,
            ],

            LocationSetup(
              locked: locked,
              setLock: (bool active) => setModal(() => locked = active),
            ),
            EzConfig.spacer,

            // Finish/leave
            EzTextButton(
              text: l10n.gDone,
              textStyle: EzConfig.styles.bodyLarge
                  ?.copyWith(color: EzConfig.colors.primary),
              textAlign: TextAlign.center,
              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: () => Navigator.of(mContext).pop(true),
            ),

            // Hybrid translations notice (conditional)
            EzTranslationsPendingNotice(
              message: l10n.hsHybridTranslation,
              header: EzConfig.spacer,
              footer: const SizedBox.shrink(),
            ),
            EzConfig.separator,
          ],
        ),
      ),
    ),
  );

  if (setup == true) await EzConfig.setBool(setupCompleteKey, true);
}

// SOS //

/// For Android only
/// Call a custom worker factory to send periodic SOS messages
/// Assumes [emc] and permission checks have already been done
/// Handles platform errors
Future<void> backgroundSOS() async {
  final List<String> currEMC = List<String>.from(emc);
  if (currEMC.isEmpty) return;

  final List<String> numbers = currEMC
      .map((String contact) => contact.split(contactSplit).last)
      .toList();

  try {
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

/// For Android only
/// Safe to send [context], a mounted check is included
/// Handles platform errors, no other checks are required
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

/// Call the [MethodChannel] to send a foregroundSOS
/// Assumes [emc] and permission checks have already been done
/// Handles platform errors
Future<bool> foregroundSOS() async {
  final List<String> currEMC = List<String>.from(emc);
  if (currEMC.isEmpty) return false;

  final List<String> numbers = currEMC
      .map((String contact) => contact.split(contactSplit).last)
      .toList();

  final Map<String, dynamic> mapData = <String, dynamic>{
    'message': 'SOS\n${await getCoordinates(linkType.base)}',
    'recipients': isIOS ? numbers : numbers.join(';'),
  };

  try {
    await platform.invokeMethod<void>('foregroundSOS', mapData);
    return true;
  } catch (e) {
    ezLog(e.toString());
    return false;
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
    final Position pos = await Geolocator.getCurrentPosition();
    return '$linkBase${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
  } catch (e) {
    ezLog('Error getting coordinates');
    ezLog(e.toString());
    return errored;
  }
}
