/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// ignore_for_file: constant_identifier_names

const Widget updater = EzUpdaterFAB(
  appVersion: '1.5.2',
  versionSource:
      'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
  gPlay: 'https://play.google.com/store/apps/details?id=net.empathetech.sos',
  appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
  github: 'https://github.com/Empathetech-LLC/sos/releases',
);

const String _ACLU = 'https://www.aclu.org/know-your-rights';
const String _IMMDEF = 'https://www.immdef.org/resources';
const String _dunk =
    'https://dunkthevote4ever.org/project/the-black-book-know-your-rights/';
const String _howTo = 'https://lab.witness.org/projects/eyes-on-ice/';
const String _contributeLink = 'https://www.empathetech.net/#/contribute';

class HelpFAB extends StatelessWidget {
  /// Opens an [ezModal] with an FAQ and a button for resetting to tutorial(s)
  const HelpFAB({super.key});

  @override
  Widget build(BuildContext context) {
    // Gather the theme data //

    final double margin = EzConfig.margin;

    final EFUILang el10n = ezL10n(context);
    final Lang l10n = Lang.of(context)!;

    final TextTheme textTheme = Theme.of(context).textTheme;

    // Define custom functions //

    void followLink(String url) async {
      bool launch = true;

      if (EzConfig.get(onCloseKey) == true) {
        launch = await showPlatformDialog(
          context: context,
          builder: (BuildContext dContext) {
            late final List<Widget> materialActions;
            late final List<Widget> cupertinoActions;

            (materialActions, cupertinoActions) = ezActionPairs(
              context: context,
              confirmMsg: el10n.gContinue,
              confirmIsDestructive: true,
              onConfirm: () => Navigator.of(dContext).pop(true),
              denyMsg: el10n.gCancel,
              denyIsDefault: true,
              onDeny: () => Navigator.of(dContext).pop(false),
            );

            return EzAlertDialog(
              title: Text(el10n.gAttention, textAlign: TextAlign.center),
              content: Text(
                l10n.faqOnCloseWarning,
                textAlign: TextAlign.center,
              ),
              materialActions: materialActions,
              cupertinoActions: cupertinoActions,
              needsClose: false,
            );
          },
        );
      }

      if (launch) launchUrl(Uri.parse(url));
    }

    // Return the build //

    return FloatingActionButton(
      heroTag: 'help_fab',
      onPressed: () => ezModal(
        context: context,
        builder: (BuildContext mContext) => EzScrollView(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //* Expandable FAQ *//

            Center(
              child: Text(
                l10n.faqName,
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: EzTranslationsPendingNotice(
                header: ezMargin,
                footer: const SizedBox.shrink(),
              ),
            ),
            ezMargin,

            // Shared I //

            ExpansionTile(
              title: Text(
                l10n.faqListQ,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.faqListA1,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                EzLink(
                  'ACLU Know Your Rights',
                  onTap: () => followLink(_ACLU),
                  hint: el10n.gOpenLink,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                EzLink(
                  'IMMDEF Resources',
                  onTap: () => followLink(_IMMDEF),
                  hint: el10n.gOpenLink,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                EzLink(
                  'Dunk the Vote: The Black Book',
                  onTap: () => followLink(_dunk),
                  hint: el10n.gOpenLink,
                  textAlign: TextAlign.start,
                  padding: EdgeInsets.only(left: margin),
                ),
                ezStartLine,
                EzRichText(
                  <InlineSpan>[
                    EzPlainText(
                      text: l10n.faqListA2,
                      style: textTheme.bodyLarge,
                    ),
                    EzInlineLink(
                      'How to document ICE',
                      onTap: () => followLink(_howTo),
                      hint: el10n.gOpenLink,
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
                  l10n.faqSettings,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.faqOnOpen,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    '${l10n.ssSOSOnClose}: ${l10n.ssSOSOnCloseHint}',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqOnInterrupt,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqAutoShare,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqEMC,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqLink,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  l10n.faqUnavailable,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EzRichText(
                    <InlineSpan>[
                      EzPlainText(
                        text: l10n.faqReliability,
                        style: textTheme.bodyLarge,
                      ),
                      EzInlineLink(
                        l10n.faqLocationPermissions,
                        onTap: openAppSettings,
                        hint: el10n.gOpenLink,
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
                    l10n.faqLocationTrust,
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
                  l10n.faqSettings,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.faqOnOpen,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqAutoShare,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqEMC,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqLink,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Clarity for platform headache(s)
              ExpansionTile(
                title: Text(
                  l10n.faqPrivateContact,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.faqContactPermissions,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  EzRichText(
                    <InlineSpan>[
                      EzPlainText(
                        text: l10n.faqUpdateContacts,
                        style: textTheme.bodyLarge,
                      ),
                      EzInlineLink(
                        l10n.faqOSSettings,
                        onTap: openAppSettings,
                        hint: el10n.gOpenLink,
                      ),
                      EzPlainText(
                        text: '.',
                        style: textTheme.bodyLarge,
                      )
                    ],
                    textBackground: false,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  )
                ],
              ),

              // Clarity on feature disparity
              ExpansionTile(
                title: Text(
                  l10n.faqMissing,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.faqRestricted,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  ezStartLine,
                  Text(
                    l10n.faqShortcuts,
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],

            // Shared II //

            ExpansionTile(
              title: Text(
                l10n.faqLanguages,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                EzRichText(
                  <InlineSpan>[
                    EzPlainText(
                      text: l10n.faqResponsible,
                      style: textTheme.bodyLarge,
                    ),
                    EzInlineLink(
                      l10n.faqContributing,
                      onTap: () => followLink(_contributeLink),
                      hint: el10n.gOpenLink,
                    ),
                    EzPlainText(
                      text: l10n.faqExpand,
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
                  text: l10n.faqReset,
                  onPressed: () async {
                    await EzConfig.setBool(tutorialKey, true);
                    if (mContext.mounted) Navigator.of(mContext).pop();

                    if (context.mounted) {
                      ezSnackBar(
                        context: context,
                        message: l10n.faqResetSnack,
                        undo: () => EzConfig.setBool(tutorialKey, false),
                      );
                    }
                  },
                ),
              ),
            ],
            EzSpacer(space: EzConfig.spacing * 1.5),
          ],
        ),
      ),
      tooltip: el10n.gHelp,
      child: EzIcon(PlatformIcons(context).help),
    );
  }
}
