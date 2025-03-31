/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SosScaffold extends StatelessWidget {
  /// [AppBar.title] passthrough (via [Text] widget)
  final String title;

  /// Whether to include [AppBar] in the [Scaffold]
  final bool showAppBar;

  /// [Scaffold.body] passthrough
  final Widget body;

  /// Standardized [Scaffold] for all of the EFUI example app's screens
  const SosScaffold({
    super.key,
    this.title = appTitle,
    this.showAppBar = true,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    // Gather the theme data //

    final bool isLefty = EzConfig.get(isLeftyKey) ?? false;
    final EFUILang l10n = EFUILang.of(context)!;

    late final double toolbarHeight = ezTextSize(
          appTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
          context: context,
        ).height +
        EzConfig.get(marginKey);

    // Define custom widgets //

    late final Widget options = MenuAnchor(
      builder: (_, MenuController controller, ___) => IconButton(
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
        tooltip: l10n.gOptions,
        icon: const Icon(Icons.more_vert),
      ),
      menuChildren: <Widget>[
        EzFeedbackMenuButton(
          parentContext: context,
          appName: appTitle,
          supportEmail: empathSupport,
        ),
      ],
    );

    // Return the build //

    final Widget theBuild = SelectionArea(
      child: Scaffold(
        // AppBar
        appBar: showAppBar
            ? PreferredSize(
                preferredSize: Size(double.infinity, toolbarHeight),
                child: AppBar(
                  excludeHeaderSemantics: true,
                  toolbarHeight: toolbarHeight,

                  // Leading (aka left)
                  leading: isLefty ? options : const EzBackAction(),
                  leadingWidth: toolbarHeight,

                  // Title
                  title: Text(title, textAlign: TextAlign.center),
                  centerTitle: true,
                  titleSpacing: 0,

                  // Actions (aka trailing aka right)
                  actions: <Widget>[isLefty ? const EzBackAction() : options],
                ),
              )
            : null,

        // Body
        body: body,

        // Prevents the keyboard from pushing the body up
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
