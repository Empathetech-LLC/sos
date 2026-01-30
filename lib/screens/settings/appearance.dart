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

class AppearanceSettingsScreen extends StatefulWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  State<AppearanceSettingsScreen> createState() =>
      _AppearanceSettingsScreenState();
}

class _AppearanceSettingsScreenState extends State<AppearanceSettingsScreen> {
  // Return the build //

  @override
  Widget build(BuildContext context) => SosScaffold(
        EzScreen(
          Center(
            child: EzScrollView(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Global settings
                const EzDominantHandSwitch(),
                EzConfig.spacer,

                const EzThemeModeSwitch(),
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
                  videoGame: false,
                  chalkboard: false,
                  fancyPants: false,
                ),
                EzConfig.spacer,

                EzResetButton(
                  onConfirm: () => EzConfig.removeKeys(<String>{
                    ...allEZConfigKeys.keys,
                    EzConfig.isDark ? darkVideoColorKey : lightVideoColorKey,
                  }),
                  resetSkip: neverResetKeys,
                  appName: appName,
                  androidPackage: androidPackage,
                ),
                EzConfig.separator,
              ],
            ),
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
