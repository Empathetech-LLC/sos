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

class EzSettingsHomeScreen extends StatefulWidget {
  const EzSettingsHomeScreen({super.key});

  @override
  State<EzSettingsHomeScreen> createState() => _EzSettingsHomeScreenState();
}

class _EzSettingsHomeScreenState extends State<EzSettingsHomeScreen> {
  // Gather the theme data //

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

  // Return the build //

  @override
  Widget build(BuildContext context) {
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
                label: el10n.csPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(designSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.dsPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(layoutSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.lsPageTitle,
              ),
              ezSpacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(textSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.tsPageTitle,
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
                    ...allKeys.keys,
                    videoColorKey,
                  });
                  setState(() {});
                },
              ),
              ezSeparator,
            ],
          ),
        ),
        useImageDecoration: false,
      ),
      fabs: <Widget>[
        ezSpacer,
        EzConfigFAB(
          context,
          appName: appName,
          androidPackage: packageName,
        ),
        ezSpacer,
        EzBackFAB(context),
      ],
    );
  }
}
