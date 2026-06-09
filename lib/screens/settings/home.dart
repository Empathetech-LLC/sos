/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../export.dart';
import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({super.key});

  // Define custom functions //

  Future<void> followLink(
    EzCP config, {
    required String url,
    required BuildContext parentContext,
    required BuildContext modalContext,
  }) async {
    bool launch = true;
    if (modalContext.mounted) Navigator.of(modalContext).pop();

    if (sosOnClose) {
      launch = await showDialog(
        context: parentContext,
        builder: (BuildContext dCon) => EzAlertDialog(
          config,
          title: Text(
            config.ezL10n.gAttention,
            textAlign: TextAlign.center,
          ),
          content: Text(
            l10n(config).gOnCloseWarning,
            textAlign: TextAlign.center,
          ),
          actions: ezActionPair(
            config,
            confirmMsg: config.ezL10n.gContinue,
            confirmIsDestructive: true,
            onConfirm: () => Navigator.of(dCon).pop(true),
            denyMsg: config.ezL10n.gCancel,
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
  Widget build(BuildContext context) {
    return Consumer<EzCP>(
      builder: (_, EzCP config, __) => SosScaffold(
        config,
        body: EzScreen(
          config,
          safeArea: true,
          child: Center(
            child: EzScrollView(config, children: <Widget>[
              // Language
              EzLocaleSetting(
                config,
                skip: <Locale>{arabic, english, chinese}, // dupes
              ),
              config.separator,

              // Auto-share media
              EzSwitchPair(
                config,
                text: l10n(config).ssAutoShare,
                valueKey: autoShareMediaKey,
              ),
              config.separator,

              // GoTo SOS
              EzElevatedIconButton(
                config,
                onPressed: () => context.goNamed(sosSettingsPath),
                icon: EzIcon(config, Icons.navigate_next),
                label: l10n(config).ssSOS,
              ),
              config.spacer,

              // GoTo Appearance
              EzElevatedIconButton(
                config,
                onPressed: () => context.goNamed(appearanceSettingsPath),
                icon: EzIcon(config, Icons.navigate_next),
                label: l10n(config).ssAppearance,
              ),
              config.divider,

              // Permissions
              EzElevatedIconButton(
                config,
                onPressed: () async {
                  bool locked = false;

                  await ezModal(
                    config,
                    context: context,
                    builder: (BuildContext mCon) => StatefulBuilder(
                      builder: (_, StateSetter setModal) =>
                          ezModalScroll(config, children: <Widget>[
                        // Intro
                        EzRichText(
                          config,
                          children: <InlineSpan>[
                            EzPlainText(
                              text: '${l10n(config).pmOnlyAdd}\n',
                              style: config.bodyStyle,
                            ),
                            EzPlainText(
                              text: l10n(config).pmRemoveIn,
                              style: config.bodyStyle,
                            ),
                            EzInlineLink(
                              config,
                              text: l10n(config).gSystem.toLowerCase(),
                              onTap: () async {
                                await openAppSettings();
                                if (mCon.mounted) {
                                  Navigator.of(mCon).pop();
                                }
                              },
                              hint: config.ezL10n.gOpenLink,
                            ),
                            EzPlainText(
                              text: '.',
                              style: config.bodyStyle,
                            ),
                          ],
                          textBackground: false,
                          style: config.bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        config.centerLine,
                        Text(
                          l10n(config).pmManualPermission,
                          style: config.bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        config.divider,

                        // Setup cards
                        ContactsSetup(
                          config,
                          locked: locked,
                          setLock: (bool active) => setModal(() => locked = active),
                        ),
                        config.spacer,

                        if (!isIOS) ...<Widget>[
                          SMSSetup(
                            config,
                            locked: locked,
                            setLock: (bool active) => setModal(() => locked = active),
                          ),
                          config.spacer,
                        ],

                        LocationSetup(
                          config,
                          locked: locked,
                          setLock: (bool active) => setModal(() => locked = active),
                        ),
                        config.spacer,

                        // Finish/leave
                        EzTextButton(
                          config,
                          text: l10n(config).gDone,
                          textStyle:
                              config.bodyStyle?.copyWith(color: config.theme.colorScheme.primary),
                          textAlign: TextAlign.center,
                          style: TextButton.styleFrom(
                              backgroundColor: config.theme.colorScheme.surfaceContainer),
                          onPressed: () => Navigator.of(mCon).pop(true),
                        ),
                        config.separator,
                      ]),
                    ),
                  );
                },
                icon: EzIcon(config, Icons.list),
                label: l10n(config).ssPermissions,
              ),
              config.spacer,

              // Resources
              EzElevatedIconButton(
                config,
                onPressed: () => ezModal(
                  config,
                  context: context,
                  builder: (BuildContext mCon) => ezModalScroll(config, children: <Widget>[
                    // Community resources //
                    Center(
                      child: Text(
                        l10n(config).rmCommunity,
                        style: config.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    config.spacer,

                    // ACLU
                    EzLink(
                      config,
                      text: 'ACLU Know Your Rights',
                      onTap: () => followLink(
                        config,
                        url: acluLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.spacer,

                    // Dunk the Vote
                    EzLink(
                      config,
                      text: 'Dunk the Vote: The Black Book',
                      onTap: () => followLink(
                        config,
                        url: dunkLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.spacer,

                    // How to document
                    EzLink(
                      config,
                      text: 'How to document ICE',
                      onTap: () => followLink(
                        config,
                        url: howToLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.spacer,

                    // ICERR
                    EzLink(
                      config,
                      text: 'ICERR (Rapid Response)',
                      onTap: () => followLink(
                        config,
                        url: icerrLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.spacer,

                    // IMMDEF
                    EzLink(
                      config,
                      text: 'IMMDEF Resources',
                      onTap: () => followLink(
                        config,
                        url: immdefLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.spacer,

                    // NNiRR
                    EzLink(
                      config,
                      text: 'NNiRR Immigration Hotlines',
                      onTap: () => followLink(
                        config,
                        url: nirrHotlinesLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.divider,

                    // Gov resources //
                    Center(
                      child: Text(
                        l10n(config).rmGov,
                        style: config.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    config.spacer,

                    // Detainee Locator
                    EzLink(
                      config,
                      text: 'ICE Detainee Locator',
                      onTap: () => followLink(
                        config,
                        url: iceLocatorLink,
                        parentContext: context,
                        modalContext: mCon,
                      ),
                      hint: config.ezL10n.gOpenLink,
                      style: config.bodyStyle,
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                    ),
                    config.divider,

                    // Disclaimers
                    Text(
                      l10n(config).rmAffiliate,
                      semanticsLabel: l10n(config).rmAffiliateFix,
                      style: config.labelStyle,
                      textAlign: TextAlign.center,
                    ),
                    config.separator,
                  ]),
                ),
                icon: EzIcon(config, Icons.search),
                label: l10n(config).ssResources,
              ),
              config.spacer,

              // App support
              EzElevatedIconButton(
                config,
                onPressed: () async {
                  final TextStyle? answer = config.bodyStyle;
                  final TextStyle? question =
                      answer?.copyWith(decoration: TextDecoration.underline);

                  await ezModal(
                    config,
                    context: context,
                    builder: (BuildContext mCon) => ezModalScroll(
                      config,
                      children: <Widget>[
                        //* Expandable FAQ *//

                        Center(
                          child: Text(
                            l10n(config).faqName,
                            style: config.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        config.margin,

                        // Rights list source? - shared //

                        ExpansionTile(
                          title: Text(
                            l10n(config).faqListQ,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // From public...
                            Text(
                              l10n(config).faqListA,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            config.startLine,

                            // Links
                            EzLink(
                              config,
                              text: 'ACLU Know Your Rights',
                              onTap: () => followLink(
                                config,
                                url: acluLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: config.ezL10n.gOpenLink,
                              textAlign: TextAlign.start,
                            ),
                            EzLink(
                              config,
                              text: 'IMMDEF Resources',
                              onTap: () => followLink(
                                config,
                                url: immdefLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: config.ezL10n.gOpenLink,
                              textAlign: TextAlign.start,
                            ),
                            EzLink(
                              config,
                              text: 'Dunk the Vote: The Black Book',
                              onTap: () => followLink(
                                config,
                                url: dunkLink,
                                parentContext: context,
                                modalContext: mCon,
                              ),
                              hint: config.ezL10n.gOpenLink,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                        // Android section //

                        if (!isIOS) ...<Widget>[
                          // Settings explanation
                          ExpansionTile(
                            title: Text(
                              l10n(config).faqSettings,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Auto share
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).ssAutoShare}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqAutoShareA,
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // Location link
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsLinkType}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqLinkA,
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // On open
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsSOSOnOpen}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqOnOpenA,
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // On close
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsSOSOnClose}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: ' ${l10n(config).bsSOSOnCloseHint.replaceAll('\n', ' ')}',
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // On interrupt
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsSOSOnVideo}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqOnInterruptA,
                                    semanticsLabel: l10n(config).faqOnInterruptAFix,
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
                              l10n(config).faqUnavailable,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: l10n(config).faqReliability,
                                    style: answer,
                                  ),
                                  EzInlineLink(
                                    config,
                                    text: l10n(config).faqLocationPermissions,
                                    onTap: () async {
                                      await openAppSettings();
                                      if (mCon.mounted) {
                                        Navigator.of(mCon).pop();
                                      }
                                    },
                                    hint: config.ezL10n.gOpenLink,
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
                              config.startLine,
                              Text(
                                l10n(config).faqLocationTrust,
                                semanticsLabel: l10n(config).faqLocationTrustFix,
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
                              l10n(config).faqSettings,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Auto share
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).ssAutoShare}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqAutoShareA,
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // Location link
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsLinkType}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqLinkA,
                                    style: answer,
                                  ),
                                ],
                                textBackground: false,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // On open
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: '${l10n(config).bsSOSOnOpen}:',
                                    style: question,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqOnOpenA,
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
                              l10n(config)
                                  .bsNumError
                                  .replaceRange(l10n(config).bsNumError.length - 1, null, '?'),
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Permission issue
                              Text(
                                l10n(config).faqContactPermissions,
                                semanticsLabel: l10n(config).faqContactPermissionsFix,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,

                              // Fix here
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: l10n(config).faqUpdateContacts,
                                    style: answer,
                                  ),
                                  EzInlineLink(
                                    config,
                                    text: l10n(config).gSystem.toLowerCase(),
                                    onTap: () async {
                                      await openAppSettings();
                                      if (mCon.mounted) {
                                        Navigator.of(mCon).pop();
                                      }
                                    },
                                    hint: config.ezL10n.gOpenLink,
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
                              config.startLine,

                              // Two part-er
                              EzRichText(
                                config,
                                children: <InlineSpan>[
                                  EzPlainText(
                                    text: l10n(config).faqSplitClarity1,
                                    style: answer,
                                  ),
                                  EzInlineLink(
                                    config,
                                    text: l10n(config).ssSOS.toLowerCase(),
                                    onTap: () {
                                      Navigator.of(mCon).pop();
                                      context.goNamed(sosSettingsPath);
                                    },
                                    hint: config.ezL10n.gOpenLink,
                                  ),
                                  EzPlainText(
                                    text: l10n(config).faqSplitClarity2,
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
                              l10n(config).faqMissing,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                l10n(config).faqRestricted,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                              config.startLine,
                              Text(
                                l10n(config).faqShortcuts,
                                style: answer,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],

                        // Missing languages? - shared //

                        ExpansionTile(
                          title: Text(
                            l10n(config).faqLanguages,
                            style: answer,
                            textAlign: TextAlign.start,
                          ),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            EzRichText(
                              config,
                              children: <InlineSpan>[
                                EzPlainText(
                                  text: l10n(config).faqResponsible,
                                  style: answer,
                                ),
                                EzInlineLink(
                                  config,
                                  text: l10n(config).faqContributing,
                                  onTap: () => followLink(
                                    config,
                                    url: contributeLink,
                                    parentContext: context,
                                    modalContext: mCon,
                                  ),
                                  hint: config.ezL10n.gOpenLink,
                                ),
                                EzPlainText(
                                  text: l10n(config).faqExpand,
                                  style: answer,
                                ),
                              ],
                              textBackground: false,
                              style: answer,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        config.spacer,

                        // Reset tutorial/contact support //

                        Center(
                          child: EzScrollView(
                            config,
                            reverseHands: true,
                            mainAxisAlignment: MainAxisAlignment.center,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              // Support
                              EzElevatedButton(
                                config,
                                text: l10n(config).faqContact,
                                onPressed: () => followLink(
                                  config,
                                  url: 'mailto:support@empathetech.net?subject=InstaSOS%20support',
                                  parentContext: context,
                                  modalContext: mCon,
                                ),
                              ),

                              // Tutorial
                              if (!showTutorial) ...<Widget>[
                                config.rowSpacer,
                                EzElevatedButton(
                                  config,
                                  text: l10n(config).faqReset,
                                  onPressed: () async {
                                    await EzCM.setBool(showTutorialKey, true);
                                    if (mCon.mounted) Navigator.of(mCon).pop();
                                    await config.rebuildUI(noEST);
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                        config.separator,
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  );
                },
                icon: EzIcon(config, Icons.help_outline),
                label: l10n(config).ssSupport,
              ),
              EzFooter(config),
            ]),
          ),
        ),
      ),
    );
  }
}
