/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsHomeScreen extends StatefulWidget {
  const SettingsHomeScreen({super.key});

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  // Gather the theme data //

  final double margin = EzConfig.get(marginKey);
  final double spacing = EzConfig.get(spacingKey);

  static const EzSpacer spacer = EzSpacer();
  static const EzSeparator separator = EzSeparator();

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = EFUILang.of(context)!;

  // Define the build data //

  bool sosOnOpen = EzConfig.get(onOpenKey) ?? false;
  bool sosOnClose = EzConfig.get(onCloseKey) ?? false;
  bool sosOnInterrupt = EzConfig.get(onInterruptKey) ?? false;

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, 'App settings');
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
            if (spacing > margin) EzSpacer(space: spacing - margin),

            // Language
            const EzLocaleSetting(),
            separator,

            // SOS
            _SettingsCheckbox(
              title: 'SOS on open',
              value: sosOnOpen,
              onChanged: (bool? value) async {
                if (value == null) return;
                await EzConfig.setBool(onOpenKey, value);
                setState(() => sosOnOpen = value);
              },
            ),
            spacer,

            _SettingsCheckbox(
              title: 'SOS on lock',
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
                        const Text(
                          "When 'SOS on lock' is enabled, a safe close button will appear on the home screen (opposite the settings).\n\nUse this to close the app without activating SOS",
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

                await EzConfig.setBool(onCloseKey, value);
                setState(() => sosOnClose = value);
              },
            ),
            spacer,

            _SettingsCheckbox(
              title: 'SOS on interrupted recording',
              value: sosOnInterrupt,
              onChanged: (bool? value) async {
                if (value == null) return;
                await EzConfig.setBool(onInterruptKey, value);
                setState(() => sosOnInterrupt = value);
              },
            ),
            separator,

            // EMC
            const ContactList(),
            separator,

            // Appearance
            EzElevatedIconButton(
              onPressed: () => context.goNamed(ezSettingsHomePath),
              icon: EzIcon(Icons.navigate_next),
              label: 'Appearance',
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
  Widget build(BuildContext context) {
    return EzRow(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: EzText(title, textAlign: TextAlign.center)),
        EzCheckbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
