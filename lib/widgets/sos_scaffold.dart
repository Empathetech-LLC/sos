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
    final bool isLefty = EzConfig.get(isLeftyKey) ?? false;

    final Widget theBuild = SelectionArea(
      child: Scaffold(
        body: SafeArea(child: body),
        floatingActionButton: fab,
        floatingActionButtonLocation: isLefty
            ? FloatingActionButtonLocation.startFloat
            : FloatingActionButtonLocation.endFloat,
        resizeToAvoidBottomInset: false,
      ),
    );

    // SOS doesn't directly use the SwapScaffold, but the EzSettingsScreens do
    return EzSwapScaffold(
      small: theBuild,
      large: theBuild,
      threshold: smallBreakpoint,
    );
  }
}
