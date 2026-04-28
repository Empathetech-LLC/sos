/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SosScaffold extends StatelessWidget {
  /// [Scaffold.body] passthrough
  final Widget body;

  /// [FloatingActionButton]s to add on top of the [EzUpdaterFAB]
  /// BYO spacing widgets
  final List<Widget>? fabs;

  /// Standardized [Scaffold] for all screens
  const SosScaffold(this.body, {super.key, this.fabs});

  @override
  Widget build(BuildContext context) => EzAdaptiveParent(
        small: Consumer<EzConfigProvider>(
          builder: (_, EzConfigProvider config, __) => Scaffold(
            key: ValueKey<int>(config.seed),
            body: SafeArea(child: body),
            floatingActionButton: EzCol(children: <Widget>[
              const EzUpdaterFAB(
                appVersion: '2.0.3',
                versionSource:
                    'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
                gPlay: 'https://play.google.com/store/apps/details?id=net.empathetech.sos',
                appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
                github: 'https://github.com/Empathetech-LLC/sos/releases',
              ),
              if (fabs != null) ...fabs!,
              if (config.design.showBackFAB && ezRootNav.currentState!.canPop()) ...<Widget>[
                config.layout.spacer,
                const EzBackFAB(),
              ],
            ]),
            floatingActionButtonLocation: EzConfig.isLefty
                ? FloatingActionButtonLocation.startFloat
                : FloatingActionButtonLocation.endFloat,
            resizeToAvoidBottomInset: false,
          ),
        ),
      );
}
