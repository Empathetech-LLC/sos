/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:sos/screens/export.dart';

import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      title: EFUILang.of(context)!.ssPageTitle,
      body: EzScreen(
        child: EzScrollView(
          children: <Widget>[
            EzElevatedIconButton(
              onPressed: () => context.goNamed(ezSettingsHomePath),
              icon: EzIcon(Icons.navigate_next),
              label: 'Appearance',
            ),
          ],
        ),
      ),
    );
  }
}
