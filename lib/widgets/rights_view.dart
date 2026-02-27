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

  Situation currentTab = SituationConfig.lookup(EzConfig.get(savedTabKey));

  // Define custom functions //

  Widget populateTab() {
    switch (currentTab) {
      case Situation.walking:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rvMobilePockets),
            rightsBlock(l10n.rvMobileQuestion),
            rightsBlock(l10n.rvMobileLeave),
          ],
        );
      case Situation.driving:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            rightsBlock(l10n.rvMobilePockets),
            rightsBlock(l10n.rvMobileQuestion),
            rightsBlock(l10n.rvMobileLeave),
            rightsBlock(l10n.rvDriveSearch),
            rightsBlock(l10n.rvDriveID),
            rightsBlock(l10n.rvDriveWarrant),
          ],
        );
      case Situation.home:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[rightsBlock(l10n.rvHomeWarrant)],
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
                  l10n.rvSharedHeader,
                  textAlign: TextAlign.center,
                  style: EzConfig.styles.titleLarge,
                ),
              ),
              EzConfig.spacer,

              // Switcher
              Center(
                child: SegmentedButton<Situation>(
                  segments: <ButtonSegment<Situation>>[
                    ButtonSegment<Situation>(
                      value: Situation.walking,
                      label: Icon(Situation.walking.icon),
                      tooltip: l10n.rvOnFoot,
                    ),
                    ButtonSegment<Situation>(
                      value: Situation.driving,
                      label: Icon(Situation.driving.icon),
                      tooltip: l10n.rvWhileDriving,
                    ),
                    ButtonSegment<Situation>(
                      value: Situation.home,
                      label: Icon(Situation.home.icon),
                      tooltip: l10n.rvAtHome,
                    ),
                  ],
                  selected: <Situation>{currentTab},
                  showSelectedIcon: false,
                  onSelectionChanged: (Set<Situation> selected) async {
                    currentTab = selected.first;
                    await EzConfig.setString(savedTabKey, currentTab.name);
                    setState(() {});
                  },
                ),
              ),
              EzConfig.separator,

              // Shared rights I
              rightsBlock(l10n.rvSharedRemainSilent),
              rightsBlock(l10n.rvSharedDocument),

              // Situational rights
              populateTab(),

              // Shared rights II
              rightsBlock(l10n.rvSharedSign),
              rightsBlock(l10n.rvSharedFingerprint),
              rightsBlock(l10n.rvSharedLawyer),
            ],
          ),
        ),
      );
}
