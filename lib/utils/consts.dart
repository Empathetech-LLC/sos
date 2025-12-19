/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
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
const String partialContactsKey = 'showContactsMsg';

/// savedTab
const String savedTabKey = 'savedTab';

/// taskRunning
const String taskRunningKey = 'taskRunning';

/// showTutorial
const String tutorialKey = 'showTutorial';

/// [partialContactsKey], [savedTabKey], [taskRunningKey], [tutorialKey]
const Map<String, Type> allBTSKeys = <String, Type>{
  partialContactsKey: bool,
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
const String autoShareKey = 'autoShareMedia';

/// emc
const String emcKey = 'emc';

/// notifyOnClose
const String onCloseKey = 'sosOnClose';

/// sosOnInterrupt
const String onInterruptKey = 'sosOnInterrupt';

/// notifyOnOpen
const String onOpenKey = 'sosOnOpen';

/// linkType
const String linkTypeKey = 'linkType';

const Map<String, Type> allBroadcastKeys = <String, Type>{
  autoShareKey: bool,
  emcKey: List<String>,
  onCloseKey: bool,
  onInterruptKey: bool,
  onOpenKey: bool,
  linkTypeKey: String,
};

// Color settings //

/// Video
const String videoColorKey = 'Video';

/// [videoColorKey]
const Map<String, Type> allSOSColorKeys = <String, Type>{
  videoColorKey: int,
};

// EzConfig default //

/// defaults for [EzConfig.init]
final Map<String, Object> sosConfig = <String, Object>{
  // EFUI
  ...empathMobileConfig,
  darkTextBackgroundOpacityKey: 0.8,
  lightTextBackgroundOpacityKey: 0.8,

  // BTS
  partialContactsKey: true,
  savedTabKey: walkingTab,
  taskRunningKey: false,
  tutorialKey: true,

  // SOS
  autoShareKey: true,
  emcKey: <String>[],
  onCloseKey: false,
  onInterruptKey: true,
  onOpenKey: false,
  linkTypeKey: LinkType.google.name,

  // Color
  videoColorKey: 0xFFFF0000,
};

/// [ezConfigSaver] extraKeys
const List<String> extraKeys = <String>[
  // BTS
  partialContactsKey,
  savedTabKey,
  // taskRunningKey,
  tutorialKey,

  // Broadcast
  autoShareKey,
  // emcKey,
  onCloseKey,
  onInterruptKey,
  onOpenKey,
  linkTypeKey,

  // Color
  videoColorKey,
];

/// For [EzConfig.init]
const Map<String, Type> allSOSKeys = <String, Type>{
  ...allEZConfigKeys,
  ...allBTSKeys,
  ...allBroadcastKeys,
  ...allSOSColorKeys,
};
