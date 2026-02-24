/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SOSSettingsScreen extends StatefulWidget {
  SOSSettingsScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<SOSSettingsScreen> createState() => _SOSSettingsScreenState();
}

class _SOSSettingsScreenState extends State<SOSSettingsScreen> {
  // Define the build data //

  LinkType _linkType = linkType;

  // Define custom functions //

  // TODO: the following...
  // check emc too
  // allow the user to update their settings whenever, canSet should just be a one time alert
  // one time per visit to the page that is
  // tell them the settings (and changing them) are useless without the required permissions
  // include a link to the app settings
  // add checks to link type as well, but diff func cuz diff permissions
  // obviously don't add a check to emergency contacts
  // add an "are you sure?" to removing the last contact
  // yes/no and switch to never mention this again
  Future<bool> canSet(String key, bool value) async {
    if (value == false || isIOS) return true;

    final PermissionStatus canSMS = await Permission.sms.request();

    if (canSMS != PermissionStatus.denied &&
        canSMS != PermissionStatus.permanentlyDenied) {
      return true;
    } else {
      if (mounted) ezSnackBar(context, message: l10n.sosNeedSMS);
      return false;
    }
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        Center(
          child: EzScrollView(children: <Widget>[
            // EMC
            ContactList(() => setState(() {})),
            // Spacer included

            // Link type
            EzScrollView(
              scrollDirection: Axis.horizontal,
              reverseHands: true,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Label
                EzText(
                  l10n.ssLinkType,
                  style: EzConfig.styles.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                EzConfig.margin,
                EzDropdownMenu<LinkType>(
                  widthEntries: <String>[LinkType.google.label],
                  dropdownMenuEntries: LinkType.values
                      .map<DropdownMenuEntry<LinkType>>(
                          (LinkType type) => DropdownMenuEntry<LinkType>(
                                value: type,
                                label: type.label,
                              ))
                      .toList(),
                  enableSearch: false,
                  initialSelection: _linkType,
                  onSelected: (LinkType? selection) async {
                    if (selection == null || selection == _linkType) return;

                    await EzConfig.setString(linkTypeKey, selection.name);
                    setState(() => _linkType = selection);
                  },
                ),
              ],
            ),
            EzConfig.divider,
            // TODO: Add message customization

            // SOS on open
            EzSwitchPair(
              enabled: emc == null ? false : emc!.isNotEmpty,
              text: l10n.ssSOSOnOpen,
              valueKey: sosOnOpenKey,
              canChange: (bool choice) => canSet(sosOnOpenKey, choice),
            ),

            if (!isIOS) ...<Widget>[
              // SOS on close
              EzConfig.spacer,
              EzSwitchPair(
                enabled: emc == null ? false : emc!.isNotEmpty,
                text: l10n.ssSOSOnClose,
                valueKey: sosOnCloseKey,
                canChange: (bool choice) async {
                  final bool check1 = await canSet(sosOnCloseKey, choice);
                  final bool? check2 = (choice == false)
                      ? context.mounted
                          // Confirm immediate closure to prevent accidental broadcasts
                          ? await showDialog<bool>(
                              context: context,
                              builder: (BuildContext dContext) => EzAlertDialog(
                                title: Text(
                                  EzConfig.l10n.gAttention,
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  l10n.ssCloseOffWarning,
                                  textAlign: TextAlign.center,
                                ),
                                actions: ezActionPair(
                                  context: context,
                                  confirmMsg: l10n.gOk,
                                  confirmIsDefault: true,
                                  onConfirm: () =>
                                      Navigator.of(dContext).pop(true),
                                  denyMsg: EzConfig.l10n.gCancel,
                                  onDeny: () =>
                                      Navigator.of(dContext).pop(false),
                                ),
                                needsClose: false,
                              ),
                            )
                          : true
                      : context.mounted
                          // Confirm the user wants to enable this setting
                          ? await showDialog<bool>(
                              context: context,
                              builder: (BuildContext dContext) => EzAlertDialog(
                                title: Text(
                                  EzConfig.l10n.gAttention,
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  l10n.ssSOSOnCloseHint,
                                  textAlign: TextAlign.center,
                                ),
                                actions: ezActionPair(
                                  context: context,
                                  confirmMsg: l10n.gOk,
                                  confirmIsDefault: true,
                                  onConfirm: () =>
                                      Navigator.of(dContext).pop(true),
                                  denyMsg: EzConfig.l10n.gCancel,
                                  onDeny: () =>
                                      Navigator.of(dContext).pop(false),
                                ),
                                needsClose: false,
                              ),
                            )
                          : false;

                  return check1 && (check2 ?? false);
                },
                afterChanged: (bool? value) {
                  // Exit the app when turning off to avoid accidental broadcasts
                  if (value == false) exit(0);
                },
              ),
              EzConfig.spacer,

              // SOS on interrupt
              EzSwitchPair(
                enabled: emc == null ? false : emc!.isNotEmpty,
                text: l10n.ssVideoSOS,
                valueKey: sosOnInterruptKey,
                canChange: (bool choice) => canSet(sosOnInterruptKey, choice),
              ),
            ],
          ]),
        ),
        useImageDecoration: false,
      ),
      fabs: showBackFAB ? <Widget>[EzConfig.spacer, const EzBackFAB()] : null,
    );
  }
}
