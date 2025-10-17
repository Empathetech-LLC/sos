/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';
import 'package:efui_bios/efui_bios.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsHomeScreen extends StatefulWidget {
  const SettingsHomeScreen({super.key});

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  // Gather the theme data //

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

  // Define the build data //

  LinkType linkType = LinkConfig.fromName(EzConfig.get(linkTypeKey));

  // Define custom functions //

  Future<bool> canSet(String key, bool value) async {
    if (value == false || Platform.isIOS) return true;

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
        EzScrollView(children: <Widget>[
          // Functionality disclaimer
          EzWarning(el10n.ssRestartReminder),
          ezSpacer,

          // Language
          EzLocaleSetting(
            locales: Lang.supportedLocales,
            skip: <Locale>{arabic, english, chinese}, // Dupes
            protest: true,
          ),
          ezDivider,

          // SOS on open
          EzSwitchPair(
            text: l10n.ssSOSOnOpen,
            valueKey: onOpenKey,
            canChange: (bool choice) => canSet(onOpenKey, choice),
          ),
          ezSpacer,

          if (Platform.isAndroid) ...<Widget>[
            // SOS on close
            EzSwitchPair(
              text: l10n.ssSOSOnClose,
              valueKey: onCloseKey,
              canChange: (bool choice) => canSet(onCloseKey, choice),
              onChangedCallback: (bool? choice) async {
                if (choice != true) return;

                await showPlatformDialog<bool>(
                  context: context,
                  builder: (_) => EzAlertDialog(
                    title: Text(
                      el10n.gAttention,
                      textAlign: TextAlign.center,
                    ),
                    contents: <Widget>[
                      Text(
                        l10n.ssSOSOnCloseHint,
                        textAlign: TextAlign.center,
                      )
                    ],
                    materialActions: <Widget>[
                      EzMaterialAction(
                        text: l10n.gOk,
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                    cupertinoActions: <Widget>[
                      EzCupertinoAction(
                        text: l10n.gOk,
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                    needsClose: false,
                  ),
                );
              },
            ),
            ezSpacer,

            // SOS on interrupt
            EzSwitchPair(
              text: l10n.ssVideoSOS,
              valueKey: onInterruptKey,
              canChange: (bool choice) => canSet(onInterruptKey, choice),
            ),
            ezSpacer,
          ],

          // Auto-share media
          EzSwitchPair(
            text: l10n.ssAutoShare,
            valueKey: autoShareKey,
          ),
          ezDivider,

          // EMC
          const ContactList(),
          ezSeparator,

          // Link type
          EzScrollView(
            scrollDirection: Axis.horizontal,
            reverseHands: true,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Label
              EzText(
                l10n.ssLinkType,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              ezMargin,
              EzDropdownMenu<LinkType>(
                widthEntries: <String>[LinkType.google.label],
                dropdownMenuEntries: LinkType.values
                    .map<DropdownMenuEntry<LinkType>>(
                      (LinkType type) => DropdownMenuEntry<LinkType>(
                        value: type,
                        label: type.label,
                      ),
                    )
                    .toList(),
                enableSearch: false,
                initialSelection: linkType,
                onSelected: (LinkType? selection) async {
                  if (selection == null || selection == linkType) return;

                  await EzConfig.setString(linkTypeKey, selection.name);
                  setState(() => linkType = selection);
                },
              ),
            ],
          ),
          ezDivider,

          // Appearance
          EzElevatedIconButton(
            onPressed: () => context.goNamed(ezSettingsHomePath),
            icon: EzIcon(Icons.navigate_next),
            label: l10n.ssAppearance,
          ),
          ezSeparator,
        ]),
        useImageDecoration: false,
      ),
      fabs: const <Widget>[
        ezSpacer,
        EzBackFAB(
          hold4Feedback: true,
          appName: appName,
          supportEmail: empathSupport,
        ),
      ],
    );
  }
}
