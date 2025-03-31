/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

enum Location { walking, driving, home }

extension Symbol on Location {
  IconData get icon {
    switch (this) {
      case Location.walking:
        return Icons.directions_walk;
      case Location.driving:
        return Icons.drive_eta;
      case Location.home:
        return Icons.home;
    }
  }
}

class RightsView extends StatefulWidget {
  const RightsView({super.key});

  @override
  State<RightsView> createState() => _RightsViewState();
}

class _RightsViewState extends State<RightsView> {
  // Gather the theme data //

  late final Lang l10n = Lang.of(context)!;
  late final TextTheme textTheme = Theme.of(context).textTheme;

  // Define the build data //

  Location currentTab = Location.walking;

  // Define custom functions //

  Widget populateTab() {
    switch (currentTab) {
      case Location.walking:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[rightsBlock(l10n.rsWLeave)],
        );
      case Location.driving:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            rightsBlock(l10n.rsCSearch),
            rightsBlock(l10n.rsCPockets),
            rightsBlock(l10n.rsCWarrant),
            rightsBlock(l10n.rsCID),
            rightsBlock(l10n.rsCQuestion),
            rightsBlock(l10n.rsCLeave),
            rightsBlock(l10n.rsCRemainSilent),
          ],
        );
      case Location.home:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[rightsBlock(l10n.rsHWarrant)],
        );
    }
  }

  Text rightsBlock(String text) => Text(
        '$text\n',
        textAlign: TextAlign.center,
        style: textTheme.bodyLarge,
      );

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return EzScrollView(
      // Header
      children: <Widget>[
        Text(
          l10n.rsGHeader,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge,
        ),
        const EzSpacer(),

        // Switcher
        SegmentedButton<Location>(
          segments: <ButtonSegment<Location>>[
            ButtonSegment<Location>(
              value: Location.walking,
              label: Icon(Location.walking.icon),
            ),
            ButtonSegment<Location>(
              value: Location.driving,
              label: Icon(Location.driving.icon),
            ),
            ButtonSegment<Location>(
              value: Location.home,
              label: Icon(Location.home.icon),
            ),
          ],
          selected: <Location>{currentTab},
          showSelectedIcon: false,
          onSelectionChanged: (Set<Location> selected) =>
              setState(() => currentTab = selected.first),
        ),
        const EzSeparator(),

        // Shared rights
        rightsBlock(l10n.rsGFingerprint),

        // Specific rights
        populateTab(),
      ],
    );
  }
}
