/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:sos/main.dart';
import 'package:sos/utils/consts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

void main() async {
  // Setup the test environment //

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesAsync preferences = SharedPreferencesAsync();
  EzConfig.init(
    assetPaths: assetPaths,
    defaults: empathMobileConfig,
    fallbackLang: await EFUILang.delegate.load(americanEnglish),
    preferences: preferences,
    storedKeys: await preferences.getKeys(),
  );

  // Run the tests //

  group(
    'Generated tests',
    () {
      testWidgets('Test randomizer', (WidgetTester tester) async {
        ezLog('Loading SOS');
        await tester.pumpWidget(const SOS());
        await tester.pumpAndSettle();
      });
    },
  );
}
