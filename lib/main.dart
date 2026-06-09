/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './screens/export.dart';
import './utils/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

void main() async {
  // Configure the app //

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  EzCM.init(
    appName: 'InstaSOS',
    androidPackage: androidPackage,
    assetPaths: assetPaths,
    orientations: <DeviceOrientation>[DeviceOrientation.portraitUp],
    localeFallback: americanEnglish,
    l10nFallback: await EFUILang.delegate.load(americanEnglish),
    preferences: await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: allSOSKeys.keys.toSet(),
      ),
    ),
    defaults: sosConfig,
    neverReset: neverResetKeys,
  );

  // Run the app //

  final (Locale storedLocale, EFUILang storedEFUILang) = await ezStoredL10n();

  runApp(SOS(
    storedLocale,
    storedEFUILang,
    await Lang.delegate.load(storedLocale),
  ));
}

class SOS extends StatelessWidget {
  final Locale storedLocale;
  final EFUILang storedEFUILang;
  final Lang storedLang;

  const SOS(
    this.storedLocale,
    this.storedEFUILang,
    this.storedLang, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => EzConfigurableApp(
        localizationsDelegates: ezLocalizationsDelegates(Lang.localizationsDelegates),
        supportedLocales: Lang.supportedLocales,
        locale: storedLocale,
        el10n: storedEFUILang,
        appCache: SOSCache(storedLocale, storedLang),
        routerConfig: GoRouter(
          navigatorKey: ezRootNav,
          initialLocation: homePath,
          errorBuilder: (_, __) => const ErrorScreen(),
          routes: <RouteBase>[
            // Home
            GoRoute(
              path: homePath,
              name: homePath,
              pageBuilder: (BuildContext context, GoRouterState state) => ezPageBuilder(
                Provider.of<EzCP>(context, listen: false),
                context,
                state,
                const HomeScreen(),
              ),
              routes: <RouteBase>[
                // Settings home
                GoRoute(
                  path: settingsHomePath,
                  name: settingsHomePath,
                  pageBuilder: (BuildContext context, GoRouterState state) => ezPageBuilder(
                    Provider.of<EzCP>(context, listen: false),
                    context,
                    state,
                    const SettingsHomeScreen(),
                  ),
                  routes: <RouteBase>[
                    // SOS settings
                    GoRoute(
                      path: sosSettingsPath,
                      name: sosSettingsPath,
                      pageBuilder: (BuildContext context, GoRouterState state) => ezPageBuilder(
                        Provider.of<EzCP>(context, listen: false),
                        context,
                        state,
                        const SOSSettingsScreen(),
                      ),
                    ),

                    // Appearance settings
                    GoRoute(
                      path: appearanceSettingsPath,
                      name: appearanceSettingsPath,
                      pageBuilder: (BuildContext context, GoRouterState state) => ezPageBuilder(
                        Provider.of<EzCP>(context, listen: false),
                        context,
                        state,
                        const AppearanceSettingsScreen(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
