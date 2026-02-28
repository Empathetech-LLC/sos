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
  // Define the build data //

  PermissionStatus? camStatus;
  bool? galStatus;

  // Init //

  void backgroundCheck() async {
    camStatus = await Permission.camera.status;
    galStatus = await Gal.hasAccess();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return camStatus == PermissionStatus.granted
        ? GestureDetector(
            onTap: () async {
              if (galStatus == true) return;
              final bool result = await Gal.requestAccess();
              if (galStatus != result) setState(() => galStatus = result);
            },
            child: Semantics(
              button: galStatus != true,
              readOnly: galStatus == true,
              hint: (galStatus == true)
                  ? l10n.hsCameraReady
                  : l10n.hsCameraSetupHint,
              child: ExcludeSemantics(
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
                                  l10n.hsCameraReady,
                                  style: EzConfig.styles.bodyLarge,
                                  textAlign: TextAlign.start,
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      l10n.hsGallery,
                                      style: EzConfig.styles.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      l10n.hsAddSave,
                                      style: EzConfig.styles.labelLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: EzConfig.padding),
                        child: boolIcon(galStatus),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () async {
              if (camStatus == PermissionStatus.granted) return;
              final PermissionStatus result = await widget.initCamera();
              if (camStatus != result) setState(() => camStatus = result);
            },
            child: Semantics(
              button: true,
              readOnly: false,
              hint: l10n.hsCameraSetupHint,
              child: ExcludeSemantics(
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
                                l10n.hsCamMic,
                                style: EzConfig.styles.bodyLarge,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                l10n.hsAddRecording,
                                style: EzConfig.styles.labelLarge,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: EzConfig.padding),
                        child: pStatusIcon(camStatus),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class ContactsSetup extends StatefulWidget {
  const ContactsSetup({super.key});

  @override
  State<ContactsSetup> createState() => _ContactsSetupState();
}

class _ContactsSetupState extends State<ContactsSetup> {
  // Define the build data //

  bool? allowed;

  // Init //

  void backgroundCheck() async {
    final PermissionStatus status = await Permission.contacts.status;
    setState(() => allowed = (!status.isDenied &&
        !status.isPermanentlyDenied &&
        !status.isRestricted));
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (allowed == true) return;
          final bool result =
              await FlutterContacts.requestPermission(readonly: true);
          if (allowed != result) setState(() => allowed = result);
        },
        child: Semantics(
          button: allowed != true,
          readOnly: allowed == true,
          hint: l10n.hsContactsSetupHint,
          child: ExcludeSemantics(
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
                              l10n.hsContactsReady,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.hsContacts,
                                  style: EzConfig.styles.bodyLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  isIOS
                                      ? l10n.hsAddContactsIOS
                                      : l10n.hsAddContacts,
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
  // Define the build data //

  PermissionStatus? status;

  // Init //

  void backgroundCheck() async {
    status = await Permission.sms.status;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          if (status == PermissionStatus.granted) return;
          final PermissionStatus result = await Permission.sms.request();
          if (status != result) setState(() => status = result);
        },
        child: Semantics(
          button: status != PermissionStatus.granted,
          readOnly: status == PermissionStatus.granted,
          hint: l10n.hsTextingSetupHint,
          child: ExcludeSemantics(
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
                              l10n.hsTextingReady,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.hsTexting,
                                  style: EzConfig.styles.bodyLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  l10n.hsAddTexting,
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
          ),
        ),
      );
}

class LocationSetup extends StatefulWidget {
  const LocationSetup({super.key});

  @override
  State<LocationSetup> createState() => _LocationSetupState();
}

class _LocationSetupState extends State<LocationSetup>
    with WidgetsBindingObserver {
  // Define the build data //

  LocationPermission? status;

  // Init //

  void backgroundCheck() async {
    WidgetsBinding.instance.addObserver(this);
    if (await Geolocator.isLocationServiceEnabled() != true) return;
    status = await Geolocator.checkPermission();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      status = await Geolocator.checkPermission();
      setState(() {});
    }
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          switch (status) {
            case LocationPermission.always:
              return;
            case LocationPermission.whileInUse:
            case LocationPermission.deniedForever:
              await openSOSPermissions();
              return;
            case LocationPermission.unableToDetermine:
              ezSnackBar(context, message: l10n.hsUnable);
              return;
            case LocationPermission.denied:
            case null:
              final bool serviceEnabled =
                  await Geolocator.isLocationServiceEnabled();
              if (!serviceEnabled) {
                (context.mounted)
                    ? await ezLogAlert(context, message: l10n.sosDisabled)
                    : ezLog(l10n.sosDisabled);
                return;
              }

              final LocationPermission result =
                  await Geolocator.requestPermission();
              if (status != result) setState(() => status = result);
              return;
          }
        },
        child: Semantics(
          button: status != LocationPermission.always,
          readOnly: status == LocationPermission.always,
          hint: l10n.hsLocationSetupHint,
          child: ExcludeSemantics(
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
                              l10n.hsLocationReady,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.hsLocation,
                                  style: EzConfig.styles.bodyLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  status == LocationPermission.whileInUse
                                      ? l10n.hsAddAlways
                                      : l10n.hsAddLocation,
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
          ),
        ),
      );

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
