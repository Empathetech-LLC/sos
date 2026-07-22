/* sos
 * Copyright (c) 2025 YWT (Empathetech LLC). All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SosScaffold extends StatelessWidget {
  final EzCP config;
  final Widget body;
  final List<Widget>? fabs;
  final bool isHome;

  const SosScaffold(this.config, {super.key, required this.body, this.fabs, this.isHome = false});

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
                  'https://raw.githubusercontent.com/YWT-LLC/sos/refs/heads/main/APP_VERSION',
              gPlay: 'https://play.google.com/store/apps/details?id=llc.ywt.sos',
              appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
              github: 'https://github.com/YWT-LLC/sos/releases',
            ),
            if (fabs != null) ...fabs!,
            ...config.backFABs(isHome),
          ],
        ),
      );
}
