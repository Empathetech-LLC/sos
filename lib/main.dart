/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './screens/export.dart';
import './utils/export.dart';

import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feedback/feedback.dart';
import 'package:go_router/go_router.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

/// Entry point (separate [Isolate]) version of [sendSOS]
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((String task, Map<String, dynamic>? inputData) {
    if (task == broadcastTask) sendSOS();
    return Future<bool>.value(true);
  });
}

void main() async {
  // Setup the app //

  WidgetsFlutterBinding.ensureInitialized();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Initialize EzConfig //

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  EzConfig.init(
    assetPaths: <String>{},
    preferences: prefs,
    defaults: sosConfig,
  );

  // Run the app //
  // With a feedback wrapper

  late final TextStyle lightFeedbackText = ezBodyStyle(Colors.black);
  late final TextStyle darkFeedbackText = ezBodyStyle(Colors.white);

  runApp(BetterFeedback(
    theme: FeedbackThemeData(
      background: Colors.grey,
      feedbackSheetColor: Colors.white,
      activeFeedbackModeColor: empathPurple,
      bottomSheetDescriptionStyle: lightFeedbackText,
      bottomSheetTextInputStyle: lightFeedbackText,
      sheetIsDraggable: true,
      dragHandleColor: Colors.black,
    ),
    darkTheme: FeedbackThemeData(
      background: Colors.grey,
      feedbackSheetColor: Colors.black,
      activeFeedbackModeColor: empathEucalyptus,
      bottomSheetDescriptionStyle: darkFeedbackText,
      bottomSheetTextInputStyle: darkFeedbackText,
      sheetIsDraggable: true,
      dragHandleColor: Colors.white,
    ),
    themeMode: EzConfig.getThemeMode(),
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      const LocaleNamesLocalizationsDelegate(),
      ...EFUILang.localizationsDelegates,
      ...Lang.localizationsDelegates,
      EmpathetechFeedbackLocalizationsDelegate(),
    ],
    localeOverride: EzConfig.getLocale(),
    child: const SOS(),
  ));
}

/// Initialize a path based router for web-enabled apps
/// Or any other app that requires deep linking
/// https://docs.flutter.dev/ui/navigation/deep-linking
final GoRouter router = GoRouter(
  initialLocation: homePath,
  errorBuilder: (_, GoRouterState state) => ErrorScreen(state.error),
  routes: <RouteBase>[
    GoRoute(
      path: homePath,
      name: homePath,
      builder: (_, __) => const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: settingsHomePath,
          name: settingsHomePath,
          builder: (_, __) => const SettingsHomeScreen(),
        ),
        GoRoute(
          path: ezSettingsHomePath,
          name: ezSettingsHomePath,
          builder: (_, __) => const EzSettingsHomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: textSettingsPath,
              name: textSettingsPath,
              builder: (_, __) => const TextSettingsScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: EzSettingType.quick.path,
                  name: 'text_quick',
                  builder: (_, __) =>
                      const TextSettingsScreen(target: EzSettingType.quick),
                ),
                GoRoute(
                  path: EzSettingType.advanced.path,
                  name: 'text_advanced',
                  builder: (_, __) =>
                      const TextSettingsScreen(target: EzSettingType.advanced),
                ),
              ],
            ),
            GoRoute(
              path: layoutSettingsPath,
              name: layoutSettingsPath,
              builder: (_, __) => const LayoutSettingsScreen(),
            ),
            GoRoute(
              path: colorSettingsPath,
              name: colorSettingsPath,
              builder: (_, __) => const ColorSettingsScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: EzSettingType.quick.path,
                  name: 'color_quick',
                  builder: (_, __) =>
                      const ColorSettingsScreen(target: EzSettingType.quick),
                ),
                GoRoute(
                  path: EzSettingType.advanced.path,
                  name: 'color_advanced',
                  builder: (_, __) =>
                      const ColorSettingsScreen(target: EzSettingType.advanced),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class SOS extends StatelessWidget {
  const SOS({super.key});

  @override
  Widget build(BuildContext context) {
    return EzAppProvider(
      app: PlatformApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: <LocalizationsDelegate<dynamic>>{
          const LocaleNamesLocalizationsDelegate(),
          ...EFUILang.localizationsDelegates,
          ...Lang.localizationsDelegates,
        },
        supportedLocales: Lang.supportedLocales,
        locale: EzConfig.getLocale(),
        title: appTitle,
        routerConfig: router,
      ),
    );
  }
}
