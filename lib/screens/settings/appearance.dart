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

class AppearanceSettingsScreen extends StatelessWidget {
  AppearanceSettingsScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        Center(
          child: EzScrollView(children: <Widget>[
            // Global settings
            const EzDominantHandSwitch(doNothing),
            EzConfig.spacer,

            const EzThemeModeSwitch(doNothing),
            EzConfig.divider,

            EzElevatedIconButton(
              onPressed: () => context.goNamed(colorSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: EzConfig.l10n.csPageTitle,
            ),
            EzConfig.spacer,

            EzElevatedIconButton(
              onPressed: () => context.goNamed(designSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: EzConfig.l10n.dsPageTitle,
            ),
            EzConfig.spacer,

            EzElevatedIconButton(
              onPressed: () => context.goNamed(layoutSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: EzConfig.l10n.lsPageTitle,
            ),
            EzConfig.spacer,

            EzElevatedIconButton(
              onPressed: () => context.goNamed(textSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: EzConfig.l10n.tsPageTitle,
            ),
            EzConfig.divider,

            const EzQuickConfig(
              doNothing,
              chalkboard: false,
              nebula: false,
            ),
            EzConfig.spacer,

            EzResetButton(
              doNothing,
              resetSkip: neverResetKeys,
              appName: appName,
              androidPackage: androidPackage,
            ),
          ]),
        ),
        useImageDecoration: false,
      ),
      fabs: <Widget>[
        EzConfig.spacer,
        EzConfigFAB(
          context,
          appName: appName,
          androidPackage: androidPackage,
        ),
        EzConfig.spacer,
        const EzBackFAB(),
      ],
    );
  }
}
