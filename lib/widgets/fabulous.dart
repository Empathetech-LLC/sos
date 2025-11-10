/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:io';
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

class HelpFAB extends StatelessWidget {
  /// Opens an [ezModal] with an FAQ and a button for resetting to tutorial(s)
  const HelpFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return FloatingActionButton(
      heroTag: 'help_fab',
      onPressed: () => ezModal(
        context: context,
        constraints: const BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        builder: (_) {
          bool showTutorials = EzConfig.get(tutorialKey);

          return StatefulBuilder(
            builder: (BuildContext modalContext, StateSetter modalState) {
              return EzScrollView(
                children: <Widget>[
                  // Reset tutorial (conditional)
                  if (!showTutorials) ...<Widget>[
                    EzElevatedButton(
                      text: 'Reset tutorial',
                      onPressed: () async {
                        await EzConfig.setBool(tutorialKey, true);
                        modalState(() => showTutorials = true);

                        if (context.mounted) {
                          ezSnackBar(
                            context: context,
                            message: 'Do they have to close and reopen?',
                          );
                        }
                      },
                    ),
                    ezSpacer,
                  ],

                  // Expandable FAQ
                  ExpansionTile(
                    title: Text(
                      'FAQ',
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    children: <Widget>[
                      // Shared
                      ListTile(
                        title: Text(
                          'Shared item(s)',
                          style: textTheme.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                        onTap: doNothing,
                      ),

                      // Android specific
                      if (Platform.isAndroid) ...<Widget>[
                        ListTile(
                          title: Text(
                            'Android item(s)',
                            style: textTheme.bodyLarge,
                            textAlign: TextAlign.start,
                          ),
                          onTap: doNothing,
                        ),
                      ],

                      // iOS specific
                      if (Platform.isIOS) ...<Widget>[
                        ListTile(
                          title: Text(
                            'iOS item(s)',
                            style: textTheme.bodyLarge,
                            textAlign: TextAlign.start,
                          ),
                          onTap: doNothing,
                        ),
                      ],
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
      tooltip: ezL10n(context).gHelp,
      child: EzIcon(PlatformIcons(context).help),
    );
  }
}
