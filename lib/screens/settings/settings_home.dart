/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../screens/export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({super.key});

  static const EzSpacer spacer = EzSpacer();

  @override
  Widget build(BuildContext context) {
    final Lang l10n = Lang.of(context)!;

    return SosScaffold(
      title: EFUILang.of(context)!.ssPageTitle,
      showSettings: false,
      body: EzSettingsHome(
        notFun: true,
        additionalSettings: <Widget>[
          EzText(l10n.ssNotifyOnOpen),
          spacer,
          EzText(l10n.ssNotifyOnClose),
          spacer,
          EzText(l10n.ssNotifyOnSOS),
        ],
        textSettingsPath: textSettingsPath,
        layoutSettingsPath: layoutSettingsPath,
        colorSettingsPath: colorSettingsPath,
        imageSettingsPath: null,
        allowRandom: false,
      ),
    );
  }
}
