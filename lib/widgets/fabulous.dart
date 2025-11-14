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
// TODO: make sure SOS on close doesn't activate for links

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
            //* Expandable FAQ *//

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
                  'The list of rights was compiled from several public sources, including:',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'ACLU Know Your Rights',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'IMMDEF Resources',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Dunk the Vote: The Black Book',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Another useful resource:',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                Text(
                  'How to document ICE',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
              ], // TODO: Update for link(s)
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
                    'SOS on open: when enabled, an SOS broadcast will being immediately on app launch. Not recommended for most users, as it could lead to accidental broadcasts.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'SOS on close: when enabled, a safe close (thumbs up) button will appear on the home page, opposite the settings. If InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ), // TODO: use the pre-existing l10n, with the new ending
                  ezStartLine,
                  Text(
                    "SOS on interrupted recording: when enabled, if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or 'SOS on close' (or both).",
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'Auto-share media: when enabled, the native share options will appear as soon as a video completes or a photo is taken.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'Emergency contacts: the people that will be sent your location while an SOS broadcast is active.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    "Link type: how your location will be delivered to your emergency contacts. 'Google Maps', 'Apple Maps', and 'Waze' will send a clickable link for the corresponding service. 'Coordinates' will send your latitude and longitude as plain text.",
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
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
                    'Answer', // TODO
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
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
                    'SOS on open: when enabled, an SOS broadcast will being immediately on app launch. Not recommended for most users, as it could lead to accidental broadcasts.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'Auto-share media: when enabled, the native share options will appear as soon as a video completes or a photo is taken.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'Emergency contacts: the people that will be sent your location while an SOS broadcast is active.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    "Link type: how your location will be delivered to your emergency contacts. 'Google Maps', 'Apple Maps', and 'Waze' will send a clickable link for the corresponding service. 'Coordinates' will send your latitude and longitude as plain text.",
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  'The contact is private or does not have a phone number?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'If you are (unexpectedly) seeing this message when adding an emergency contact, it is likely InstaSOS does not have permission to access that contact.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ), // TODO: Update for link(s)
                ],
              ),

              // Clarity on feature disparity
              ExpansionTile(
                title: Text(
                  'Why are some Android features missing?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                children: <Widget>[
                  Text(
                    'The missing features require SMS automation, and Apple does not allow developers to automate text messages (without a paid service).',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'What about iOS shortcuts?\nThere are also restrictions on accessing user shortcuts, which would break crucial features. Chiefly: it would interrupt video recordings.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],

            // Shared II //

            ExpansionTile(
              title: Text(
                'Why is X language not available?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              children: <Widget>[
                Text(
                  'It would be irresponsible to use machine translation for the rights list. Please consider contributing time and/or resources to help expand the language options.',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ), // TODO: Update for link(s)
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
