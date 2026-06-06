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
        EzScreen(
          Center(
            child: EzScrollView(children: <Widget>[
              if (!canSMS) ...<Widget>[
                EzText(
                  l10n.sosNeedSMS,
                  style: config.bodyStyle,
                  textAlign: TextAlign.center,
                ),
                EzLink(
                  l10n.gSystem,
                  onTap: openAppSettings,
                  hint: config.l10n.gOpenLink,
                  backgroundColor: config.colors.surfaceContainer,
                ),
                config.separator,
              ],

              // EMC
              ContactList(
                config: config,
                onUpdate: () {
                  if (mounted) setState(() {});
                },
                fauxDisabled: !canSMS,
              ),
              config.separator,

              // Link type
              EzScrollView(
                scrollDirection: Axis.horizontal,
                reverseHands: true,
                children: <Widget>[
                  // Label
                  EzText(
                    l10n.bsLinkType,
                    style: config.bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  config.margin,
                  EzDropdownMenu<LLType>(
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
                enabled: emc.isNotEmpty,
                fauxDisabled: !canSMS,
                text: l10n.bsSOSOnOpen,
                valueKey: sosOnOpenKey,
                canChange: (bool choice) => canSet(sosOnOpenKey, choice),
              ),

              if (!isIOS) ...<Widget>[
                // SOS on close
                config.spacer,
                EzSwitchPair(
                  enabled: emc.isNotEmpty,
                  fauxDisabled: !canSMS,
                  text: l10n.bsSOSOnClose,
                  valueKey: sosOnCloseKey,
                  canChange: (bool choice) async {
                    final bool check1 = await canSet(sosOnCloseKey, choice);
                    final bool? check2 = (choice == false)
                        ? context.mounted
                            // Confirm immediate closure to prevent accidental broadcasts
                            ? await showDialog<bool>(
                                context: context,
                                builder: (BuildContext dCon) => EzAlertDialog(
                                  title: Text(
                                    config.l10n.gAttention,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    l10n.bsCloseOffWarning,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: ezActionPair(
                                    confirmMsg: l10n.gOk,
                                    confirmIsDefault: true,
                                    onConfirm: () => Navigator.of(dCon).pop(true),
                                    denyMsg: config.l10n.gCancel,
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
                                  title: Text(
                                    config.l10n.gAttention,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    l10n.bsSOSOnCloseHint,
                                    semanticsLabel: l10n.bsSOSOnCloseHintFix,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: ezActionPair(
                                    confirmMsg: l10n.gOk,
                                    confirmIsDefault: true,
                                    onConfirm: () => Navigator.of(dCon).pop(true),
                                    denyMsg: config.l10n.gCancel,
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
                  enabled: emc.isNotEmpty,
                  fauxDisabled: !canSMS,
                  text: l10n.bsSOSOnVideo,
                  valueKey: sosOnInterruptKey,
                  canChange: (bool choice) => canSet(sosOnInterruptKey, choice),
                ),
              ],
              EzFooter(config),
            ]),
          ),
          safeArea: true,
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
