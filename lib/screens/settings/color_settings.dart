/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ColorSettingsScreen extends StatelessWidget {
  final EzSettingType? target;

  const ColorSettingsScreen({super.key, this.target});

  @override
  Widget build(BuildContext context) => SosScaffold(
        title: EFUILang.of(context)!.csPageTitle,
        showSettings: false,
        body: EzColorSettings(
          target: target,
          lightStarterSet: const <String>[
            recordColorKey,
            lightPrimaryKey,
            lightSurfaceKey,
            lightOnSurfaceKey,
            lightSurfaceContainerKey,
          ],
          darkStarterSet: const <String>[
            recordColorKey,
            darkPrimaryKey,
            darkSurfaceKey,
            darkOnSurfaceKey,
            darkSurfaceContainerKey,
          ],
        ),
        fab: EzBackFAB(context),
      );
}
