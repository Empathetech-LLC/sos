/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './screens/export.dart';
import './utils/export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() async {
  // Configure the app //

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

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
  Widget build(BuildContext context) {
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
      locale: storedLocale,
      el10n: storedEFUILang,
      appCache: SOSCache(
        storedLocale,
        storedLang,
        EzConfig.get(isDarkThemeKey) ?? isDarkTheme(context),
      ),
      appName: appName,
      routerConfig: GoRouter(
        navigatorKey: ezRootNav,
        initialLocation: homePath,
        errorBuilder: (_, GoRouterState state) => ErrorScreen(state.error),
        routes: <RouteBase>[
          // Home
          GoRoute(
            path: homePath,
            name: homePath,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                ezPageBuilder(context, state, HomeScreen()),
            routes: <RouteBase>[
              // Settings home
              GoRoute(
                path: settingsHomePath,
                name: settingsHomePath,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    ezPageBuilder(context, state, SettingsHomeScreen()),
                routes: <RouteBase>[
                  // SOS settings
                  GoRoute(
                    path: sosSettingsPath,
                    name: sosSettingsPath,
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        ezPageBuilder(context, state, SOSSettingsScreen()),
                  ),

                  // Appearance settings
                  GoRoute(
                    path: appearanceSettingsPath,
                    name: appearanceSettingsPath,
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        ezPageBuilder(
                            context, state, AppearanceSettingsScreen()),
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
