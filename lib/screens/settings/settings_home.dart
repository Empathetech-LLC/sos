/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:sos/screens/export.dart';

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

  static const EzSeparator separator = EzSeparator();

  // Init //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ezWindowNamer(context, 'App settings');
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SosScaffold(
      title: EFUILang.of(context)!.ssPageTitle,
      body: EzScreen(
        child: EzScrollView(
          children: <Widget>[
            if (spacing > margin) EzSpacer(space: spacing - margin),

            // Language
            const EzLocaleSetting(),
            separator,

            // SOS
            Text('Setting', style: textTheme.bodyLarge),
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
