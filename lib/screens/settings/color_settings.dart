/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ColorSettingsScreen extends StatelessWidget {
  final EzCSType? target;

  const ColorSettingsScreen({super.key, this.target});

  @override
  Widget build(BuildContext context) => SosScaffold(
        EzScreen(
          EzColorSettings(
            target: target,
            darkStarterSet: const <String>[
              videoColorKey,
              darkPrimaryKey,
              darkSurfaceKey,
              darkOnSurfaceKey,
              darkSurfaceContainerKey,
            ],
            lightStarterSet: const <String>[
              videoColorKey,
              lightPrimaryKey,
              lightSurfaceKey,
              lightOnSurfaceKey,
              lightSurfaceContainerKey,
            ],
          ),
          useImageDecoration: false,
        ),
        fabs: <Widget>[
          ezSpacer,
          EzConfigFAB(
            context,
            appName: appName,
            androidPackage: packageName,
          ),
          ezSpacer,
          EzBackFAB(context),
        ],
      );
}
