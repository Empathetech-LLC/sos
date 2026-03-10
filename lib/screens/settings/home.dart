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
            l10n.gOnCloseWarning,
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
            EzSwitchPair(text: l10n.ssAutoShare, valueKey: autoShareMediaKey),
            EzConfig.separator,

            // GoTo SOS
            EzElevatedIconButton(
              onPressed: () => context.goNamed(sosSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: l10n.ssSOS,
            ),
            EzConfig.spacer,

            // GoTo Appearance
            EzElevatedIconButton(
              onPressed: () => context.goNamed(appearanceSettingsPath),
              icon: const Icon(Icons.navigate_next),
              label: l10n.ssAppearance,
            ),
            EzConfig.divider,

            // Permissions
            EzElevatedIconButton(
              onPressed: () async => ezModal(
                context: context,
                builder: (BuildContext mContext) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: EzConfig.marginVal),
                  child: EzScrollView(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Intro
                      EzRichText(
                        <InlineSpan>[
                          EzPlainText(
                            text: '${l10n.pmOnlyAdd}\n',
                            style: EzConfig.styles.bodyLarge,
                          ),
                          EzPlainText(
                            text: l10n.pmRemoveIn,
                            style: EzConfig.styles.bodyLarge,
                          ),
                          EzInlineLink(
                            l10n.pmSystem,
                            onTap: openAppSettings,
                            hint: EzConfig.l10n.gOpenLink,
                          ),
                        ],
                        textBackground: false,
                        style: EzConfig.styles.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      if (isIOS) ...<Widget>[
                        EzConfig.centerLine,
                        Text(
                          l10n.pmManualPermission,
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                      EzConfig.divider,

                      const ContactsSetup(),
                      EzConfig.spacer,

                      if (!isIOS) ...<Widget>[
                        const SMSSetup(),
                        EzConfig.spacer,
                      ],

                      const LocationSetup(),
                      EzConfig.spacer,

                      // Finish/leave
                      EzTextButton(
                        text: l10n.gDone,
                        textStyle: EzConfig.styles.bodyLarge
                            ?.copyWith(color: EzConfig.colors.primary),
                        textAlign: TextAlign.center,
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () => Navigator.of(mContext).pop(true),
                      ),
                      EzSpacer(space: EzConfig.spargin),
                    ],
                  ),
                ),
              ),
              icon: const Icon(Icons.check),
              label: l10n.ssPermissions,
            ),
            EzConfig.spacer,

            // Resources
            EzElevatedIconButton(
              onPressed: () async => ezModal(
                context: context,
                builder: (BuildContext mContext) => EzScrollView(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Community resources //
                    Center(
                      child: Text(
                        l10n.rmCommunity,
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
                      hint: EzConfig.l10n.gOpenLink,
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
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.divider,

                    // Gov resources //
                    Center(
                      child: Text(
                        l10n.rmGov,
                        style: EzConfig.styles.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EzConfig.spacer,

                    // Detainee Locator
                    EzLink(
                      'ICE Detainee Locator',
                      onTap: () => followLink(context, iceLocatorLink),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.divider,

                    // Disclaimers
                    Text(
                      l10n.rmAffiliate,
                      semanticsLabel: l10n.rmAffiliateFix,
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
              label: l10n.ssResources,
            ),
            EzConfig.spacer,

            // App support
            EzElevatedIconButton(
              onPressed: () async {
                final TextStyle? answer = EzConfig.styles.bodyLarge;
                final TextStyle? question =
                    answer?.copyWith(decoration: TextDecoration.underline);

                await ezModal(
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

                      // Rights list source? - shared //

                      ExpansionTile(
                        title: Text(
                          l10n.faqListQ,
                          style: answer,
                          textAlign: TextAlign.start,
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // From public...
                          Text(
                            l10n.faqListA,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          EzConfig.startLine,

                          // Links
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

                      // Android section //

                      if (!isIOS) ...<Widget>[
                        // Settings explanation
                        ExpansionTile(
                          title: Text(
                            l10n.faqSettings,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Auto share
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqAutoShareQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqAutoShareA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // Location link
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqLinkQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqLinkA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // On open
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqOnOpenQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqOnOpenA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // On close
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: '${l10n.bsSOSOnClose}:',
                                  style: question,
                                ),
                                EzPlainText(
                                  text:
                                      ' ${l10n.bsSOSOnCloseHint.replaceAll('\n', ' ')}',
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // On interrupt
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqOnInterruptQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqOnInterruptA,
                                  semanticsLabel: l10n.faqOnInterruptAFix,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                        // Location unavailable?
                        ExpansionTile(
                          title: Text(
                            l10n.faqUnavailable,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqReliability,
                                  style: answer,
                                ),
                                EzInlineLink(
                                  l10n.faqLocationPermissions,
                                  onTap: openAppSettings,
                                  hint: EzConfig.l10n.gOpenLink,
                                ),
                                EzPlainText(
                                  text: '.',
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,
                            Text(
                              l10n.faqLocationTrust,
                              semanticsLabel: l10n.faqLocationTrustFix,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],

                      // iOS section //

                      if (isIOS) ...<Widget>[
                        // Settings explanation
                        ExpansionTile(
                          title: Text(
                            l10n.faqSettings,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Auto share
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqAutoShareQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqAutoShareA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // Location link
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqLinkQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqLinkA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,

                            // On open
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqOnOpenQ,
                                  style: question,
                                ),
                                EzPlainText(
                                  text: l10n.faqOnOpenA,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                        // Private contact?
                        ExpansionTile(
                          title: Text(
                            l10n.faqPrivateContact,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l10n.faqContactPermissions,
                              semanticsLabel: l10n.faqContactPermissionsFix,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,
                            EzRichText(
                              <InlineSpan>[
                                EzPlainText(
                                  text: l10n.faqUpdateContacts,
                                  style: answer,
                                ),
                                EzInlineLink(
                                  l10n.faqOSSettings,
                                  onTap: openAppSettings,
                                  hint: EzConfig.l10n.gOpenLink,
                                ),
                                EzPlainText(
                                  text: '.',
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                        // Fewer settings than Android?
                        ExpansionTile(
                          title: Text(
                            l10n.faqMissing,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l10n.faqRestricted,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            EzConfig.startLine,
                            Text(
                              l10n.faqShortcuts,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],

                      // Missing languages? - shared //

                      ExpansionTile(
                        title: Text(
                          l10n.faqLanguages,
                          style: answer,
                          textAlign: TextAlign.start,
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          EzRichText(
                            <InlineSpan>[
                              EzPlainText(
                                text: l10n.faqResponsible,
                                style: answer,
                              ),
                              EzInlineLink(
                                l10n.faqContributing,
                                onTap: () =>
                                    followLink(context, contributeLink),
                                hint: EzConfig.l10n.gOpenLink,
                              ),
                              EzPlainText(
                                text: l10n.faqExpand,
                                style: answer,
                              ),
                            ],
                            textBackground: false,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      EzConfig.spacer,

                      // Reset tutorial/contact support //

                      Center(
                        child: EzScrollView(
                          reverseHands: true,
                          mainAxisAlignment: MainAxisAlignment.center,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            // Support
                            EzElevatedButton(
                              text: l10n.faqContact,
                              onPressed: () => followLink(
                                context,
                                'mailto:support@empathetech.net?subject=InstaSOS%20support',
                              ),
                            ),

                            // Tutorial
                            if (!showTutorial) ...<Widget>[
                              EzConfig.rowSpacer,
                              EzElevatedButton(
                                text: l10n.faqReset,
                                onPressed: () async {
                                  await EzConfig.setBool(showTutorialKey, true);
                                  if (mContext.mounted) {
                                    Navigator.of(mContext).pop();
                                  }

                                  await EzConfig.redrawUI(doNothing);
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                      EzSpacer(space: EzConfig.spargin),
                    ],
                  ),
                );
              },
              icon: EzIcon(Icons.help_outline),
              label: l10n.ssSupport,
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
