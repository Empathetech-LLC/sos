/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:gal/gal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// TODO: l10n and semantics
// Icon generators //

Widget boolIcon(bool? status) {
  switch (status) {
    case true:
      return EzIcon(
        Icons.check,
        color: EzConfig.colors.primary,
      );
    case false:
      return EzIcon(
        Icons.cancel_outlined,
        color: EzConfig.colors.error,
      );
    case null:
      return EzIcon(
        Icons.help_outline,
        color: EzConfig.colors.primary,
      );
  }
}

Widget pStatusIcon(PermissionStatus? status) {
  switch (status) {
    case PermissionStatus.granted:
    case PermissionStatus.limited:
    case PermissionStatus.provisional:
      return EzIcon(
        Icons.check,
        color: EzConfig.colors.primary,
      );
    case PermissionStatus.restricted:
      return EzIcon(
        Icons.cancel_outlined,
        color: EzConfig.colors.outline,
      );
    case PermissionStatus.denied:
    case PermissionStatus.permanentlyDenied:
      return EzIcon(
        Icons.cancel_outlined,
        color: EzConfig.colors.error,
      );
    case null:
      return EzIcon(
        Icons.help_outline,
        color: EzConfig.colors.primary,
      );
  }
}

Widget lStatusIcon(LocationPermission? status) {
  switch (status) {
    case LocationPermission.always:
      return EzIcon(
        Icons.check,
        color: EzConfig.colors.primary,
      );
    case LocationPermission.whileInUse:
    case LocationPermission.unableToDetermine:
      return EzIcon(
        Icons.check,
        color: EzConfig.colors.secondary,
      );

    case LocationPermission.denied:
    case LocationPermission.deniedForever:
      return EzIcon(
        Icons.cancel_outlined,
        color: EzConfig.colors.error,
      );
    case null:
      return EzIcon(
        Icons.help_outline,
        color: EzConfig.colors.primary,
      );
  }
}

// Setting cards //

class CameraSetup extends StatefulWidget {
  final Future<PermissionStatus> Function() initCamera;

  const CameraSetup(this.initCamera, {super.key});

  @override
  State<CameraSetup> createState() => _CameraSetupState();
}

class _CameraSetupState extends State<CameraSetup> {
  PermissionStatus? camStatus;
  bool? galStatus;

  @override
  Widget build(BuildContext context) => camStatus == PermissionStatus.granted
      ? GestureDetector(
          onTap: () async {
            if (galStatus == true) return;
            final bool result = await Gal.requestAccess();
            if (galStatus != result) setState(() => galStatus = result);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: EzConfig.colors.primaryContainer),
              borderRadius: ezRoundEdge,
            ),
            child: EzRow(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(EzConfig.marginVal),
                    child: galStatus == true
                        ? Text(
                            'Camera is ready',
                            style: EzConfig.styles.bodyLarge,
                            textAlign: TextAlign.start,
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Gallery',
                                style: EzConfig.styles.bodyLarge,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Required to save your recordings.',
                                style: EzConfig.styles.labelLarge,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                  child: boolIcon(galStatus),
                ),
              ],
            ),
          ),
        )
      : GestureDetector(
          onTap: () async {
            if (camStatus == PermissionStatus.granted) return;
            final PermissionStatus result = await widget.initCamera();
            if (camStatus != result) setState(() => camStatus = result);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: EzConfig.colors.primaryContainer),
              borderRadius: ezRoundEdge,
            ),
            child: EzRow(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(EzConfig.marginVal),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Camera & Microphone',
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Enables video recording',
                          style: EzConfig.styles.labelLarge,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                  child: pStatusIcon(camStatus),
                ),
              ],
            ),
          ),
        );
}

class ContactsSetup extends StatefulWidget {
  const ContactsSetup({super.key});

  @override
  State<ContactsSetup> createState() => _ContactsSetupState();
}

class _ContactsSetupState extends State<ContactsSetup> {
  bool? allowed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (allowed == true) return;
          final bool result =
              await FlutterContacts.requestPermission(readonly: true);
          if (allowed != result) setState(() => allowed = result);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: EzConfig.colors.primaryContainer),
            borderRadius: ezRoundEdge,
          ),
          child: EzRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(EzConfig.marginVal),
                  child: allowed == true
                      ? Text(
                          'Contacts are ready',
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Contacts',
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              isIOS
                                  ? 'Enables emergency contact alerts'
                                  : 'Part 1 of enabling emergency contact alerts',
                              style: EzConfig.styles.labelLarge,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: boolIcon(allowed),
              ),
            ],
          ),
        ),
      );
}

class SMSSetup extends StatefulWidget {
  const SMSSetup({super.key});

  @override
  State<SMSSetup> createState() => _SMSSetupState();
}

class _SMSSetupState extends State<SMSSetup> {
  PermissionStatus? status;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (status == PermissionStatus.granted) return;
          final PermissionStatus result = await Permission.sms.request();
          if (status != result) setState(() => status = result);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: EzConfig.colors.primaryContainer),
            borderRadius: ezRoundEdge,
          ),
          child: EzRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(EzConfig.marginVal),
                  child: status == PermissionStatus.granted
                      ? Text(
                          'SMS is ready',
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'SMS',
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Part 2 of enabling emergency contact alerts',
                              style: EzConfig.styles.labelLarge,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: pStatusIcon(status),
              ),
            ],
          ),
        ),
      );
}

class LocationSetup extends StatefulWidget {
  const LocationSetup({super.key});

  @override
  State<LocationSetup> createState() => _LocationSetupState();
}

class _LocationSetupState extends State<LocationSetup> {
  LocationPermission? status;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          switch (status) {
            case LocationPermission.always:
            case LocationPermission.deniedForever:
              return;
            case LocationPermission.whileInUse:
              await openSOSPermissions();
              return;
            case LocationPermission.unableToDetermine:
              ezSnackBar(context: context, message: 'Unable to determine');
              return;
            case LocationPermission.denied:
            case null:
              final bool serviceEnabled =
                  await Geolocator.isLocationServiceEnabled();
              if (!serviceEnabled) {
                if (context.mounted) {
                  await ezLogAlert(context, message: l10n.sosDisabled);
                }
                return;
              }

              final LocationPermission result =
                  await Geolocator.checkPermission();
              if (status != result) setState(() => status = result);
              return;
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: EzConfig.colors.primaryContainer),
            borderRadius: ezRoundEdge,
          ),
          child: EzRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(EzConfig.marginVal),
                  child: status == LocationPermission.always
                      ? Text(
                          'Location is ready',
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Location',
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              status == LocationPermission.whileInUse
                                  ? 'Recommended to enable always. Press again to go to System Settings.'
                                  : 'Enables location sharing and local rapid response (ICERR)',
                              style: EzConfig.styles.labelLarge,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: lStatusIcon(status),
              ),
            ],
          ),
        ),
      );
}
