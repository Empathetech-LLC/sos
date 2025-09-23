/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'export.dart';

import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// 'InstaSOS'
const String appName = 'InstaSOS';

/// net.empathetech.sos
const String packageName = 'net.empathetech.sos';

/// 'taskRunning'
const String taskRunningKey = 'taskRunning';

/// 'showTutorial'
const String tutorialKey = 'showTutorial';

/// 'Video'
const String videoColorKey = 'Video';

/// 'emc'
const String emcKey = 'emc';

/// 'linkType'
const String linkTypeKey = 'linkType';

/// 'savedTab'
const String savedTabKey = 'savedTab';

/// 'walking'
const String walkingTab = 'walking';

/// 'driving'
const String drivingTab = 'driving';

/// 'atHome'
const String atHomeTab = 'atHome';

/// 'notifyOnOpen'
const String onOpenKey = 'sosOnOpen';

/// 'notifyOnClose'
const String onCloseKey = 'sosOnClose';

/// 'sosOnInterrupt'
const String onInterruptKey = 'sosOnInterrupt';

/// 'autoShareImages'
const String autoShareKey = 'autoShareImages';

final Map<String, Object> sosConfig = <String, Object>{
  ...empathMobileConfig,
  darkTextBackgroundOpacityKey: 0.8,
  lightTextBackgroundOpacityKey: 0.8,
  videoColorKey: 0xFFFF0000,
  emcKey: <String>[],
  linkTypeKey: LinkType.google.name,
  savedTabKey: walkingTab,
  tutorialKey: true,
  onOpenKey: false,
  onCloseKey: false,
  onInterruptKey: true,
  autoShareKey: true,
  taskRunningKey: false,
};
