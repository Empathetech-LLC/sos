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

class SettingsHomeScreen extends StatelessWidget {
  SettingsHomeScreen() : super(key: ValueKey<int>(EzConfig.seed));

  // Define custom functions //

  Future<void> followLink(
    String url, {
    required BuildContext parentContext,
    required BuildContext modalContext,
  }) async {
    bool launch = true;
    if (modalContext.mounted) Navigator.of(modalContext).pop();

    if (sosOnClose) {
      launch = await showDialog(
        context: parentContext,
        builder: (BuildContext dCon) => EzAlertDialog(
          title: Text(
            EzConfig.l10n.gAttention,
            textAlign: TextAlign.center,
          ),
          content: Text(
            l10n.gOnCloseWarning,
            textAlign: TextAlign.center,
          ),
          actions: ezActionPair(
            confirmMsg: EzConfig.l10n.gContinue,
            confirmIsDestructive: true,
            onConfirm: () => Navigator.of(dCon).pop(true),
            denyMsg: EzConfig.l10n.gCancel,
            denyIsDefault: true,
            onDeny: () => Navigator.of(dCon).pop(false),
          ),
          needsClose: false,
        ),
      );
    }

    if (launch) await launchUrl(Uri.parse(url));
  }

  // Return the build //

  @override
  Widget build(BuildContext context) => SosScaffold(
        EzScreen(
          Center(
            child: EzScrollView(children: <Widget>[
              // Language
              const EzLocaleSetting(),
              EzConfig.separator,

              // Auto-share media
              EzSwitchPair(text: l10n.ssAutoShare, valueKey: autoShareMediaKey),
              EzConfig.separator,

              // GoTo SOS
              EzElevatedIconButton(
                onPressed: () => context.goNamed(sosSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: l10n.ssSOS,
              ),
              EzConfig.spacer,

              // GoTo Appearance
              EzElevatedIconButton(
                onPressed: () => context.goNamed(appearanceSettingsPath),
                icon: EzIcon(Icons.navigate_next),
                label: l10n.ssAppearance,
              ),
              EzConfig.divider,

              // Permissions
              EzElevatedIconButton(
                onPressed: () async {
                  bool locked = false;

                  await ezModal(
                    context: context,
                    builder: (BuildContext mCon) => StatefulBuilder(
                      builder: (_, StateSetter setModal) => ezModalScroll(<Widget>[
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
                              l10n.gSystem.toLowerCase(),
                              onTap: () async {
                                await openAppSettings();
                                if (mCon.mounted) {
                                  Navigator.of(mCon).pop();
                                }
                              },
                              hint: EzConfig.l10n.gOpenLink,
                            ),
                            EzPlainText(
                              text: '.',
                              style: EzConfig.styles.bodyLarge,
                            ),
                          ],
                          textBackground: false,
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        EzConfig.centerLine,
                        Text(
                          l10n.pmManualPermission,
                          style: EzConfig.styles.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        EzConfig.divider,

                        // Setup cards
                        ContactsSetup(
                          locked: locked,
                          setLock: (bool active) => setModal(() => locked = active),
                        ),
                        EzConfig.spacer,

                        if (!isIOS) ...<Widget>[
                          SMSSetup(
                            locked: locked,
                            setLock: (bool active) => setModal(() => locked = active),
                          ),
                          EzConfig.spacer,
                        ],

                        LocationSetup(
                          locked: locked,
                          setLock: (bool active) => setModal(() => locked = active),
                        ),
                        EzConfig.spacer,

                        // Finish/leave
                        EzTextButton(
                          text: l10n.gDone,
                          textStyle:
                              EzConfig.styles.bodyLarge?.copyWith(color: EzConfig.colors.primary),
                          textAlign: TextAlign.center,
                          style: TextButton.styleFrom(
                              backgroundColor: EzConfig.colors.surfaceContainer),
                          onPressed: () => Navigator.of(mCon).pop(true),
                        ),
                        EzConfig.separator,
                      ]),
                    ),
                  );
                },
                icon: EzIcon(Icons.list),
                label: l10n.ssPermissions,
              ),
              EzConfig.spacer,

              // Resources
              EzElevatedIconButton(
                onPressed: () => ezModal(
                  context: context,
                  builder: (BuildContext mCon) => ezModalScroll(<Widget>[
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
                      onTap: () => followLink(
                        acluLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // Dunk the Vote
                    EzLink(
                      'Dunk the Vote: The Black Book',
                      onTap: () => followLink(
                        dunkLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // How to document
                    EzLink(
                      'How to document ICE',
                      onTap: () => followLink(
                        howToLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // ICERR
                    EzLink(
                      'ICERR (Rapid Response)',
                      onTap: () => followLink(
                        icerrLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // IMMDEF
                    EzLink(
                      'IMMDEF Resources',
                      onTap: () => followLink(
                        immdefLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: EzConfig.l10n.gOpenLink,
                      style: EzConfig.styles.bodyLarge,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    EzConfig.spacer,

                    // NNiRR
                    EzLink(
                      'NNiRR Immigration Hotlines',
                      onTap: () => followLink(
                        nirrHotlinesLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
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
                      onTap: () => followLink(
                        iceLocatorLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
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
                    EzConfig.separator,
                  ]),
                ),
                icon: EzIcon(Icons.search),
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
                    builder: (BuildContext mCon) => ezModalScroll(
                      <Widget>[
                        //* Expandable FAQ *//

                        Center(
                          child: Text(
                            l10n.faqName,
                            style: EzConfig.styles.titleLarge,
                            textAlign: TextAlign.center,
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
                              onTap: () => followLink(
                                acluLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: EzConfig.l10n.gOpenLink,
                              textAlign: TextAlign.start,
                            ),
                            EzLink(
                              'IMMDEF Resources',
                              onTap: () => followLink(
                                immdefLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: EzConfig.l10n.gOpenLink,
                              textAlign: TextAlign.start,
                            ),
                            EzLink(
                              'Dunk the Vote: The Black Book',
                              onTap: () => followLink(
                                dunkLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: EzConfig.l10n.gOpenLink,
                              textAlign: TextAlign.start,
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
                                    text: '${l10n.ssAutoShare}:',
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
                                    text: '${l10n.bsLinkType}:',
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
                                    text: '${l10n.bsSOSOnOpen}:',
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
                                    text: ' ${l10n.bsSOSOnCloseHint.replaceAll('\n', ' ')}',
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
                                    text: '${l10n.bsSOSOnVideo}:',
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
                                    onTap: () async {
                                      await openAppSettings();
                                      if (mCon.mounted) {
                                        Navigator.of(mCon).pop();
                                      }
                                    },
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
                                    text: '${l10n.ssAutoShare}:',
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
                                    text: '${l10n.bsLinkType}:',
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
                                    text: '${l10n.bsSOSOnOpen}:',
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
                              l10n.bsNumError.replaceRange(l10n.bsNumError.length - 1, null, '?'),
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Permission issue
                              Text(
                                l10n.faqContactPermissions,
                                semanticsLabel: l10n.faqContactPermissionsFix,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              EzConfig.startLine,

                              // Fix here
                              EzRichText(
                                <InlineSpan>[
                                  EzPlainText(
                                    text: l10n.faqUpdateContacts,
                                    style: answer,
                                  ),
                                  EzInlineLink(
                                    l10n.gSystem.toLowerCase(),
                                    onTap: () async {
                                      await openAppSettings();
                                      if (mCon.mounted) {
                                        Navigator.of(mCon).pop();
                                      }
                                    },
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

                              // Two part-er
                              EzRichText(
                                <InlineSpan>[
                                  EzPlainText(
                                    text: l10n.faqSplitClarity1,
                                    style: answer,
                                  ),
                                  EzInlineLink(
                                    l10n.ssSOS.toLowerCase(),
                                    onTap: () {
                                      Navigator.of(mCon).pop();
                                      context.goNamed(sosSettingsPath);
                                    },
                                    hint: EzConfig.l10n.gOpenLink,
                                  ),
                                  EzPlainText(
                                    text: l10n.faqSplitClarity2,
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
                                  onTap: () => followLink(
                                    contributeLink,
                                    parentContext: context,
                                    modalContext: mCon,
                                  ),
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
                                  'mailto:support@empathetech.net?subject=InstaSOS%20support',
                                  parentContext: context,
                                  modalContext: mCon,
                                ),
                              ),

                              // Tutorial
                              if (!showTutorial) ...<Widget>[
                                EzConfig.rowSpacer,
                                EzElevatedButton(
                                  text: l10n.faqReset,
                                  onPressed: () async {
                                    await EzConfig.setBool(showTutorialKey, true);
                                    if (mCon.mounted) {
                                      Navigator.of(mCon).pop();
                                    }
                                    await EzConfig.rebuildUI();
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                        EzConfig.separator,
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  );
                },
                icon: EzIcon(Icons.help_outline),
                label: l10n.ssSupport,
              ),
            ]),
          ),
          safeArea: true,
        ),
      );
}
