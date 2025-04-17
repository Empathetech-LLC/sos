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
  final bool hide;

  const RightsView({super.key, this.hide = false});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rsWalkPockets),
            rightsBlock(l10n.rsWalkLeave),
          ],
        );
      case Location.driving:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rsDriveSearch),
            rightsBlock(l10n.rsDrivePockets),
            rightsBlock(l10n.rsDriveID),
            rightsBlock(l10n.rsDriveQuestion),
            rightsBlock(l10n.rsDriveWarrant),
            rightsBlock(l10n.rsDriveLeave),
          ],
        );
      case Location.home:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rsHomeWarrant),
          ],
        );
    }
  }

  Text rightsBlock(String text) => Text(
        '$text\n',
        textAlign: TextAlign.start,
        style: textTheme.bodyLarge,
      );

  // Return the build //

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !widget.hide,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: EzConfig.get(marginKey)),
        child: EzScrollView(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Header
          children: <Widget>[
            Center(
              child: Text(
                l10n.rsSharedHeader,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
            ),
            const EzSpacer(),

            // Switcher
            Center(
              child: SegmentedButton<Location>(
                segments: <ButtonSegment<Location>>[
                  ButtonSegment<Location>(
                    value: Location.walking,
                    label: Icon(Location.walking.icon),
                    tooltip: l10n.rsOnFoot,
                  ),
                  ButtonSegment<Location>(
                    value: Location.driving,
                    label: Icon(Location.driving.icon),
                    tooltip: l10n.rsWhileDriving,
                  ),
                  ButtonSegment<Location>(
                    value: Location.home,
                    label: Icon(Location.home.icon),
                    tooltip: l10n.rsAtHome,
                  ),
                ],
                selected: <Location>{currentTab},
                showSelectedIcon: false,
                onSelectionChanged: (Set<Location> selected) =>
                    setState(() => currentTab = selected.first),
              ),
            ),
            const EzSeparator(),

            // Shared rights
            rightsBlock(l10n.rsSharedRemainSilent),
            rightsBlock(l10n.rsSharedDocument),

            // Specific rights
            populateTab(),

            // Shared rights II
            rightsBlock(l10n.rsSharedFingerprint),
            rightsBlock(l10n.rsSharedLawyer),
          ],
        ),
      ),
    );
  }
}
