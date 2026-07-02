/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

// TODO: get the camera card to be one click per permission, like location
// TODO: update the location permission message
// TODO: lots of l10n - including the removal of punctuation in the setup cards

import '../utils/export.dart';

import 'package:gal/gal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as fc;
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

OutlinedBorder cardShape(EzCP config) => RoundedRectangleBorder(
      side: config.borderSide(),
      borderRadius: EzButtonShape.roundRect.radius,
    );

class CameraSetup extends StatefulWidget {
  final EzCP config;
  final bool locked;
  final void Function(bool) setLock;

  const CameraSetup(
    this.config, {
    super.key,
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
  PermissionStatus? micStatus;

  // Init //

  Future<void> backgroundCheck() async {
    camStatus = await Permission.camera.status;
    galStatus = await Gal.hasAccess();
    micStatus = await Permission.microphone.status;

    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  Widget camCard() => GestureDetector(
        onTap: () async {
          // Do nothing if already complete
          if (allowedPermCheck(camStatus)) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so
          final PermissionStatus result = await Permission.camera.request();
          if (camStatus != result) camStatus = result;
          if (mounted) setState(() {});
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(camStatus),
          readOnly: allowedPermCheck(camStatus),
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
                            'Camera',
                            style: widget.config.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Enables video recording',
                            style: widget.config.bodyStyle,
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

  Widget micCard() => GestureDetector(
        onTap: () async {
          // Do nothing if already complete
          if (allowedPermCheck(micStatus)) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so
          final PermissionStatus result = await Permission.microphone.request();
          if (micStatus != result) micStatus = result;
          if (mounted) setState(() {});
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(micStatus),
          readOnly: allowedPermCheck(micStatus),
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
                            'Microphone',
                            style: widget.config.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Videos will be silent without it',
                            style: widget.config.bodyStyle,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.config.padding),
                    child: pStatusIcon(widget.config, micStatus),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget galCard() => GestureDetector(
        onTap: () async {
          // Do nothing if already complete
          if (galStatus == true) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so
          final bool result = await Gal.requestAccess();
          if (galStatus != result) galStatus = result;
          if (mounted) setState(() {});
          widget.setLock(false);
        },
        child: Semantics(
          button: galStatus != true,
          readOnly: galStatus == true,
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
                            l10n(widget.config).hsGallery,
                            style: widget.config.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            l10n(widget.config).hsAddSave,
                            style: widget.config.bodyStyle,
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
      );

  Widget finCard() => Semantics(
        readOnly: true,
        hint: l10n(widget.config).hsCameraReady,
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
                    child: Text(
                      l10n(widget.config).hsCameraReady,
                      style: widget.config.bodyStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(widget.config.padding),
                  child: boolIcon(widget.config, true),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => allowedPermCheck(camStatus)
      ? (allowedPermCheck(micStatus) ? ((galStatus ?? false) ? finCard() : galCard()) : micCard())
      : camCard();
}

class SOSSetup extends StatefulWidget {
  final EzCP config;
  final bool locked;
  final void Function(bool) setLock;

  const SOSSetup(
    this.config, {
    super.key,
    required this.locked,
    required this.setLock,
  });

  @override
  State<SOSSetup> createState() => _SOSSetupState();
}

class _SOSSetupState extends State<SOSSetup> {
  // Define the build data //

  fc.PermissionStatus? conStatus;
  PermissionStatus? smsStatus;

  // Init //

  Future<void> backgroundCheck() async {
    conStatus = await fc.FlutterContacts.permissions.check(fc.PermissionType.read);
    smsStatus = isIOS ? PermissionStatus.granted : await Permission.sms.status;

    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    backgroundCheck();
  }

  // Return the build //

  Widget conCard() => GestureDetector(
        onTap: () async {
          // Do nothing if already complete
          if (allowedPermCheck(cPermMirror(conStatus))) return;

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
                content: Text(l10n(widget.config).hsAppleContacts, textAlign: TextAlign.center),
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

          final fc.PermissionStatus result =
              await fc.FlutterContacts.permissions.request(fc.PermissionType.read);
          if (conStatus != result) conStatus = result;
          if (mounted) setState(() {});
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(cPermMirror(conStatus)),
          readOnly: allowedPermCheck(cPermMirror(conStatus)),
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
                      child: EzCol(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            l10n(widget.config).hsContacts,
                            style: widget.config.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Enables SOS messages',
                            style: widget.config.bodyStyle,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.config.padding),
                    child: pStatusIcon(widget.config, cPermMirror(conStatus)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  /// Skipped entirely on iOS
  Widget smsCard() => GestureDetector(
        onTap: () async {
          // Do nothing if already complete
          if (allowedPermCheck(smsStatus)) return;

          // Check permission(s) race
          if (widget.locked) return;
          widget.setLock(true);

          // Make it so
          final PermissionStatus result = await Permission.sms.request();
          if (smsStatus != result) smsStatus = result;
          if (mounted) setState(() {});
          widget.setLock(false);
        },
        child: Semantics(
          button: !allowedPermCheck(smsStatus),
          readOnly: allowedPermCheck(smsStatus),
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
                      child: EzCol(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'SMS',
                            style: widget.config.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Android requires permission for both who & how to text',
                            style: widget.config.bodyStyle,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(widget.config.padding),
                    child: pStatusIcon(widget.config, smsStatus),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget finCard() => Semantics(
        readOnly: true,
        hint: 'SOS is ready',
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
                    child: Text(
                      'SOS is ready',
                      style: widget.config.bodyStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(widget.config.padding),
                  child: boolIcon(widget.config, true),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => allowedPermCheck(cPermMirror(conStatus))
      ? (allowedPermCheck(smsStatus) ? finCard() : smsCard())
      : conCard();
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
                                        style: widget.config.titleStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        'Adds your location to SOS messages',
                                        style: widget.config.bodyStyle,
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
                                        style: widget.config.titleStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        status == LocationPermission.whileInUse
                                            ? l10n(widget.config).hsAddAlways
                                            : 'Adds your location to SOS messages',
                                        style: widget.config.bodyStyle,
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
