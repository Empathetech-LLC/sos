/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';
import 'package:efui_bios/efui_bios.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class TextSettingsScreen extends StatelessWidget {
  final EzTSType? target;

  const TextSettingsScreen({super.key, this.target});

  @override
  Widget build(BuildContext context) => SosScaffold(
        EzScreen(
          EzTextSettings(
            target: target,
            extraSaveKeys: extraKeys,
            appName: appName,
            androidPackage: androidPackage,
          ),
          useImageDecoration: false,
        ),
        fabs: <Widget>[
          EzConfig.spacer,
          EzConfigFAB(
            context,
            extraKeys: extraKeys,
            appName: appName,
            androidPackage: androidPackage,
          ),
          EzConfig.spacer,
          const EzBackFAB(
            hold4Feedback: true,
            appName: appName,
            supportEmail: empathSupport,
          ),
        ],
      );
}
