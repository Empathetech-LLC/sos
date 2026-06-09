/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SOSSettingsScreen extends StatefulWidget {
  const SOSSettingsScreen({super.key});

  @override
  State<SOSSettingsScreen> createState() => _SOSSettingsScreenState();
}

class _SOSSettingsScreenState extends State<SOSSettingsScreen> with WidgetsBindingObserver {
  // Define the build data //

  bool canSMS = isIOS || emc.isNotEmpty;
  LLType _linkType = linkType;

  // Define custom functions //

  Future<bool> canSet(String key, bool value) async {
    if (value == false || isIOS) return true;

    final bool newPerm = allowedPermCheck(await Permission.sms.request());
    if (newPerm != canSMS) if (mounted) setState(() => canSMS = newPerm);

    return newPerm;
  }

  // Init //

  // Catches permission removal edge-case; cannot define with async
  Future<void> initPerm() async {
    if (isIOS) return;
    final bool check = allowedPermCheck(await Permission.sms.status);
    if (check != canSMS) if (mounted) setState(() => canSMS = check);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPerm();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) await initPerm();
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
              if (!canSMS) ...<Widget>[
                EzText(
                  config,
                  text: l10n(config).sosNeedSMS,
                  style: config.bodyStyle,
                  textAlign: TextAlign.center,
                ),
                EzLink(
                  config,
                  text: l10n(config).gSystem,
                  onTap: openAppSettings,
                  hint: config.ezL10n.gOpenLink,
                  backgroundColor: config.colors.surfaceContainer,
                ),
                config.separator,
              ],

              // EMC
              ContactList(
                config,
                onUpdate: () {
                  if (mounted) setState(() {});
                },
                fauxDisabled: !canSMS,
              ),
              config.separator,

              // Link type
              EzScrollView(
                config,
                scrollDirection: Axis.horizontal,
                reverseHands: true,
                children: <Widget>[
                  // Label
                  EzText(
                    config,
                    text: l10n(config).bsLinkType,
                    style: config.bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  config.margin,
                  EzDropdownMenu<LLType>(
                    config,
                    widthEntry: LLType.google.label,
                    dropdownMenuEntries: LLType.values
                        .map<DropdownMenuEntry<LLType>>((LLType type) => DropdownMenuEntry<LLType>(
                              value: type,
                              label: type.label,
                            ))
                        .toList(),
                    enableSearch: false,
                    initialSelection: _linkType,
                    onSelected: (LLType? selection) async {
                      if (selection == null || selection == _linkType) return;

                      await EzCM.setString(linkTypeKey, selection.name);
                      if (mounted) setState(() => _linkType = selection);
                    },
                  ),
                ],
              ),
              config.divider,

              // SOS on open
              EzSwitchPair(
                config,
                enabled: emc.isNotEmpty,
                fauxDisabled: !canSMS,
                text: l10n(config).bsSOSOnOpen,
                valueKey: sosOnOpenKey,
                canChange: (bool choice) => canSet(sosOnOpenKey, choice),
              ),

              if (!isIOS) ...<Widget>[
                // SOS on close
                config.spacer,
                EzSwitchPair(
                  config,
                  enabled: emc.isNotEmpty,
                  fauxDisabled: !canSMS,
                  text: l10n(config).bsSOSOnClose,
                  valueKey: sosOnCloseKey,
                  canChange: (bool choice) async {
                    final bool check1 = await canSet(sosOnCloseKey, choice);
                    final bool? check2 = (choice == false)
                        ? context.mounted
                            // Confirm immediate closure to prevent accidental broadcasts
                            ? await showDialog<bool>(
                                context: context,
                                builder: (BuildContext dCon) => EzAlertDialog(
                                  config,
                                  title: Text(
                                    config.ezL10n.gAttention,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    l10n(config).bsCloseOffWarning,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: ezActionPair(
                                    config,
                                    confirmMsg: l10n(config).gOk,
                                    confirmIsDefault: true,
                                    onConfirm: () => Navigator.of(dCon).pop(true),
                                    denyMsg: config.ezL10n.gCancel,
                                    onDeny: () => Navigator.of(dCon).pop(false),
                                  ),
                                  needsClose: false,
                                ),
                              )
                            : true
                        : context.mounted
                            // Confirm the user wants to enable this setting
                            ? await showDialog<bool>(
                                context: context,
                                builder: (BuildContext dCon) => EzAlertDialog(
                                  config,
                                  title: Text(
                                    config.ezL10n.gAttention,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    l10n(config).bsSOSOnCloseHint,
                                    semanticsLabel: l10n(config).bsSOSOnCloseHintFix,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: ezActionPair(
                                    config,
                                    confirmMsg: l10n(config).gOk,
                                    confirmIsDefault: true,
                                    onConfirm: () => Navigator.of(dCon).pop(true),
                                    denyMsg: config.ezL10n.gCancel,
                                    onDeny: () => Navigator.of(dCon).pop(false),
                                  ),
                                  needsClose: false,
                                ),
                              )
                            : false;

                    return check1 && (check2 ?? false);
                  },
                  afterChanged: (bool? value) {
                    // Exit the app when turning off to avoid accidental broadcasts
                    if (value == false) exit(0);
                  },
                ),
                config.spacer,

                // SOS on interrupt
                EzSwitchPair(
                  config,
                  enabled: emc.isNotEmpty,
                  fauxDisabled: !canSMS,
                  text: l10n(config).bsSOSOnVideo,
                  valueKey: sosOnInterruptKey,
                  canChange: (bool choice) => canSet(sosOnInterruptKey, choice),
                ),
              ],
              EzFooter(config),
            ]),
          ),
        ),
      ),
    );
  }

  // Cleanup //

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
