/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'export.dart';

import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// BTS settings //

/// showContactsMsg
const String showContactsMsgKey = 'showContactsMsg';

/// savedTab
const String savedTabKey = 'savedTab';

/// taskRunning
const String taskRunningKey = 'taskRunning';

/// showTutorial
const String showTutorialKey = 'showTutorial';

/// [showContactsMsgKey], [savedTabKey], [taskRunningKey], [showTutorialKey]
const Map<String, Type> sosBTSKeys = <String, Type>{
  showContactsMsgKey: bool,
  savedTabKey: String,
  taskRunningKey: bool,
  showTutorialKey: bool,
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

/// Video

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
  showContactsMsgKey: true,
  savedTabKey: walkingTab,
  taskRunningKey: false,
  showTutorialKey: true,

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
