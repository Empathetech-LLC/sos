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
const String packageName = 'net.empathetech.sos';

// BTS settings //

/// showTutorial
const String tutorialKey = 'showTutorial';

/// showContactsMsg
const String partialContactsKey = 'showContactsMsg';

/// savedTab
const String savedTabKey = 'savedTab';

/// walking
const String walkingTab = 'walking';

/// driving
const String drivingTab = 'driving';

/// atHome
const String atHomeTab = 'atHome';

/// taskRunning
const String taskRunningKey = 'taskRunning';

// SOS settings //

/// notifyOnOpen
const String onOpenKey = 'sosOnOpen';

/// notifyOnClose
const String onCloseKey = 'sosOnClose';

/// sosOnInterrupt
const String onInterruptKey = 'sosOnInterrupt';

/// autoShareMedia
const String autoShareKey = 'autoShareMedia';

/// emc
const String emcKey = 'emc';

/// linkType
const String linkTypeKey = 'linkType';

// Color settings //

/// Video
const String videoColorKey = 'Video';

// EzConfig default //

/// defaults for [EzConfig.init]
final Map<String, Object> sosConfig = <String, Object>{
  // EFUI
  ...empathMobileConfig,
  darkTextBackgroundOpacityKey: 0.8,
  lightTextBackgroundOpacityKey: 0.8,

  // BTS
  tutorialKey: true,
  partialContactsKey: true,
  savedTabKey: walkingTab,
  taskRunningKey: false,

  // SOS
  onOpenKey: false,
  onCloseKey: false,
  onInterruptKey: true,
  autoShareKey: true,
  emcKey: <String>[],
  linkTypeKey: LinkType.google.name,

  // Color
  videoColorKey: 0xFFFF0000,
};

// Local assets //

/// assets/images/og-baddie.jpg
const String ladyLiberty = 'assets/images/og-baddie.jpg';

/// [ladyLiberty]
const Set<String> assetPaths = <String>{ladyLiberty};

const Map<String, String> credits = <String, String>{
  ladyLiberty: 'Public domain; CC0 1.0 Universal',
};
