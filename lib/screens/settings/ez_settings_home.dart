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

  static const EzSpacer spacer = EzSpacer();
  static const EzSeparator separator = EzSeparator();
  static const EzDivider divider = EzDivider();

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
              spacer,

              const EzThemeModeSwitch(),
              divider,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(colorSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.csPageTitle,
              ),
              spacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(designSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.dsPageTitle,
              ),
              spacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(layoutSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.lsPageTitle,
              ),
              spacer,

              EzElevatedIconButton(
                onPressed: () => context.goNamed(textSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: el10n.tsPageTitle,
              ),
              divider,

              const EzQuickConfig(
                videoGame: false,
                chalkboard: false,
                fancyPants: false,
              ),
              spacer,

              EzResetButton(
                onConfirm: () async {
                  await EzConfig.removeKeys(<String>{
                    ...empathMobileConfig.keys,
                    videoColorKey,
                  });
                  setState(() {});
                },
              ),
              separator,
            ],
          ),
        ),
        useImageDecoration: false,
      ),
      fab: EzConfigFAB(
        context,
        appName: appName,
        androidPackage: packageName,
      ),
    );
  }
}
