/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// ignore_for_file: constant_identifier_names

const Widget updater = EzUpdaterFAB(
  appVersion: '2.0.0',
  versionSource:
      'https://raw.githubusercontent.com/Empathetech-LLC/sos/refs/heads/main/APP_VERSION',
  gPlay: 'https://play.google.com/store/apps/details?id=net.empathetech.sos',
  appStore: 'https://apps.apple.com/us/app/instasos/id6744280817',
  github: 'https://github.com/Empathetech-LLC/sos/releases',
);

class HelpFAB extends StatelessWidget {
  /// Opens an [ezModal] with an FAQ and a button for resetting to tutorial(s)
  const HelpFAB({super.key});

  // Define custom functions //

  void followLink(BuildContext context, String url) async {
    bool launch = true;

    if (sosOnClose) {
      launch = await showDialog(
        context: context,
        builder: (BuildContext dContext) => EzAlertDialog(
          title: Text(
            EzConfig.l10n.gAttention,
            textAlign: TextAlign.center,
          ),
          content: Text(
            l10n.faqOnCloseWarning,
            textAlign: TextAlign.center,
          ),
          actions: ezActionPair(
            context: context,
            confirmMsg: EzConfig.l10n.gContinue,
            confirmIsDestructive: true,
            onConfirm: () => Navigator.of(dContext).pop(true),
            denyMsg: EzConfig.l10n.gCancel,
            denyIsDefault: true,
            onDeny: () => Navigator.of(dContext).pop(false),
          ),
          needsClose: false,
        ),
      );
    }

    if (launch) launchUrl(Uri.parse(url));
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => FloatingActionButton(
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
                  style: EzConfig.styles.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: EzTranslationsPendingNotice(
                  header: EzConfig.margin,
                  footer: const SizedBox.shrink(),
                ),
              ),
              EzConfig.margin,

              // Shared I //
              ExpansionTile(
                title: Text(
                  l10n.faqListQ,
                  style: EzConfig.styles.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.faqListA1,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  EzLink(
                    'ACLU Know Your Rights',
                    onTap: () => followLink(context, acluLink),
                    hint: EzConfig.l10n.gOpenLink,
                    textAlign: TextAlign.start,
                    padding: EdgeInsets.only(left: EzConfig.marginVal),
                  ),
                  EzLink(
                    'IMMDEF Resources',
                    onTap: () => followLink(context, immdefLink),
                    hint: EzConfig.l10n.gOpenLink,
                    textAlign: TextAlign.start,
                    padding: EdgeInsets.only(left: EzConfig.marginVal),
                  ),
                  EzLink(
                    'Dunk the Vote: The Black Book',
                    onTap: () => followLink(context, dunkLink),
                    hint: EzConfig.l10n.gOpenLink,
                    textAlign: TextAlign.start,
                    padding: EdgeInsets.only(left: EzConfig.marginVal),
                  ),
                  EzConfig.startLine,
                  EzRichText(
                    <InlineSpan>[
                      EzPlainText(
                        text: l10n.faqListA2,
                        style: EzConfig.styles.bodyLarge,
                      ),
                      EzInlineLink(
                        'How to document ICE',
                        onTap: () => followLink(context, howToLink),
                        hint: EzConfig.l10n.gOpenLink,
                        style: EzConfig.styles.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ],
                    textBackground: false,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Android specific //
              if (!isIOS) ...<Widget>[
                // Clarity on platform settings
                ExpansionTile(
                  title: Text(
                    l10n.faqSettings,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.faqOnOpen,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      '${l10n.ssSOSOnClose}: ${l10n.ssSOSOnCloseHint}',
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqOnInterrupt,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqAutoShare,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqEMC,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqLink,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),

                // Clarity for platform headache(s)
                ExpansionTile(
                  title: Text(
                    l10n.faqUnavailable,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    EzRichText(
                      <InlineSpan>[
                        EzPlainText(
                          text: l10n.faqReliability,
                          style: EzConfig.styles.bodyLarge,
                        ),
                        EzInlineLink(
                          l10n.faqLocationPermissions,
                          onTap: openAppSettings,
                          hint: EzConfig.l10n.gOpenLink,
                        ),
                        EzPlainText(
                          text: '.',
                          style: EzConfig.styles.bodyLarge,
                        ),
                      ],
                      textBackground: false,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqLocationTrust,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],

              // iOS Specific //
              if (isIOS) ...<Widget>[
                // Clarity on platform settings
                ExpansionTile(
                  title: Text(
                    l10n.faqSettings,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.faqOnOpen,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqAutoShare,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqEMC,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqLink,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),

                // Clarity for platform headache(s)
                ExpansionTile(
                  title: Text(
                    l10n.faqPrivateContact,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.faqContactPermissions,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    EzRichText(
                      <InlineSpan>[
                        EzPlainText(
                          text: l10n.faqUpdateContacts,
                          style: EzConfig.styles.bodyLarge,
                        ),
                        EzInlineLink(
                          l10n.faqOSSettings,
                          onTap: openAppSettings,
                          hint: EzConfig.l10n.gOpenLink,
                        ),
                        EzPlainText(
                          text: '.',
                          style: EzConfig.styles.bodyLarge,
                        ),
                      ],
                      textBackground: false,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),

                // Clarity on feature disparity
                ExpansionTile(
                  title: Text(
                    l10n.faqMissing,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.faqRestricted,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    EzConfig.startLine,
                    Text(
                      l10n.faqShortcuts,
                      style: EzConfig.styles.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],

              // Shared II //

              ExpansionTile(
                title: Text(
                  l10n.faqLanguages,
                  style: EzConfig.styles.bodyLarge,
                  textAlign: TextAlign.start,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EzRichText(
                    <InlineSpan>[
                      EzPlainText(
                        text: l10n.faqResponsible,
                        style: EzConfig.styles.bodyLarge,
                      ),
                      EzInlineLink(
                        l10n.faqContributing,
                        onTap: () => followLink(context, contributeLink),
                        hint: EzConfig.l10n.gOpenLink,
                      ),
                      EzPlainText(
                        text: l10n.faqExpand,
                        style: EzConfig.styles.bodyLarge,
                      ),
                    ],
                    textBackground: false,
                    style: EzConfig.styles.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // Reset tutorial (conditional)
              if (!showTutorial) ...<Widget>[
                EzConfig.spacer,
                Center(
                  child: EzElevatedButton(
                    text: l10n.faqReset,
                    onPressed: () async {
                      await EzConfig.setBool(showTutorialKey, true);
                      await EzConfig.redrawUI(doNothing);
                    },
                  ),
                ),
              ],
              EzSpacer(space: EzConfig.spargin),
            ],
          ),
        ),
        tooltip: EzConfig.l10n.gHelp,
        child: EzIcon(Icons.help),
      );
}
