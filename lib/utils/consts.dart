/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'export.dart';

import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// App config //

/// InstaSOS
const String appName = 'InstaSOS';

/// net.empathetech.sos
const String androidPackage = 'net.empathetech.sos';

// Local assets //

/// assets/images/og-baddie.jpg
const String ladyLiberty = 'assets/images/og-baddie.jpg';

/// [ladyLiberty]
const Set<String> assetPaths = <String>{ladyLiberty};

const Map<String, String> credits = <String, String>{
  ladyLiberty: 'Public domain; CC0 1.0 Universal',
};

//* EzConfig *//

// BTS settings //

/// showContactsMsg
const String showContactsMsgKey = 'showContactsMsg';

/// savedTab
const String savedTabKey = 'savedTab';

/// taskRunning
const String taskRunningKey = 'taskRunning';

/// showTutorial
const String tutorialKey = 'showTutorial';

/// [showContactsMsgKey], [savedTabKey], [taskRunningKey], [tutorialKey]
const Map<String, Type> sosBTSKeys = <String, Type>{
  showContactsMsgKey: bool,
  savedTabKey: String,
  taskRunningKey: bool,
  tutorialKey: bool,
};

/// atHome
const String atHomeTab = 'atHome';

/// driving
const String drivingTab = 'driving';

/// walking
const String walkingTab = 'walking';

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

const Map<String, Type> sosBroadcastKeys = <String, Type>{
  autoShareMediaKey: bool,
  emcKey: List<String>,
  sosOnCloseKey: bool,
  sosOnInterruptKey: bool,
  sosOnOpenKey: bool,
  linkTypeKey: String,
};

// Color settings //

/// Video
const String darkVideoColorKey = 'darkVideoColor';
const String lightVideoColorKey = 'lightVideoColor';

/// [dark, light] x videoColorKey
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
  showContactsMsgKey: true,
  savedTabKey: walkingTab,
  taskRunningKey: false,
  tutorialKey: true,

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

final Set<String> neverResetKeys = <String>{
  ...sosBTSKeys.keys,
  ...sosBroadcastKeys.keys,
};
