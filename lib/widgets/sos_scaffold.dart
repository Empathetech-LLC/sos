/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SosScaffold extends StatelessWidget {
  /// [Scaffold.body] passthrough
  final Widget body;

  /// [FloatingActionButton]
  final Widget? fab;

  /// Standardized [Scaffold] for all of the EFUI example app's screens
  const SosScaffold(this.body, {super.key, this.fab});

  @override
  Widget build(BuildContext context) {
    const Widget updater = EzUpdaterFAB(
      appVersion: '1.4.1',
      versionSource:
          'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
      gPlay:
          'https://play.google.com/store/apps/details?id=net.empathetech.sos',
      appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
      github: 'https://github.com/Empathetech-LLC/sos/releases',
    );

    return EzAdaptiveParent(
      small: SelectionArea(
        child: Scaffold(
          body: SafeArea(child: body),
          floatingActionButton: fab == null
              ? updater
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[updater, ezSpacer, fab!],
                ),
          floatingActionButtonLocation: EzConfig.get(isLeftyKey)
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
