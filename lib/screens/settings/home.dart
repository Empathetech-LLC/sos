/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatefulWidget {
  SettingsHomeScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
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
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        Center(
          child: EzScrollView(children: <Widget>[
            // Language
            EzLocaleSetting(
              () => setState(() {}),
              locales: Lang.supportedLocales,
              skip: <Locale>{arabic, english, chinese}, // Dupes
            ),
            EzConfig.separator,

            // Auto-share media
            // TODO: pictures/videos
            EzSwitchPair(text: l10n.ssAutoShare, valueKey: autoShareMediaKey),
            EzConfig.separator,

            // GoTo SOS
            EzElevatedIconButton(
              onPressed: () => context.goNamed(sosSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: 'SOS settings',
            ),
            EzConfig.spacer,

            // GoTo Appearance
            EzElevatedIconButton(
              onPressed: () => context.goNamed(appearanceSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: l10n.ssAppearance, // TODO: add "settings"
            ),
            EzConfig.divider,

            // Resources
            // TODO: l10n
            EzElevatedIconButton(
              onPressed: () => ezModal(
                context: context,
                builder: (BuildContext mContext) => EzScrollView(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Community resources //
                    Center(
                      child: Text(
                        'Community resources',
                        style: EzConfig.styles.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EzConfig.spacer,

                    // ACLU
                    EzLink(
                      'ACLU Know Your Rights',
                      onTap: () => followLink(context, acluLink),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // Dunk the Vote
                    EzLink(
                      'Dunk the Vote: The Black Book',
                      onTap: () => followLink(context, dunkLink),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // How to document
                    EzLink(
                      'How to document ICE',
                      onTap: () => followLink(context, howToLink),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // ICERR
                    EzLink(
                      'ICERR (Rapid Response)',
                      onTap: () => followLink(context, icerrLink),
                      hint: 'Open a link to an ice rapid response database.',
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // IMMDEF
                    EzLink(
                      'IMMDEF Resources',
                      onTap: () => followLink(context, immdefLink),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // NNiRR
                    EzLink(
                      'NNiRR Immigration Hotlines',
                      onTap: () => followLink(context, nirrHotlinesLink),
                      hint:
                          'Open a link to the National Network for Immigrant and Refugee Rights.',
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.divider,

                    // Gov resources //
                    Center(
                      child: Text(
                        'US government resources',
                        style: EzConfig.styles.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EzConfig.spacer,

                    // Detainee Locator
                    EzLink(
                      'ICE Detainee Locator',
                      onTap: () => followLink(context, iceLocatorLink),
                      hint:
                          'Open a link to the US immigration and customs enforcement site.',
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.divider,

                    // Disclaimers
                    Text(
                      'None are affiliated with Empathetech LLC',
                      style: EzConfig.styles.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    EzTranslationsPendingNotice(
                      header: EzConfig.margin,
                      footer: const SizedBox.shrink(),
                    ),
                    EzSpacer(space: EzConfig.spargin),
                  ],
                ),
              ),
              icon: const Icon(Icons.search),
              label: 'Resources',
            ),
            EzConfig.spacer,

            // App support
            EzElevatedIconButton(
              onPressed: () => ezModal(
                context: context,
                builder: (BuildContext mContext) => EzScrollView(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //* Expandable FAQ *//
                    // TODO: Audit reabability and re-order to match new layout
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
                    EzConfig.spacer,

                    // Reset tutorial (conditional)
                    if (!showTutorial) ...<Widget>[
                      Center(
                        child: EzElevatedButton(
                          text: l10n.faqReset, // TODO: plural
                          onPressed: () async {
                            await EzConfig.setBool(showTutorialKey, true);
                            await EzConfig.redrawUI(doNothing);
                          },
                        ),
                      ),
                      EzConfig.spacer,
                    ],

                    // Contact support
                    // TODO: l10n
                    Center(
                      child: EzLink(
                        'Contact support',
                        onTap: () => followLink(
                          context,
                          'mailto:support@empathetech.net?subject=InstaSOS%20support',
                        ),
                        hint: 'Opens an email to empathetic support',
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    EzSpacer(space: EzConfig.spargin),
                  ],
                ),
              ),
              icon: EzIcon(Icons.help_outline),
              // TODO: l10n
              label: 'Support',
            ),
          ]),
        ),
        useImageDecoration: false,
      ),
      fabs: showBackFAB
          ? <Widget>[EzConfig.spacer, const EzBackFAB(showHome: true)]
          : null,
    );
  }
}
