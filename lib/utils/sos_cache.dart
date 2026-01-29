/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SOSCache extends EzAppCache {
  // Construct //

  Locale _locale;
  Lang _l10n;

  SOSCache(Locale locale, Lang l10n)
      : _locale = locale,
        _l10n = l10n;

  // Get //

  Lang get l10n => _l10n;

  // Set //

  @override
  Future<void> redraw() async {
    if (_locale != EzConfig.locale) {
      _l10n = await Lang.delegate.load(EzConfig.locale);
      _locale = EzConfig.locale;
    }
  }
}

Lang get l10n => (EzConfig.appCache! as SOSCache).l10n;

List<String>? emc = EzConfig.get(emcKey);
bool get sosOnOpen => EzConfig.get(sosOnOpenKey);
bool get sosOnClose => EzConfig.get(sosOnCloseKey);
bool get sosOnInterrupt => EzConfig.get(sosOnInterruptKey);

bool get autoShare => EzConfig.get(autoShareMediaKey);
LinkType get linkType => LinkConfig.lookup(EzConfig.get(linkTypeKey));
