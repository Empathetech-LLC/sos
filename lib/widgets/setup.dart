/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

Widget permissionIcon(PermissionStatus? status) {
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

class CameraCard extends StatefulWidget {
  final Future<PermissionStatus> Function() initCamera;

  const CameraCard(this.initCamera, {super.key});

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  // Define the build data //

  PermissionStatus? status;

  // Return the build //
  // TODO: l10n and semantics
  // TODO: make actually flexible
  // TODO: add tap again for gallery

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          final PermissionStatus result = await widget.initCamera();
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
              Padding(
                padding: EdgeInsets.all(EzConfig.marginVal),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Camera & Microphone',
                        style: EzConfig.styles.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Enables video recording',
                        style: EzConfig.styles.labelLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: permissionIcon(status),
              ),
            ],
          ),
        ),
      );
}

class SMSCard extends StatefulWidget {
  final Future<PermissionStatus> Function() initCamera;

  const SMSCard(this.initCamera, {super.key});

  @override
  State<SMSCard> createState() => _SMSCardState();
}

class _SMSCardState extends State<SMSCard> {
  // Define the build data //

  PermissionStatus? status;

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: doNothing,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: EzConfig.colors.primaryContainer),
            borderRadius: ezRoundEdge,
          ),
          child: EzRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(EzConfig.marginVal),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'SMS',
                        style: EzConfig.styles.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Enables emergency contact alerts',
                        style: EzConfig.styles.labelLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: permissionIcon(status),
              ),
            ],
          ),
        ),
      );
}

class LocationCard extends StatefulWidget {
  final Future<PermissionStatus> Function() blarg;

  const LocationCard(this.blarg, {super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  // Define the build data //

  PermissionStatus? status;

  // Return the build //

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: doNothing,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: EzConfig.colors.primaryContainer),
            borderRadius: ezRoundEdge,
          ),
          child: EzRow(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(EzConfig.marginVal),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Location',
                        style: EzConfig.styles.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        isIOS
                            ? 'Enables location sharing and local rapid response (ICERR)'
                            : 'Enables location sharing (SMS required) and local rapid response (ICERR)',
                        style: EzConfig.styles.labelLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EzConfig.padding),
                child: permissionIcon(status),
              ),
            ],
          ),
        ),
      );
}
