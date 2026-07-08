/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class RightsView extends StatefulWidget {
  final EzCP config;

  const RightsView(this.config, {super.key});

  @override
  State<RightsView> createState() => _RightsViewState();
}

class _RightsViewState extends State<RightsView> {
  // Define the build data //

  Situation currTab = SituationConfig.safeLookup(EzCM.get(savedTabKey));
  int delta = 0;

  // Define custom functions //

  Future<void> _nav(Situation choice) async {
    delta = choice.position - currTab.position;

    await EzCM.setString(savedTabKey, choice.name);

    currTab = choice;
    if (mounted) setState(() {});
  }

  List<Widget> _unique(EzCP config) => switch (currTab) {
        Situation.walking => <Widget>[
            _rightsText(config, l10n(config).rvMobilePockets),
            _rightsText(config, l10n(config).rvMobileQuestion),
            _rightsText(config, l10n(config).rvMobileLeave),
          ],
        Situation.driving => <Widget>[
            _rightsText(config, l10n(config).rvMobilePockets),
            _rightsText(config, l10n(config).rvMobileQuestion),
            _rightsText(config, l10n(config).rvMobileLeave),
            _rightsText(config, l10n(config).rvDriveSearch),
            _rightsText(config, l10n(config).rvDriveID),
            _rightsText(config, l10n(config).rvDriveWarrant),
          ],
        Situation.home => <Widget>[_rightsText(config, l10n(config).rvHomeWarrant)],
      };

  // Return the build //

  @override
  Widget build(BuildContext context) {
    final Lang sosL10n = l10n(widget.config);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.config.marginVal),
      child: EzScrollView(
        widget.config,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Header
        children: <Widget>[
          Center(
            child: EzCol(
              children: <Widget>[
                Text(
                  sosL10n.rvSharedHeader,
                  textAlign: TextAlign.center,
                  style: widget.config.titleStyle,
                ),
                widget.config.spacer,

                // Switcher
                SegmentedButton<Situation>(
                  segments: Situation.values
                      .map((Situation sitch) => ButtonSegment<Situation>(
                            value: sitch,
                            label: EzIcon(widget.config, sitch.icon),
                            tooltip: sitch.tooltip(sosL10n),
                          ))
                      .toList(),
                  selected: <Situation>{currTab},
                  showSelectedIcon: false,
                  onSelectionChanged: (Set<Situation> selected) => _nav(selected.first),
                ),
              ],
            ),
          ),
          widget.config.separator,

          // Core
          EzFauxCarousel(
            widget.config,
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
                  _rightsText(widget.config, sosL10n.rvSharedRemainSilent),
                  _rightsText(widget.config, sosL10n.rvSharedDocument),
                  ..._unique(widget.config),
                  _rightsText(widget.config, sosL10n.rvSharedSign),
                  _rightsText(widget.config, sosL10n.rvSharedFingerprint),
                  _rightsText(widget.config, sosL10n.rvSharedLawyer),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Text _rightsText(EzCP config, String text) =>
    Text('$text\n', textAlign: TextAlign.start, style: config.bodyStyle);
