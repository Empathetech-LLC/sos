/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

//* Enums *//
// Location (services) //

enum LinkType { google, apple, waze, raw }

const String _google = 'google';
const String _apple = 'apple';
const String _waze = 'waze';
const String _raw = 'raw';

extension LinkConfig on LinkType {
  String get name {
    switch (this) {
      case LinkType.google:
        return _google;
      case LinkType.apple:
        return _apple;
      case LinkType.waze:
        return _waze;
      case LinkType.raw:
        return _raw;
    }
  }

  String get label {
    switch (this) {
      case LinkType.google:
        return 'Google Maps';
      case LinkType.apple:
        return 'Apple Maps';
      case LinkType.waze:
        return 'Waze';
      case LinkType.raw:
        return 'Coordinates';
    }
  }

  String get base {
    switch (this) {
      case LinkType.google:
        return 'https://www.google.com/maps?q=';
      case LinkType.apple:
        return 'https://maps.apple.com/?ll=';
      case LinkType.waze:
        return 'https://waze.com/ul?ll=';
      case LinkType.raw:
        return '';
    }
  }

  static LinkType lookup(String name) {
    switch (name) {
      case _apple:
        return LinkType.apple;
      case _waze:
        return LinkType.waze;
      case _raw:
        return LinkType.raw;
      default:
        return LinkType.google;
    }
  }
}

// Location (user rights) //

enum Location { walking, driving, home }

/// atHome
const String atHomeTab = 'atHome';

/// driving
const String drivingTab = 'driving';

/// walking
const String walkingTab = 'walking';

extension LocationConfig on Location {
  IconData get icon {
    switch (this) {
      case Location.walking:
        return Icons.directions_walk;
      case Location.driving:
        return Icons.drive_eta;
      case Location.home:
        return Icons.home;
    }
  }

  String get name {
    switch (this) {
      case Location.walking:
        return walkingTab;
      case Location.driving:
        return drivingTab;
      case Location.home:
        return atHomeTab;
    }
  }

  static Location lookup(String? tab) {
    switch (tab) {
      case drivingTab:
        return Location.driving;
      case atHomeTab:
        return Location.home;
      default:
        return Location.walking;
    }
  }
}

//* App config *//
// Naming/ID //

/// InstaSOS
const String appName = 'InstaSOS';

/// net.empathetech.sos
const String androidPackage = 'net.empathetech.sos';

/// [androidPackage]/broadcast
const MethodChannel platform = MethodChannel('$androidPackage/broadcast');

// Local assets //

/// assets/images/og-baddie.jpg
const String ladyLiberty = 'assets/images/og-baddie.jpg';

/// [ladyLiberty]
const Set<String> assetPaths = <String>{ladyLiberty};

/// [ladyLiberty]
const Map<String, String> credits = <String, String>{
  ladyLiberty: 'Public domain; CC0 1.0 Universal',
};

//* EzConfig *//
// BTS settings //

/// savedTab
const String savedTabKey = 'savedTab';

/// setupComplete
const String setupCompleteKey = 'setupComplete';

/// showBackFAB
const String showBackFABKey = 'showBackFAB';

/// showContactsMsg
const String showContactsMsgKey = 'showContactsMsg';

/// showTutorial
const String showTutorialKey = 'showTutorial';

/// taskRunning
const String taskRunningKey = 'taskRunning';

/// [savedTabKey], [setupCompleteKey], [showBackFABKey], [showContactsMsgKey], [showTutorialKey], [taskRunningKey]
const Map<String, Type> sosBTSKeys = <String, Type>{
  savedTabKey: String,
  setupCompleteKey: bool,
  showBackFABKey: bool,
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

/// defaults for [EzConfig.init]
final Map<String, Object> sosConfig = <String, Object>{
  // EFUI
  ...empathMobileConfig,
  darkTextBackgroundOpacityKey: 0.8,
  lightTextBackgroundOpacityKey: 0.8,

  // BTS
  savedTabKey: walkingTab,
  setupCompleteKey: false,
  showBackFABKey: true,
  showContactsMsgKey: true,
  showTutorialKey: true,
  taskRunningKey: false,

  // SOS
  autoShareMediaKey: true,
  emcKey: <String>[],
  sosOnCloseKey: false,
  sosOnInterruptKey: true,
  sosOnOpenKey: false,
  linkTypeKey: LinkType.google.name,

  // Color
  darkVideoColorKey: 0xFFFF0000,
  lightVideoColorKey: 0xFFFF0000,
};

/// For [EzConfig.init]
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

/// https://www.immdef.org/resources
const String immdefLink = 'https://www.immdef.org/resources';

/// https://dunkthevote4ever.org/project/the-black-book-know-your-rights/
const String dunkLink =
    'https://dunkthevote4ever.org/project/the-black-book-know-your-rights/';

/// https://lab.witness.org/projects/eyes-on-ice/
const String howToLink = 'https://lab.witness.org/projects/eyes-on-ice/';

/// https://www.empathetech.net/#/contribute
const String contributeLink = 'https://www.empathetech.net/#/contribute';
