/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

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

  final bool isIOS = isApple();

  static const EzSpacer spacer = EzSpacer();
  static const EzSeparator separator = EzSeparator();
  static const EzDivider divider = EzDivider();

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

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
        useImageDecoration: false,
        child: EzScrollView(
          children: <Widget>[
            // Functionality disclaimer
            EzWarning(el10n.ssSettingsGuide.split('\n').first),
            spacer,

            // Language
            EzLocaleSetting(
              locales: Lang.supportedLocales,
              skip: <Locale>{arabic, english, chinese}, // Dupes
              protest: true,
            ),
            isIOS ? separator : divider,

            // SOS on open
            EzSwitchPair(
              text: l10n.ssSOSOnOpen,
              valueKey: onOpenKey,
              canChange: (bool choice) => canSet(onOpenKey, choice),
            ),

            if (!isIOS) ...<Widget>[
              spacer,

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
              spacer,

              // SOS on interrupt
              EzSwitchPair(
                text: l10n.ssVideoSOS,
                valueKey: onInterruptKey,
                canChange: (bool choice) => canSet(onInterruptKey, choice),
              ),
            ],
            isIOS ? separator : divider,

            // EMC
            const ContactList(),
            separator,

            // Appearance
            EzElevatedIconButton(
              onPressed: () => context.goNamed(ezSettingsHomePath),
              icon: EzIcon(Icons.navigate_next),
              label: l10n.ssAppearance,
            ),
            separator,
          ],
        ),
      ),
      fab: EzBackFAB(context, showHome: true),
    );
  }
}
