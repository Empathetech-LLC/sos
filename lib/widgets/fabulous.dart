/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
    final double margin = EzConfig.get(marginKey);

    final EFUILang el10n = ezL10n(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //* Expandable FAQ *//

            Center(
              child: Text(
                'FAQ',
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
                child: EzTranslationsPendingNotice(
              header: ezMargin,
              footer: ezMargin,
            )),
            ezMargin,

            // Shared I //

            ExpansionTile(
              title: Text(
                'How was the rights list made?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'The rights list was compiled from several public sources, including:',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                EzLink(
                  'ACLU Know Your Rights',
                  url: Uri.parse('https://www.aclu.org/know-your-rights'),
                  hint: el10n.gOpen, // TODO: better?
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                EzLink(
                  'IMMDEF Resources',
                  url: Uri.parse('https://www.immdef.org/resources'),
                  hint: el10n.gOpen,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                EzLink(
                  'Dunk the Vote: The Black Book',
                  url: Uri.parse(
                      'https://dunkthevote4ever.org/project/the-black-book-know-your-rights/'),
                  hint: el10n.gOpen,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                ezStartLine,
                EzRichText(
                  <InlineSpan>[
                    EzPlainText(
                      text: 'Another useful resource: ',
                      style: textTheme.bodyLarge,
                    ),
                    EzInlineLink(
                      'How to document ICE',
                      url: Uri.parse(
                          'https://lab.witness.org/projects/eyes-on-ice/'),
                      hint: el10n.gOpen,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                  textBackground: false,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
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
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
                    'SOS on interrupted recording: when enabled, if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or "SOS on close" (or both).',
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
                    'Link type: how your location will be delivered to your emergency contacts. "Google Maps", "Apple Maps", and "Waze" will send a clickable link for the corresponding service. "Coordinates" will send your latitude and longitude as plain text.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  'SOS says "Location unavailable"?',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EzRichText(
                    <InlineSpan>[
                      EzPlainText(
                        text:
                            'To improve SOS reliability, please enable "Allow all the time" in the ',
                        style: textTheme.bodyLarge,
                      ),
                      EzInlineLink(
                        'location permissions',
                        onTap: openAppSettings,
                        hint: el10n.gOpen,
                      ),
                      EzPlainText(
                        text: '.',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                    textBackground: false,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    'The app only uses your location while an SOS broadcast is active. Neither InstaSOS or Empathetech LLC track, store, or sell user data.',
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
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                EzRichText(
                  <InlineSpan>[
                    EzPlainText(
                      text:
                          'It would be irresponsible to use machine translation for the rights list. Please consider ',
                      style: textTheme.bodyLarge,
                    ),
                    EzInlineLink(
                      'contributing',
                      url:
                          Uri.parse('https://www.empathetech.net/#/contribute'),
                      hint: el10n.gOpen,
                    ),
                    EzPlainText(
                      text: ' to help expand the language options.',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                  textBackground: false,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
              ],
            ),

            // Reset tutorial (conditional)
            if (EzConfig.get(tutorialKey) != true) ...<Widget>[
              ezSpacer,
              Center(
                child: EzElevatedButton(
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
              ),
              EzSpacer(space: EzConfig.get(spacingKey) * 1.5),
            ],
          ],
        ),
      ),
      tooltip: el10n.gHelp,
      child: EzIcon(PlatformIcons(context).help),
    );
  }
}
