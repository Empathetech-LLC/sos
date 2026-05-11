/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:gal/gal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as c;
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// Icon generators //

Widget boolIcon(bool? status) => switch (status) {
      true => Icon(Icons.check, color: EzConfig.colors.primary),
      false => Icon(Icons.cancel_outlined, color: EzConfig.colors.error),
      null => Icon(Icons.help_outline, color: EzConfig.colors.primary),
    };

Widget pStatusIcon(PermissionStatus? status) => switch (status) {
      PermissionStatus.granted ||
      PermissionStatus.limited ||
      PermissionStatus.provisional =>
        Icon(Icons.check, color: EzConfig.colors.primary),
      PermissionStatus.restricted => Icon(Icons.cancel_outlined, color: EzConfig.colors.outline),
      PermissionStatus.denied ||
      PermissionStatus.permanentlyDenied =>
        Icon(Icons.cancel_outlined, color: EzConfig.colors.error),
      null => Icon(Icons.help_outline, color: EzConfig.colors.primary),
    };

Widget lStatusIcon(LocationPermission? status) => switch (status) {
      LocationPermission.always => Icon(Icons.check, color: EzConfig.colors.primary),
      LocationPermission.denied ||
      LocationPermission.deniedForever =>
        Icon(Icons.cancel_outlined, color: EzConfig.colors.error),
      null => Icon(Icons.help_outline, color: EzConfig.colors.primary),
      LocationPermission.unableToDetermine => Icon(Icons.check, color: EzConfig.colors.secondary),
      LocationPermission.whileInUse =>
        Icon(Icons.check, color: isIOS ? EzConfig.colors.primary : EzConfig.colors.secondary),
    };

// Setting cards //

OutlinedBorder get cardShape =>
    RoundedRectangleBorder(side: EzConfig.borderSide(), borderRadius: ezRoundEdge);

class CameraSetup extends StatefulWidget {
  final Future<PermissionStatus> Function() initCamera;
  final bool locked;
  final void Function(bool) setLock;

  const CameraSetup({
    super.key,
    required this.initCamera,
    required this.locked,
    required this.setLock,
  });

  @override
  State<CameraSetup> createState() => _CameraSetupState();
}

class _CameraSetupState extends State<CameraSetup> {
  // Define the build data //

  PermissionStatus? camStatus;
  bool? galStatus;

  // Init //

  Future<void> backgroundCheck() async {
    camStatus = await Permission.camera.status;
    galStatus = await Gal.hasAccess();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => allowedPermCheck(camStatus)
      ? GestureDetector(
          onTap: () async {
            // Do nothing if already complete
            if (galStatus == true) return;

            // Check permission(s) race
            if (widget.locked) return;
            widget.setLock(true);

            // Make it so
            final bool result = await Gal.requestAccess();
            if (galStatus != result) {
              if (mounted) setState(() => galStatus = result);
            }
            widget.setLock(false);
          },
          child: Semantics(
            button: galStatus != true,
            readOnly: galStatus == true,
            hint: (galStatus == true) ? l10n.hsCameraReady : l10n.hsCameraSetupHint,
            child: ExcludeSemantics(
              child: Card(
                shape: cardShape,
                child: EzRow(
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
                            : EzCol(
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
                      padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
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
            // Do nothing if already complete
            if (allowedPermCheck(camStatus)) return;

            // Check permission(s) race
            if (widget.locked) return;
            widget.setLock(true);

            // Make it so
            final PermissionStatus result = await widget.initCamera();
            if (camStatus != result) {
              if (mounted) setState(() => camStatus = result);
            }
            widget.setLock(false);
          },
          child: Semantics(
            button: true,
            readOnly: false,
            hint: l10n.hsCameraSetupHint,
            child: ExcludeSemantics(
              child: Card(
                shape: cardShape,
                child: EzRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(EzConfig.marginVal),
                        child: EzCol(
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
                      padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                      child: pStatusIcon(camStatus),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}

class ContactsSetup extends StatefulWidget {
  final bool locked;
  final void Function(bool) setLock;

  const ContactsSetup({
    super.key,
    required this.locked,
    required this.setLock,
  });

  @override
  State<ContactsSetup> createState() => _ContactsSetupState();
}

class _ContactsSetupState extends State<ContactsSetup> {
  // Define the build data //

  c.PermissionStatus? allowed;

  // Init //

  Future<void> backgroundCheck() async {
    allowed = await c.FlutterContacts.permissions.check(c.PermissionType.read);
    if (mounted) setState(() {});
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
          // Do nothing if already complete
          if (allowedPermCheck(cPermMirror(allowed))) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so //

          // iOS reminder
          if (isIOS) {
            await showDialog(
              context: context,
              builder: (BuildContext dCon) => EzAlertDialog(
                title: Text(l10n.gReminder, textAlign: TextAlign.center),
                content: Text(
                  l10n.hsAppleContacts,
                  textAlign: TextAlign.center,
                  style: EzConfig.styles.bodyLarge,
                ),
                actions: <EzMaterialAction>[
                  EzMaterialAction(
                    text: l10n.gOk,
                    onPressed: () => Navigator.of(dCon).pop(),
                  ),
                ],
                needsClose: false,
              ),
            );
          }

          final c.PermissionStatus result =
              await c.FlutterContacts.permissions.request(c.PermissionType.read);
          if (allowed != result) if (mounted) setState(() => allowed = result);
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(cPermMirror(allowed)),
          readOnly: allowedPermCheck(cPermMirror(allowed)),
          hint: l10n.hsContactsSetupHint,
          child: ExcludeSemantics(
            child: Card(
              shape: cardShape,
              child: EzRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(EzConfig.marginVal),
                      child: allowedPermCheck(cPermMirror(allowed))
                          ? Text(
                              l10n.hsContactsReady,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            )
                          : EzCol(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.hsContacts,
                                  style: EzConfig.styles.bodyLarge,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  isIOS ? l10n.hsAddContactsIOS : l10n.hsAddContacts,
                                  style: EzConfig.styles.labelLarge,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                    child: pStatusIcon(cPermMirror(allowed)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class SMSSetup extends StatefulWidget {
  final bool locked;
  final void Function(bool) setLock;

  const SMSSetup({
    super.key,
    required this.locked,
    required this.setLock,
  });

  @override
  State<SMSSetup> createState() => _SMSSetupState();
}

class _SMSSetupState extends State<SMSSetup> {
  // Define the build data //

  PermissionStatus? status;

  // Init //

  Future<void> backgroundCheck() async {
    status = await Permission.sms.status;
    if (mounted) setState(() {});
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
          // Do nothing if already complete
          if (allowedPermCheck(status)) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so
          final PermissionStatus result = await Permission.sms.request();
          if (status != result) if (mounted) setState(() => status = result);
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(status),
          readOnly: allowedPermCheck(status),
          hint: l10n.hsTextingSetupHint,
          child: ExcludeSemantics(
            child: Card(
              shape: cardShape,
              child: EzRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(EzConfig.marginVal),
                      child: allowedPermCheck(status)
                          ? Text(
                              l10n.hsTextingReady,
                              style: EzConfig.styles.bodyLarge,
                              textAlign: TextAlign.start,
                            )
                          : EzCol(
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
  final bool locked;
  final void Function(bool) setLock;

  const LocationSetup({
    super.key,
    required this.locked,
    required this.setLock,
  });

  @override
  State<LocationSetup> createState() => _LocationSetupState();
}

class _LocationSetupState extends State<LocationSetup> with WidgetsBindingObserver {
  // Define the build data //

  LocationPermission? status;

  // Init //

  Future<void> backgroundCheck() async {
    if (await Geolocator.isLocationServiceEnabled() != true) return;
    status = await Geolocator.checkPermission();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    backgroundCheck();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) await backgroundCheck();
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          switch (status) {
            case LocationPermission.always:
              // Do nothing if already complete
              return;

            case LocationPermission.denied:
            case null:
              // Check permission(s) race
              if (widget.locked) return;
              widget.setLock(true);

              // Make it so
              final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
              if (!serviceEnabled) {
                (context.mounted)
                    ? await ezLogAlert(context, message: l10n.sosDisabled)
                    : ezLog(l10n.sosDisabled);
                return;
              }

              final LocationPermission result = await Geolocator.requestPermission();
              if (status != result) {
                if (mounted) setState(() => status = result);
              }
              widget.setLock(false);
              return;

            case LocationPermission.deniedForever:
              return;

            case LocationPermission.unableToDetermine:
              ezSnackBar(context, message: l10n.hsUnable);
              return;

            case LocationPermission.whileInUse:
              if (isIOS) return; // Do nothing if already complete

              // Check permission(s) race
              if (widget.locked) return;
              widget.setLock(true);

              // Make it so
              await openAppSettings();
              widget.setLock(false);
              return;
          }
        },
        child: isIOS
            ? Semantics(
                button: !allowedPermCheck(lPermMirror(status)),
                readOnly: allowedPermCheck(lPermMirror(status)),
                hint: l10n.hsLocationSetupHint,
                child: ExcludeSemantics(
                  child: Card(
                    shape: cardShape,
                    child: EzRow(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(EzConfig.marginVal),
                            child: allowedPermCheck(lPermMirror(status))
                                ? Text(
                                    l10n.hsLocationReady,
                                    style: EzConfig.styles.bodyLarge,
                                    textAlign: TextAlign.start,
                                  )
                                : EzCol(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        l10n.hsLocation,
                                        style: EzConfig.styles.bodyLarge,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        l10n.hsAddLocation,
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
              )
            : Semantics(
                button: status != LocationPermission.always,
                readOnly: status == LocationPermission.always,
                hint: l10n.hsLocationSetupHint,
                child: ExcludeSemantics(
                  child: Card(
                    shape: cardShape,
                    child: EzRow(
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
                                : EzCol(
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

  // Cleanup //

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
