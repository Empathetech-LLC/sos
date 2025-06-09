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

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

  // Define the build data //

  bool sosOnOpen = EzConfig.get(onOpenKey) ?? false;
  bool sosOnClose = EzConfig.get(onCloseKey) ?? false;
  bool sosOnInterrupt = EzConfig.get(onInterruptKey) ?? false;

  // Define custom functions //

  Future<bool> attemptToSet(String key, bool value) async {
    if (value == false) return EzConfig.setBool(key, value);

    final PermissionStatus canSMS = await Permission.sms.request();

    if (canSMS != PermissionStatus.denied &&
        canSMS != PermissionStatus.permanentlyDenied) {
      return EzConfig.setBool(key, value);
    } else {
      if (mounted) ezSnackBar(context: context, message: l10n.sosNeedSMS);
      return false;
    }
  }

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, el10n.ssPageTitle);
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      title: el10n.ssPageTitle,
      body: EzScreen(
        useImageDecoration: false,
        child: EzScrollView(
          children: <Widget>[
            // Functionality disclaimer
            EzWarning(el10n.ssSettingsGuide.split('\n').first),
            separator,

            // Language
            const EzLocaleSetting(
              locales: Lang.supportedLocales,
              skip: <Locale>[arabic, english, chinese], // Dupes
            ),
            separator,

            // SOS
            _SettingsCheckbox(
              title: l10n.ssSOSOnOpen,
              value: sosOnOpen,
              onChanged: (bool? value) async {
                if (value == null) return;

                final bool refresh = await attemptToSet(onOpenKey, value);
                if (refresh) setState(() => sosOnOpen = value);
              },
            ),
            spacer,

            if (!isIOS) ...<Widget>[
              _SettingsCheckbox(
                title: l10n.ssSOSOnClose,
                value: sosOnClose,
                onChanged: (bool? value) async {
                  if (value == null) return;

                  if (value == true) {
                    await showPlatformDialog(
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
                            onPressed: Navigator.of(context).pop,
                          ),
                        ],
                        cupertinoActions: <Widget>[
                          EzCupertinoAction(
                            text: l10n.gOk,
                            onPressed: Navigator.of(context).pop,
                          ),
                        ],
                        needsClose: false,
                      ),
                    );
                  }

                  final bool refresh = await attemptToSet(onCloseKey, value);
                  if (refresh) setState(() => sosOnClose = value);
                },
              ),
              spacer,
            ],

            if (!isIOS)
              _SettingsCheckbox(
                title: l10n.ssVideoSOS,
                value: sosOnInterrupt,
                onChanged: (bool? value) async {
                  if (value == null) return;

                  final bool refresh =
                      await attemptToSet(onInterruptKey, value);
                  if (refresh) setState(() => sosOnInterrupt = value);
                },
              ),
            isIOS ? spacer : separator,

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
    );
  }
}

class _SettingsCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?) onChanged;

  const _SettingsCheckbox({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => EzRow(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: EzText(title, textAlign: TextAlign.center)),
          EzCheckbox(value: value, onChanged: onChanged),
        ],
      );
}
