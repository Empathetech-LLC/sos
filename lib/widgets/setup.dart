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

Widget boolIcon(EzCP config, bool? status) => switch (status) {
      true => EzIcon(config, Icons.check, color: config.colors.primary),
      false => EzIcon(config, Icons.cancel_outlined, color: config.colors.error),
      null => EzIcon(config, Icons.help_outline, color: config.colors.primary),
    };

Widget pStatusIcon(EzCP config, PermissionStatus? status) => switch (status) {
      PermissionStatus.granted ||
      PermissionStatus.limited ||
      PermissionStatus.provisional =>
        EzIcon(config, Icons.check, color: config.colors.primary),
      PermissionStatus.restricted =>
        EzIcon(config, Icons.cancel_outlined, color: config.colors.outline),
      PermissionStatus.denied ||
      PermissionStatus.permanentlyDenied =>
        EzIcon(config, Icons.cancel_outlined, color: config.colors.error),
      null => EzIcon(config, Icons.help_outline, color: config.colors.primary),
    };

Widget lStatusIcon(EzCP config, LocationPermission? status) => switch (status) {
      LocationPermission.always => EzIcon(config, Icons.check, color: config.colors.primary),
      LocationPermission.denied ||
      LocationPermission.deniedForever =>
        EzIcon(config, Icons.cancel_outlined, color: config.colors.error),
      null => EzIcon(config, Icons.help_outline, color: config.colors.primary),
      LocationPermission.unableToDetermine =>
        EzIcon(config, Icons.check, color: config.colors.secondary),
      LocationPermission.whileInUse =>
        EzIcon(config, Icons.check, color: isIOS ? config.colors.primary : config.colors.secondary),
    };

// Setting cards //

OutlinedBorder cardShape(EzCP config) =>
    RoundedRectangleBorder(side: config.borderSide(), borderRadius: config.textRadius);

class CameraSetup extends StatefulWidget {
  final EzCP config;
  final Future<PermissionStatus> Function(EzCP config) initCamera;
  final bool locked;
  final void Function(bool) setLock;

  const CameraSetup(
    this.config, {
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
            hint: (galStatus == true)
                ? l10n(widget.config).hsCameraReady
                : l10n(widget.config).hsCameraSetupHint,
            child: ExcludeSemantics(
              child: Card(
                shape: cardShape(widget.config),
                child: EzRow(
                  widget.config,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(widget.config.padding),
                        child: galStatus == true
                            ? Text(
                                l10n(widget.config).hsCameraReady,
                                style: widget.config.bodyStyle,
                                textAlign: TextAlign.start,
                              )
                            : EzCol(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    l10n(widget.config).hsGallery,
                                    style: widget.config.bodyStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    l10n(widget.config).hsAddSave,
                                    style: widget.config.labelStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(widget.config.padding),
                      child: boolIcon(widget.config, galStatus),
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
            final PermissionStatus result = await widget.initCamera(widget.config);
            if (camStatus != result) {
              if (mounted) setState(() => camStatus = result);
            }
            widget.setLock(false);
          },
          child: Semantics(
            button: true,
            readOnly: false,
            hint: l10n(widget.config).hsCameraSetupHint,
            child: ExcludeSemantics(
              child: Card(
                shape: cardShape(widget.config),
                child: EzRow(
                  widget.config,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(widget.config.padding),
                        child: EzCol(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l10n(widget.config).hsCamMic,
                              style: widget.config.bodyStyle,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              l10n(widget.config).hsAddRecording,
                              style: widget.config.labelStyle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(widget.config.padding),
                      child: pStatusIcon(widget.config, camStatus),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}

class ContactsSetup extends StatefulWidget {
  final EzCP config;
  final bool locked;
  final void Function(bool) setLock;

  const ContactsSetup(
    this.config, {
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
                widget.config,
                title: Text(l10n(widget.config).gReminder, textAlign: TextAlign.center),
                content: Text(
                  l10n(widget.config).hsAppleContacts,
                  textAlign: TextAlign.center,
                  style: widget.config.bodyStyle,
                ),
                actions: <EzAction>[
                  EzAction(
                    widget.config,
                    text: l10n(widget.config).gOk,
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
          hint: l10n(widget.config).hsContactsSetupHint,
          child: ExcludeSemantics(
            child: Card(
              shape: cardShape(widget.config),
              child: EzRow(
                widget.config,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(widget.config.padding),
                      child: allowedPermCheck(cPermMirror(allowed))
                          ? Text(
                              l10n(widget.config).hsContactsReady,
                              style: widget.config.bodyStyle,
                              textAlign: TextAlign.start,
                            )
                          : EzCol(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n(widget.config).hsContacts,
                                  style: widget.config.bodyStyle,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  isIOS
                                      ? l10n(widget.config).hsAddContactsIOS
                                      : l10n(widget.config).hsAddContacts,
                                  style: widget.config.labelStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.config.padding),
                    child: pStatusIcon(widget.config, cPermMirror(allowed)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class SMSSetup extends StatefulWidget {
  final EzCP config;
  final bool locked;
  final void Function(bool) setLock;

  const SMSSetup(
    this.config, {
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
          hint: l10n(widget.config).hsTextingSetupHint,
          child: ExcludeSemantics(
            child: Card(
              shape: cardShape(widget.config),
              child: EzRow(
                widget.config,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(widget.config.padding),
                      child: allowedPermCheck(status)
                          ? Text(
                              l10n(widget.config).hsTextingReady,
                              style: widget.config.bodyStyle,
                              textAlign: TextAlign.start,
                            )
                          : EzCol(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n(widget.config).hsTexting,
                                  style: widget.config.bodyStyle,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  l10n(widget.config).hsAddTexting,
                                  style: widget.config.labelStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.config.padding),
                    child: pStatusIcon(widget.config, status),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class LocationSetup extends StatefulWidget {
  final EzCP config;
  final bool locked;
  final void Function(bool) setLock;

  const LocationSetup(
    this.config, {
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
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
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
                    ? await ezLogAlert(
                        widget.config,
                        context: context,
                        message: l10n(widget.config).sosDisabled,
                      )
                    : ezLog(l10n(widget.config).sosDisabled);
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
              ezSnackBar(widget.config, context: context, message: l10n(widget.config).hsUnable);
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
                hint: l10n(widget.config).hsLocationSetupHint,
                child: ExcludeSemantics(
                  child: Card(
                    shape: cardShape(widget.config),
                    child: EzRow(
                      widget.config,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(widget.config.padding),
                            child: allowedPermCheck(lPermMirror(status))
                                ? Text(
                                    l10n(widget.config).hsLocationReady,
                                    style: widget.config.bodyStyle,
                                    textAlign: TextAlign.start,
                                  )
                                : EzCol(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        l10n(widget.config).hsLocation,
                                        style: widget.config.bodyStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        l10n(widget.config).hsAddLocation,
                                        style: widget.config.labelStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(widget.config.padding),
                          child: lStatusIcon(widget.config, status),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Semantics(
                button: status != LocationPermission.always,
                readOnly: status == LocationPermission.always,
                hint: l10n(widget.config).hsLocationSetupHint,
                child: ExcludeSemantics(
                  child: Card(
                    shape: cardShape(widget.config),
                    child: EzRow(
                      widget.config,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(widget.config.padding),
                            child: status == LocationPermission.always
                                ? Text(
                                    l10n(widget.config).hsLocationReady,
                                    style: widget.config.bodyStyle,
                                    textAlign: TextAlign.start,
                                  )
                                : EzCol(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        l10n(widget.config).hsLocation,
                                        style: widget.config.bodyStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        status == LocationPermission.whileInUse
                                            ? l10n(widget.config).hsAddAlways
                                            : l10n(widget.config).hsAddLocation,
                                        style: widget.config.labelStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(widget.config.padding),
                          child: lStatusIcon(widget.config, status),
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
