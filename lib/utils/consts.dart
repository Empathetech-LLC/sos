/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// 'SnapOS'
const String appTitle = 'SnapOS';

const String broadcastTask = 'sos_broadcast';

/// 'showTutorial'
const String tutorialKey = 'showTutorial';

/// 'Video'
const String videoColorKey = 'Video';

/// 'emc'
const String emcKey = 'emc';

/// 'customSOS'
const String customSOSKey = 'customSOS';

/// 'notifyOnOpen'
const String onOpenKey = 'sosOnOpen';

/// 'notifyOnClose'
const String onCloseKey = 'sosOnClose';

/// 'sosOnInterrupt'
const String onInterruptKey = 'sosOnInterrupt';

const Map<String, dynamic> sosConfig = <String, dynamic>{
  ...empathetechConfig,
  tutorialKey: true,
  videoColorKey: 0xFFFF0000,
  emcKey: <String>[],
  customSOSKey: 'SOS',
  onOpenKey: false,
  onCloseKey: false,
  onInterruptKey: true,
};
