/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SOSCache extends EzAppCache {
  Locale _locale;
  Lang _l10n;

  late Color _videoColor;
  late Color _videoTextColor;

  SOSCache(Locale locale, Lang l10n)
      : _locale = locale,
        _l10n = l10n;

  @override
  void init(bool isDark) => _setVideoColors(isDark);

  @override
  Future<void> rebuild(EzCP config) async {
    _setVideoColors(config.isDark);

    if (_locale != config.locale) {
      _locale = config.locale;
      _l10n = await Lang.delegate.load(config.locale);
    }
  }

  void _setVideoColors(bool isDark) {
    _videoColor = Color(EzCM.get(isDark ? darkVideoColorKey : lightVideoColorKey) as int);
    _videoTextColor = getTextColor(_videoColor);
  }
}

bool get isIOS => EzCM.platform == TargetPlatform.iOS;

SOSCache _cache(EzCP config) => config.appCache! as SOSCache;

Lang l10n(EzCP config) => _cache(config)._l10n;

Color videoColor(EzCP config) => _cache(config)._videoColor;
Color videoTextColor(EzCP config) => _cache(config)._videoTextColor;

bool get showTutorial => EzCM.get(showTutorialKey);

bool get autoShareMedia => EzCM.get(autoShareMediaKey);

List<String> get emc => EzCM.get(emcKey);

LLType get linkType => LLTypeConfig.safeLookup(EzCM.get(linkTypeKey));

bool get sosOnOpen => EzCM.get(sosOnOpenKey);
bool get sosOnClose => EzCM.get(sosOnCloseKey);
bool get sosOnInterrupt => EzCM.get(sosOnInterruptKey);
