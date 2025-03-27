/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

/// 'SnapOS'
const String appTitle = 'SnapOS';

/// 'notifyOnOpen'
const String onOpenKey = 'notifyOnOpen';

/// 'notifyOnClose'
const String onCloseKey = 'notifyOnClose';

/// 'sosOnInterrupt'
const String onInterruptKey = 'sosOnInterrupt';

const Map<String, dynamic> sosConfig = <String, dynamic>{
  ...empathetechConfig,
  onOpenKey: false,
  onCloseKey: false,
  onInterruptKey: true,
};
