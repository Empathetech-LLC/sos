/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// TODO: l10n

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
        builder: (BuildContext modalContext) => EzScrollView(
          children: <Widget>[
            //* Expandable FAQ(s) *//

            Text(
              'FAQ',
              style: textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            ezMargin,

            // Shared I //

            ExpansionTile(
              title: Text(
                'Where does the list come from?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              children: <Widget>[
                Text(
                  'Answer',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),

            // Android specific //
            if (Platform.isAndroid) ...<Widget>[
              // Clarity on platform settings
              ExpansionTile(
                title: Text(
                  'What do the settings do?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  "Texts with 'Location unavailable'?",
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),

              // Clarity on feature disparity
              ExpansionTile(
                title: Text(
                  'My friend has less options?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ],

            // iOS Specific //
            if (Platform.isIOS) ...<Widget>[
              // Clarity on platform settings
              ExpansionTile(
                title: Text(
                  'What do the settings do?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  'Contact has no number/is private?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),

              // Clarity on feature disparity
              ExpansionTile(
                title: Text(
                  'My friend has more options?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'Answer',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ],

            // Shared II //

            ExpansionTile(
              title: Text(
                'Why is X language not included?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              children: <Widget>[
                Text(
                  'Answer',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),

            // Reset tutorial (conditional)
            if (EzConfig.get(tutorialKey) != true) ...<Widget>[
              ezSpacer,
              EzElevatedButton(
                text: 'Reset tutorial',
                onPressed: () async {
                  await EzConfig.setBool(tutorialKey, true);
                  if (modalContext.mounted) {
                    Navigator.of(modalContext).pop();
                  }
                  if (context.mounted) {
                    ezSnackBar(
                      context: context,
                      message: 'The tutorial will replay on next launch',
                      undo: () => EzConfig.setBool(tutorialKey, false),
                    );
                  }
                },
              ),
              EzSpacer(space: EzConfig.get(spacingKey) * 1.5),
            ],
          ],
        ),
      ),
      tooltip: ezL10n(context).gHelp,
      child: EzIcon(PlatformIcons(context).help),
    );
  }
}
