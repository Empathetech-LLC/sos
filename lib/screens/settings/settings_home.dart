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

  late final EFUILang el10n = EFUILang.of(context)!;

  // Define the build data //

  bool sosOnOpen = EzConfig.get(onOpenKey);
  bool sosOnClose = EzConfig.get(onCloseKey);
  bool sosOnInterrupt = EzConfig.get(onInterruptKey);

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
              title: 'Auto SOS on open',
              value: sosOnOpen,
              onChanged: (bool? value) {
                if (value == null) return;
                setState(() => sosOnOpen = value);
              },
            ),
            spacer,

            _SettingsCheckbox(
              title: 'Auto SOS on close',
              value: sosOnClose,
              onChanged: (bool? value) {
                if (value == null) return;
                setState(() => sosOnClose = value);
              },
            ),
            spacer,

            _SettingsCheckbox(
              title: 'Auto SOS on interrupted recording',
              value: sosOnInterrupt,
              onChanged: (bool? value) {
                if (value == null) return;
                setState(() => sosOnInterrupt = value);
              },
            ),
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
