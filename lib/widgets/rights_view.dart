/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class RightsView extends StatefulWidget {
  final bool hide;

  const RightsView({super.key, this.hide = false});

  @override
  State<RightsView> createState() => _RightsViewState();
}

class _RightsViewState extends State<RightsView> {
  // Define the build data //

  Location currentTab = LocationConfig.lookup(EzConfig.get(savedTabKey));

  // Define custom functions //

  Widget populateTab() {
    switch (currentTab) {
      case Location.walking:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rsMobilePockets),
            rightsBlock(l10n.rsMobileQuestion),
            rightsBlock(l10n.rsMobileLeave),
          ],
        );
      case Location.driving:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rsMobilePockets),
            rightsBlock(l10n.rsMobileQuestion),
            rightsBlock(l10n.rsMobileLeave),
            rightsBlock(l10n.rsDriveSearch),
            rightsBlock(l10n.rsDriveID),
            rightsBlock(l10n.rsDriveWarrant),
          ],
        );
      case Location.home:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[rightsBlock(l10n.rsHomeWarrant)],
        );
    }
  }

  Text rightsBlock(String text) => Text(
        '$text\n',
        textAlign: TextAlign.start,
        style: EzConfig.styles.bodyLarge,
      );

  // Return the build //

  @override
  Widget build(BuildContext context) => Visibility(
        visible: !widget.hide,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: EzConfig.marginVal),
          child: EzScrollView(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Header
            children: <Widget>[
              Center(
                child: Text(
                  l10n.rsSharedHeader,
                  textAlign: TextAlign.center,
                  style: EzConfig.styles.titleLarge,
                ),
              ),
              EzConfig.spacer,

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
                  onSelectionChanged: (Set<Location> selected) async {
                    currentTab = selected.first;
                    await EzConfig.setString(savedTabKey, currentTab.name);
                    setState(() {});
                  },
                ),
              ),
              EzConfig.separator,

              // Shared rights I
              rightsBlock(l10n.rsSharedRemainSilent),
              rightsBlock(l10n.rsSharedDocument),

              // Situational rights
              populateTab(),

              // Shared rights II
              rightsBlock(l10n.rsSharedSign),
              rightsBlock(l10n.rsSharedFingerprint),
              rightsBlock(l10n.rsSharedLawyer),
            ],
          ),
        ),
      );
}
