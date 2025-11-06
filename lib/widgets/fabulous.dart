/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

const Widget updater = EzUpdaterFAB(
  appVersion: '1.5.1',
  versionSource:
      'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
  gPlay: 'https://play.google.com/store/apps/details?id=net.empathetech.sos',
  appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
  github: 'https://github.com/Empathetech-LLC/sos/releases',
);

class HelpFAB extends FloatingActionButton {
  /// [FloatingActionButton] that will go to the [SettingsHomeScreen]
  HelpFAB(BuildContext context, void Function()? onPressed, {super.key})
      : super(
          heroTag: 'help_fab',
          onPressed: onPressed,
          tooltip: ezL10n(context).ssNavHint,
          child: EzIcon(PlatformIcons(context).help),
        );
}
