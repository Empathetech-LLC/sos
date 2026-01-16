/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';
import 'package:efui_bios/efui_bios.dart';

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
  // Gather the theme data //

  late final Lang l10n = Lang.of(context)!;

  // Return the build //

  @override
  Widget build(BuildContext context) {
    const EzSpacer ezSpacer = EzSpacer();
    const EzDivider ezDivider = EzDivider();

    return SosScaffold(
      EzScreen(
        Center(
          child: EzScrollView(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Global settings
              const EzDominantHandSwitch(),
              ezSpacer,

              const EzThemeModeSwitch(),
              ezDivider,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(colorSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: EzConfig.l10n.csPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(designSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: EzConfig.l10n.dsPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(layoutSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: EzConfig.l10n.lsPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(textSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: EzConfig.l10n.tsPageTitle,
              ),
              ezDivider,

              const EzQuickConfig(
                videoGame: false,
                chalkboard: false,
                fancyPants: false,
              ),
              ezSpacer,

              EzResetButton(
                onConfirm: () async {
                  await EzConfig.removeKeys(<String>{
                    ...allEZConfigKeys.keys,
                    videoColorKey,
                  });
                  setState(() {});
                },
                extraKeys: extraKeys,
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
        ezSpacer,
        EzConfigFAB(
          context,
          extraKeys: extraKeys,
          appName: appName,
          androidPackage: androidPackage,
        ),
        ezSpacer,
        const EzBackFAB(
          hold4Feedback: true,
          appName: appName,
          supportEmail: empathSupport,
        ),
      ],
    );
  }
}
