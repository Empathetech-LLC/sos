/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatefulWidget {
  SettingsHomeScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        EzScrollView(
          children: <Widget>[
            EzHeader(),

            // Language
            EzLocaleSetting(
              () => setState(() {}),
              locales: Lang.supportedLocales,
              skip: <Locale>{arabic, english, chinese}, // Dupes
              protest: true,
            ),
            EzConfig.spacer,

            // Auto-share media
            EzSwitchPair(text: l10n.ssAutoShare, valueKey: autoShareMediaKey),
            EzConfig.spacer,

            // GoTo SOS
            EzElevatedIconButton(
              onPressed: () => context.goNamed(sosSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: 'SOS',
            ),

            // GoTo Appearance
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
        const HelpFAB(),
        EzConfig.spacer,
        const EzBackFAB(showHome: true),
      ],
    );
  }
}
