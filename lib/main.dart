/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './screens/export.dart';
import './utils/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feedback/feedback.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() async {
  // Setup the app //

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
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

/// [GoRouter] for the [PlatformApp.router]
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
          routes: <RouteBase>[
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
                      builder: (_, __) => const TextSettingsScreen(
                          target: EzSettingType.advanced),
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
                      builder: (_, __) => const ColorSettingsScreen(
                          target: EzSettingType.quick),
                    ),
                    GoRoute(
                      path: EzSettingType.advanced.path,
                      name: 'color_advanced',
                      builder: (_, __) => const ColorSettingsScreen(
                          target: EzSettingType.advanced),
                    ),
                  ],
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
