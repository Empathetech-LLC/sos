/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

//* Cache *//

class SOSCache extends EzAppCache {
  // Construct //

  Locale _locale;
  Lang _l10n;

  late Color _videoColor;
  late Color _videoTextColor;

  SOSCache(Locale locale, Lang l10n)
      : _locale = locale,
        _l10n = l10n;

  // Get //

  Lang get l10n => _l10n;

  Color get videoColor => _videoColor;
  Color get videoTextColor => _videoTextColor;

  // Set //

  @override
  void init(bool isDark) => _setVideoColors(darkInit: isDark);

  @override
  Future<void> rebuild() async {
    _setVideoColors();

    if (_locale != EzConfig.locale) {
      _l10n = await Lang.delegate.load(EzConfig.locale);
      _locale = EzConfig.locale;
    }
  }

  void _setVideoColors({bool? darkInit}) {
    _videoColor = Color(
        EzConfig.get((darkInit ?? EzConfig.isDark) ? darkVideoColorKey : lightVideoColorKey)
            as int);
    _videoTextColor = getTextColor(_videoColor);
  }
}

//* Aliases *//

// Core //

bool get isIOS => EzConfig.platform == TargetPlatform.iOS;

// Local cache //

SOSCache get _cache => EzConfig.appCache! as SOSCache;

Lang get l10n => _cache.l10n;

Color get videoColor => _cache.videoColor;
Color get videoTextColor => _cache.videoTextColor;

// BTS //

bool get showTutorial => EzConfig.get(showTutorialKey);

// Broadcast //

bool get autoShareMedia => EzConfig.get(autoShareMediaKey);

List<String> get emc => EzConfig.get(emcKey);

LLType get linkType => LLTypeConfig.lookup(EzConfig.get(linkTypeKey));

bool get sosOnOpen => EzConfig.get(sosOnOpenKey);
bool get sosOnClose => EzConfig.get(sosOnCloseKey);
bool get sosOnInterrupt => EzConfig.get(sosOnInterruptKey);
