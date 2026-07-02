/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

//* Enums *//
// Location Link Type //

enum LLType { google, apple, waze, raw }

/// enum [String] 'google'
const String esGoogle = 'google';

/// enum [String] 'apple'
const String esApple = 'apple';

/// enum [String] 'waze'
const String esWaze = 'waze';

/// enum [String] 'raw'
const String esRaw = 'raw';

extension LLTypeConfig on LLType {
  String get name => switch (this) {
        LLType.google => esGoogle,
        LLType.apple => esApple,
        LLType.waze => esWaze,
        LLType.raw => esRaw,
      };

  String get label => switch (this) {
        LLType.google => 'Google Maps',
        LLType.apple => 'Apple Maps',
        LLType.waze => 'Waze',
        LLType.raw => 'Coordinates',
      };

  String get base => switch (this) {
        LLType.google => 'https://www.google.com/maps?q=',
        LLType.apple => 'https://maps.apple.com/?ll=',
        LLType.waze => 'https://waze.com/ul?ll=',
        LLType.raw => '',
      };

  static LLType lookup(String name) => switch (name) {
        esApple => LLType.apple,
        esWaze => LLType.waze,
        esRaw => LLType.raw,
        esGoogle || _ => LLType.google,
      };
}

// Situation //

enum Situation { walking, driving, home }

/// enum [String] 'walking'
const String esWalking = 'walking';

/// enum [String] 'driving'
const String esDriving = 'driving';

/// enum [String] 'home'
const String esHome = 'home';

extension SituationConfig on Situation {
  IconData get icon => switch (this) {
        Situation.walking => Icons.directions_walk,
        Situation.driving => Icons.drive_eta,
        Situation.home => Icons.home,
      };

  String get value => switch (this) {
        Situation.walking => esWalking,
        Situation.driving => esDriving,
        Situation.home => esHome,
      };

  int get position => switch (this) {
        Situation.walking => 0,
        Situation.driving => 1,
        Situation.home => 2,
      };

  String tooltip(Lang l10n) => switch (this) {
        Situation.walking => l10n.rvOnFoot,
        Situation.driving => l10n.rvWhileDriving,
        Situation.home => l10n.rvAtHome,
      };

  static Situation lookup(String? tab) => switch (tab) {
        esDriving => Situation.driving,
        esHome => Situation.home,
        esWalking || _ => Situation.walking,
      };
}

//* App config *//
// Naming/ID //

/// net.empathetech.sos
const String androidPackage = 'net.empathetech.sos';

/// [androidPackage]/broadcast
const MethodChannel platform = MethodChannel('$androidPackage/broadcast');

// Local assets //

/// assets/og-baddie.jpg
/// Public domain image; CC0 1.0 Universal
const String ladyLiberty = 'assets/og-baddie.jpg';

/// [ladyLiberty]
const Set<String> assetPaths = <String>{ladyLiberty};

//* EzConfig *//
// BTS settings //

/// savedTab
const String savedTabKey = 'savedTab';

/// setupComplete
const String setupCompleteKey = 'setupComplete';

/// showContactsMsg
const String showContactsMsgKey = 'showContactsMsg';

/// showTutorial
const String showTutorialKey = 'showTutorial';

/// taskRunning
const String taskRunningKey = 'taskRunning';

/// [savedTabKey], [setupCompleteKey], [showContactsMsgKey], [showTutorialKey], [taskRunningKey]
const Map<String, Type> sosBTSKeys = <String, Type>{
  savedTabKey: String,
  setupCompleteKey: bool,
  showContactsMsgKey: bool,
  showTutorialKey: bool,
  taskRunningKey: bool,
};

// Broadcast settings //

/// autoShareMedia
const String autoShareMediaKey = 'autoShareMedia';

/// emc
const String emcKey = 'emc';

/// notifyOnClose
const String sosOnCloseKey = 'sosOnClose';

/// sosOnInterrupt
const String sosOnInterruptKey = 'sosOnInterrupt';

/// notifyOnOpen
const String sosOnOpenKey = 'sosOnOpen';

/// linkType
const String linkTypeKey = 'linkType';

/// [autoShareMediaKey], [emcKey], [sosOnCloseKey], [sosOnInterruptKey], [sosOnOpenKey], [linkTypeKey]
const Map<String, Type> sosBroadcastKeys = <String, Type>{
  autoShareMediaKey: bool,
  emcKey: List<String>,
  sosOnCloseKey: bool,
  sosOnInterruptKey: bool,
  sosOnOpenKey: bool,
  linkTypeKey: String,
};

// Color settings //

/// darkVideoColor
const String darkVideoColorKey = 'darkVideoColor';

/// lightVideoColor
const String lightVideoColorKey = 'lightVideoColor';

/// [darkVideoColorKey], [lightVideoColorKey]
const Map<String, Type> sosColorKeys = <String, Type>{
  darkVideoColorKey: int,
  lightVideoColorKey: int,
};

// EzConfig default //

/// defaults for [EzCM.init]
final Map<String, Object> sosConfig = <String, Object>{
  // EFUI
  ...empathMobileConfig,
  darkShowBackFABKey: true,
  lightShowBackFABKey: true,
  darkTextBackgroundOpacityKey: 0.8,
  lightTextBackgroundOpacityKey: 0.8,

  // BTS
  savedTabKey: esWalking,
  setupCompleteKey: false,
  showContactsMsgKey: true,
  showTutorialKey: true,
  taskRunningKey: false,

  // SOS
  autoShareMediaKey: true,
  emcKey: <String>[],
  sosOnCloseKey: false,
  sosOnInterruptKey: true,
  sosOnOpenKey: false,
  linkTypeKey: LLType.google.name,

  // Color
  darkVideoColorKey: 0xFFFF0000,
  lightVideoColorKey: 0xFFFF0000,
};

/// For [EzCM.init]
const Map<String, Type> allSOSKeys = <String, Type>{
  ...allEZConfigKeys,
  ...sosBTSKeys,
  ...sosBroadcastKeys,
  ...sosColorKeys,
};

/// For [EzResetButton]s
final Set<String> neverResetKeys = <String>{
  ...sosBTSKeys.keys,
  ...sosBroadcastKeys.keys,
};

//* Runtime *//

// Misc //

/// :
const String contactSplit = ':';

// Orgs links //

/// https://www.aclu.org/know-your-rights
const String acluLink = 'https://www.aclu.org/know-your-rights';

/// https://www.empathetech.net/#/contribute
const String contributeLink = 'https://www.empathetech.net/#/contribute';

/// https://dunkthevote4ever.org/project/the-black-book-know-your-rights/
const String dunkLink = 'https://dunkthevote4ever.org/project/the-black-book-know-your-rights/';

/// https://lab.witness.org/projects/eyes-on-ice/
const String howToLink = 'https://lab.witness.org/projects/eyes-on-ice/';

/// https://locator.ice.gov/odls/#/search
const String iceLocatorLink = 'https://locator.ice.gov/odls/#/search';

/// https://icerr.com/
const String icerrLink = 'https://icerr.com/';

/// https://www.immdef.org/resources
const String immdefLink = 'https://www.immdef.org/resources';

/// https://nnirr.org/education-resources/community-resources-legal-assistance-recursos-comunitarios-asistencia-legal/immigration-hotlines-lineas-directas-de-inmigracion/
const String nirrHotlinesLink =
    'https://nnirr.org/education-resources/community-resources-legal-assistance-recursos-comunitarios-asistencia-legal/immigration-hotlines-lineas-directas-de-inmigracion/';
