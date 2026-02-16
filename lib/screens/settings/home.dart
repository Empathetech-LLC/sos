/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatefulWidget {
  SettingsHomeScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  // Define the build data //

  LinkType _linkType = linkType;

  // Define custom functions //

  Future<bool> canSet(String key, bool value) async {
    if (value == false || isIOS) return true;

    final PermissionStatus canSMS = await Permission.sms.request();

    if (canSMS != PermissionStatus.denied &&
        canSMS != PermissionStatus.permanentlyDenied) {
      return true;
    } else {
      if (mounted) ezSnackBar(context: context, message: l10n.sosNeedSMS);
      return false;
    }
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        EzScrollView(
          children: <Widget>[
            // Language
            EzLocaleSetting(
              () => setState(() {}),
              locales: Lang.supportedLocales,
              skip: <Locale>{arabic, english, chinese}, // Dupes
              protest: true,
            ),
            EzConfig.separator,

            // SOS on open
            EzSwitchPair(
              text: l10n.ssSOSOnOpen,
              valueKey: sosOnOpenKey,
              canChange: (bool choice) => canSet(sosOnOpenKey, choice),
            ),
            EzConfig.spacer,

            if (!isIOS) ...<Widget>[
              // SOS on close
              EzSwitchPair(
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
                text: l10n.ssVideoSOS,
                valueKey: sosOnInterruptKey,
                canChange: (bool choice) => canSet(sosOnInterruptKey, choice),
              ),
              EzConfig.spacer,
            ],

            // Auto-share media
            EzSwitchPair(text: l10n.ssAutoShare, valueKey: autoShareMediaKey),
            EzConfig.divider,

            // EMC
            const ContactList(),
            EzConfig.separator,

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

            // Appearance
            EzElevatedIconButton(
              onPressed: () => context.goNamed(appearanceSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: l10n.ssAppearance,
            ),
            EzConfig.separator,
          ],
        ),
        useImageDecoration: false,
      ),
      fabs: <Widget>[
        EzConfig.spacer,
        const EzBackFAB(showHome: true),
        EzConfig.spacer,
        const HelpFAB(),
      ],
    );
  }
}
