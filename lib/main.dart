/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './screens/export.dart';
import './utils/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() async {
  // Setup the app //

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  EzConfig.init(
    assetPaths: assetPaths,
    defaults: sosConfig,
    localeFallback: americanEnglish,
    l10nFallback: await EFUILang.delegate.load(americanEnglish),
    preferences: await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: allSOSKeys.keys.toSet(),
      ),
    ),
  );

  // Run the app //
  // With a feedback wrapper

  runApp(const SOS());
}

class SOS extends StatelessWidget {
  const SOS({super.key});

  @override
  Widget build(BuildContext context) {
    // Prep the router //

    GoTransition.defaultCurve = Curves.easeInOut;

    final TargetPlatform currPlatform = getBasePlatform();
    Page<dynamic> getTransition(BuildContext context, GoRouterState state) =>
        ezGoTransition(context, state, EzConfig.animDuration, currPlatform);

    // Return the app //

    return EzConfigurableApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>{
        const LocaleNamesLocalizationsDelegate(),
        ...EFUILang.localizationsDelegates,
        ...Lang.localizationsDelegates,
        CreoleMaterialLocalizations.delegate,
        CreoleCupertinoLocalizations.delegate,
        const CreoleWidgetsLocalizationsDelegate(),
      },
      supportedLocales: Lang.supportedLocales,
      appName: appName,
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
                    path: appearanceSettingsPath,
                    name: appearanceSettingsPath,
                    builder: (_, __) => const AppearanceSettingsScreen(),
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
                              target: EzCSType.quick,
                            ),
                            pageBuilder: getTransition,
                          ),
                          GoRoute(
                            path: EzCSType.advanced.path,
                            name: EzCSType.advanced.name,
                            builder: (_, __) => const ColorSettingsScreen(
                              target: EzCSType.advanced,
                            ),
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
                              target: EzTSType.quick,
                            ),
                            pageBuilder: getTransition,
                          ),
                          GoRoute(
                            path: EzTSType.advanced.path,
                            name: EzTSType.advanced.name,
                            builder: (_, __) => const TextSettingsScreen(
                              target: EzTSType.advanced,
                            ),
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
    );
  }
}
