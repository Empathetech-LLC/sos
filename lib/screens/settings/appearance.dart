/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  /// Optionally override the starting position
  final int? targetPass;

  AppearanceSettingsScreen({this.targetPass}) : super(key: ValueKey<int>(EzConfig.seed));

  @override
  Widget build(BuildContext context) => Consumer<EzConfigProvider>(
        builder: (_, EzConfigProvider config, __) => SosScaffold(
          EzScreen(EzSettingsHub(
            pages: <EzSettingsSection>[
              // Global //

              EzSettingsSection(
                position: 0,
                title: EzConfig.l10n.gGlobal,
                icon: EzIcon(
                  config.onMobile
                      ? config.platform == TargetPlatform.iOS
                          ? Icons.phone_iphone
                          : Icons.phone_android
                      : Icons.computer,
                  semanticLabel: EzConfig.l10n.gGlobal,
                ),
                subSettings: <EzSubSetting>[],
                fromStorage: () => EzSubSetting.blank,
                build: (_) => EzGlobalSettings(
                  excludeLocaleSetting: true,
                  resetTitle: () => EzConfig.l10n.ssResetAppearance,
                ),
              ),

              // Color //

              EzSettingsSection(
                position: 1,
                title: EzConfig.l10n.gColor,
                icon: EzIcon(
                  Icons.palette,
                  semanticLabel: EzConfig.l10n.gColor,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckColor,
                  EzSubSetting.advColor,
                ],
                fromStorage: () => EzConfig.get(advancedColorsKey) == true
                    ? EzSubSetting.advColor
                    : EzSubSetting.qckColor,
                build: (EzSubSetting subSec) => EzColorSettings(
                  target: subSec,
                  extraDark: <String>[darkVideoColorKey],
                  extraLight: <String>[lightVideoColorKey],
                ),
              ),

              // Design //

              EzSettingsSection(
                position: 2,
                title: EzConfig.l10n.gDesign,
                icon: EzIcon(
                  Icons.design_services,
                  semanticLabel: EzConfig.l10n.gDesign,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.butDesign,
                  EzSubSetting.pagDesign,
                ],
                fromStorage: () => EzConfig.get(pageTabKey) == true
                    ? EzSubSetting.pagDesign
                    : EzSubSetting.butDesign,
                build: (EzSubSetting subSec) => EzDesignSettings(
                  target: subSec,
                  prependPage: <Widget>[
                    const _RightsOpacity(),
                    EzConfig.separator,
                  ],
                ),
              ),

              // Text //

              EzSettingsSection(
                position: 3,
                title: EzConfig.l10n.gText,
                icon: EzIcon(
                  Icons.text_format,
                  semanticLabel: EzConfig.l10n.gText,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckText,
                  EzSubSetting.advText,
                ],
                fromStorage: () => EzConfig.get(advancedTextKey) == true
                    ? EzSubSetting.advText
                    : EzSubSetting.qckText,
                build: (EzSubSetting subSec) => EzTextSettings(target: subSec),
              ),
            ],
            target: targetPass,
          )),
          fabs: <Widget>[
            // Rebuild (conditional)
            if (config.needsRebuild) ...<Widget>[
              config.layout.spacer,
              const EzRebuildFAB(),
            ],

            // Save/upload config
            config.layout.spacer,
            const EzConfigFAB(),
          ],
        ),
      );
}

class _RightsOpacity extends StatelessWidget {
  const _RightsOpacity();

  @override
  Widget build(BuildContext context) => EzElevatedIconButton(
        onPressed: () async {
          double opacity = EzConfig.textBackgroundOpacity;
          Color background = EzConfig.colors.surface.withValues(alpha: opacity);

          await ezModal(
            context: context,
            builder: (_) => StatefulBuilder(
              builder: (BuildContext mCon, StateSetter setModal) => ezModalScroll(<Widget>[
                // Preview
                Container(
                  width: double.infinity,
                  height: heightOf(context) * 0.667,
                  color: EzConfig.colors.surface,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: EzImage(
                          image: const AssetImage(ladyLiberty),
                          semanticLabel: l10n.dsLadyLiberty,
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: background,
                        child: const RightsView(),
                      ),
                    ],
                  ),
                ),
                EzConfig.spacer,

                // Slider
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: ScreenSize.small.size),
                  child: Slider(
                    // Slider values
                    value: opacity,
                    min: minOpacity,
                    max: maxOpacity,
                    divisions: 20,
                    label: opacity.toStringAsFixed(2),

                    // Slider functions
                    onChanged: (double value) => setModal(() {
                      opacity = value;
                      background = EzConfig.colors.surface.withValues(alpha: opacity);
                    }),
                    onChangeEnd: (double value) async {
                      if (EzConfig.updateBoth || EzConfig.isDark) {
                        await EzConfig.setDouble(darkTextBackgroundOpacityKey, value);
                      }
                      if (EzConfig.updateBoth || !EzConfig.isDark) {
                        await EzConfig.setDouble(lightTextBackgroundOpacityKey, value);
                      }
                    },
                  ),
                ),
                EzConfig.spacer,

                // Footer
                EzRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Local reset
                    EzElevatedIconButton(
                      onPressed: () async {
                        if (EzConfig.updateBoth || EzConfig.isDark) {
                          await EzConfig.remove(darkTextBackgroundOpacityKey);
                        }
                        if (EzConfig.updateBoth || !EzConfig.isDark) {
                          await EzConfig.remove(lightTextBackgroundOpacityKey);
                        }

                        setModal(() {
                          opacity = EzConfig.getDefault(EzConfig.isDark
                              ? darkTextBackgroundOpacityKey
                              : lightTextBackgroundOpacityKey);
                          background = EzConfig.colors.surface.withValues(alpha: opacity);
                        });
                      },
                      icon: EzIcon(Icons.refresh),
                      label: EzConfig.l10n.gReset,
                    ),
                    EzConfig.rowSpacer,

                    // Done/submit
                    EzElevatedIconButton(
                      onPressed: Navigator.of(mCon).pop,
                      icon: EzIcon(Icons.done),
                      label: l10n.gDone,
                    ),
                  ],
                ),
                EzConfig.separator,
              ]),
            ),
          );

          if (opacity != EzConfig.textBackgroundOpacity) await EzConfig.rebuildUI();
        },
        icon: EzIcon(Icons.opacity),
        label: EzConfig.l10n.tsTextBackground,
      );
}
