/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class RightsView extends StatefulWidget {
  const RightsView({super.key});

  @override
  State<RightsView> createState() => _RightsViewState();
}

class _RightsViewState extends State<RightsView> {
  // Define the build data //

  Situation currTab = SituationConfig.lookup(EzConfig.get(savedTabKey));
  int delta = 0;

  // Define custom functions //

  Future<void> _nav(Situation choice) async {
    delta = choice.position - currTab.position;

    await EzConfig.setString(savedTabKey, choice.name);

    currTab = choice;
    if (mounted) setState(() {});
  }

  List<Widget> _unique() => switch (currTab) {
        Situation.walking => <Widget>[
            _rightsText(l10n.rvMobilePockets),
            _rightsText(l10n.rvMobileQuestion),
            _rightsText(l10n.rvMobileLeave),
          ],
        Situation.driving => <Widget>[
            _rightsText(l10n.rvMobilePockets),
            _rightsText(l10n.rvMobileQuestion),
            _rightsText(l10n.rvMobileLeave),
            _rightsText(l10n.rvDriveSearch),
            _rightsText(l10n.rvDriveID),
            _rightsText(l10n.rvDriveWarrant),
          ],
        Situation.home => <Widget>[_rightsText(l10n.rvHomeWarrant)],
      };

  // Return the build //

  @override
  Widget build(BuildContext context) => Padding(
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
                segments: Situation.values
                    .map((Situation sitch) => ButtonSegment<Situation>(
                          value: sitch,
                          label: EzIcon(sitch.icon),
                          tooltip: sitch.tooltip,
                        ))
                    .toList(),
                selected: <Situation>{currTab},
                showSelectedIcon: false,
                onSelectionChanged: (Set<Situation> selected) => _nav(selected.first),
              ),
            ),
            EzConfig.separator,

            // Core
            EzFauxCarousel(
              animMod: 0.5,
              position: currTab.position,
              delta: delta,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) async {
                  if (details.primaryVelocity == null) return;

                  if (details.primaryVelocity! < -100) {
                    // RTL -> nav right
                    if (currTab.position >= (Situation.values.length - 1)) return;
                    await _nav(Situation.values[currTab.position + 1]);
                  }

                  if (details.primaryVelocity! > 100) {
                    // LTR -> nav left
                    if (currTab.position <= 0) return;
                    await _nav(Situation.values[currTab.position - 1]);
                  }
                },
                child: EzCol(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _rightsText(l10n.rvSharedRemainSilent),
                    _rightsText(l10n.rvSharedDocument),
                    ..._unique(),
                    _rightsText(l10n.rvSharedSign),
                    _rightsText(l10n.rvSharedFingerprint),
                    _rightsText(l10n.rvSharedLawyer),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

Text _rightsText(String text) =>
    Text('$text\n', textAlign: TextAlign.start, style: EzConfig.styles.bodyLarge);
