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
import 'package:go_transitions/go_transitions.dart';
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
    preferences: prefs,
    defaults: sosConfig,
    fallbackLang: await EFUILang.delegate.load(americanEnglish),
    assetPaths: <String>{},
  );

  // Run the app //
  // With a feedback wrapper

  runApp(BetterFeedback(
    theme: empathFeedbackLight,
    darkTheme: empathFeedbackDark,
    themeMode: EzConfig.getThemeMode(),
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      EzFeedbackLD(),
      CreoleMaterialLocalizations.delegate,
      CreoleCupertinoLocalizations.delegate,
      const CreoleWidgetsLocalizationsDelegate(),
    ],
    localeOverride: EzConfig.getLocale(),
    child: const SOS(),
  ));
}

class SOS extends StatelessWidget {
  const SOS({super.key});

  @override
  Widget build(BuildContext context) {
    // Prep the router //

    final int animDuration = EzConfig.get(animationDurationKey);
    final TargetPlatform currPlatform = getBasePlatform();

    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = Duration(milliseconds: animDuration);

    Page<dynamic> getTransition(BuildContext context, GoRouterState state) =>
        ezGoTransition(context, state, animDuration, currPlatform);

    // Return the app //

    return EzAppProvider(
      app: PlatformApp.router(
        debugShowCheckedModeBanner: false,

        // Language handlers
        localizationsDelegates: <LocalizationsDelegate<dynamic>>{
          const LocaleNamesLocalizationsDelegate(),
          ...EFUILang.localizationsDelegates,
          ...Lang.localizationsDelegates,
          CreoleMaterialLocalizations.delegate,
          CreoleCupertinoLocalizations.delegate,
          const CreoleWidgetsLocalizationsDelegate(),
        },

        // Supported languages
        supportedLocales: Lang.supportedLocales,

        // Current language
        locale: EzConfig.getLocale(),

        // App title
        title: appName,

        // Router (page) config
        routerConfig: GoRouter(
          initialLocation: homePath,
          errorBuilder: (_, GoRouterState state) => ErrorScreen(state.error),
          routes: <RouteBase>[
            GoRoute(
              path: homePath,
              name: homePath,
              builder: (_, __) => const HomeScreen(),
              pageBuilder: getTransition,
              routes: <RouteBase>[
                GoRoute(
                  path: settingsHomePath,
                  name: settingsHomePath,
                  builder: (_, __) => const SettingsHomeScreen(),
                  pageBuilder: getTransition,
                  routes: <RouteBase>[
                    GoRoute(
                      path: ezSettingsHomePath,
                      name: ezSettingsHomePath,
                      builder: (_, __) => const EzSettingsHomeScreen(),
                      pageBuilder: getTransition,
                      routes: <RouteBase>[
                        GoRoute(
                          path: colorSettingsPath,
                          name: colorSettingsPath,
                          builder: (_, __) => const ColorSettingsScreen(),
                          pageBuilder: getTransition,
                          routes: <RouteBase>[
                            GoRoute(
                              path: EzCSType.quick.path,
                              name: EzCSType.quick.name,
                              builder: (_, __) => const ColorSettingsScreen(
                                  target: EzCSType.quick),
                              pageBuilder: getTransition,
                            ),
                            GoRoute(
                              path: EzCSType.advanced.path,
                              name: EzCSType.advanced.name,
                              builder: (_, __) => const ColorSettingsScreen(
                                  target: EzCSType.advanced),
                              pageBuilder: getTransition,
                            ),
                          ],
                        ),
                        GoRoute(
                          path: designSettingsPath,
                          name: designSettingsPath,
                          builder: (_, __) => const DesignSettingsScreen(),
                          pageBuilder: getTransition,
                        ),
                        GoRoute(
                          path: layoutSettingsPath,
                          name: layoutSettingsPath,
                          builder: (_, __) => const LayoutSettingsScreen(),
                          pageBuilder: getTransition,
                        ),
                        GoRoute(
                          path: textSettingsPath,
                          name: textSettingsPath,
                          builder: (_, __) => const TextSettingsScreen(),
                          pageBuilder: getTransition,
                          routes: <RouteBase>[
                            GoRoute(
                              path: EzTSType.quick.path,
                              name: EzTSType.quick.name,
                              builder: (_, __) => const TextSettingsScreen(
                                  target: EzTSType.quick),
                              pageBuilder: getTransition,
                            ),
                            GoRoute(
                              path: EzTSType.advanced.path,
                              name: EzTSType.advanced.name,
                              builder: (_, __) => const TextSettingsScreen(
                                  target: EzTSType.advanced),
                              pageBuilder: getTransition,
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
        ),
      ),
    );
  }
}
