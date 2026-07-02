/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SosScaffold extends StatelessWidget {
  final EzCP config;
  final Widget body;
  final List<Widget>? fabs;
  final bool isHome;

  const SosScaffold(
    this.config, {
    super.key,
    required this.body,
    this.fabs,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) => EzAdaptiveParent(
        small: EzScaffold(
          config,
          body: body,
          fabs: <Widget>[
            EzUpdaterFAB(
              config,
              appVersion: '3.0.2',
              versionSource:
                  'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
              gPlay: 'https://play.google.com/store/apps/details?id=net.empathetech.sos',
              appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
              github: 'https://github.com/Empathetech-LLC/sos/releases',
            ),
            if (fabs != null) ...fabs!,
            ...config.backFABs(isHome),
          ],
        ),
      );
}
