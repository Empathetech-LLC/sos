/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ColorSettingsScreen extends StatefulWidget {
  final EzCSType? target;

  ColorSettingsScreen({this.target}) : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<ColorSettingsScreen> createState() => _ColorSettingsScreenState();
}

class _ColorSettingsScreenState extends State<ColorSettingsScreen> {
  bool updateBoth = false;

  @override
  Widget build(BuildContext context) => SosScaffold(
        EzScreen(
          EzColorSettings(
            target: widget.target,
            onUpdate: () {
              if (mounted) setState(() {});
            },
            updateBoth: updateBoth,
            appName: appName,
            androidPackage: androidPackage,
            darkStarterSet: const <String>[
              darkPrimaryKey,
              darkSurfaceKey,
              darkOnSurfaceKey,
              darkSurfaceContainerKey,
              darkVideoColorKey,
            ],
            lightStarterSet: const <String>[
              lightPrimaryKey,
              lightSurfaceKey,
              lightOnSurfaceKey,
              lightSurfaceContainerKey,
              lightVideoColorKey,
            ],
          ),
          useImageDecoration: false,
        ),
        fabs: <Widget>[
          EzConfig.spacer,
          EzSettingsDupeFAB(
            updateBoth,
            () {
              if (mounted) setState(() => updateBoth = !updateBoth);
            },
          ),
        ],
      );
}
