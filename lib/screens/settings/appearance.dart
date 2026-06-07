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

  const AppearanceSettingsScreen({super.key, this.targetPass});

  @override
  Widget build(BuildContext context) {
    return Consumer<EzCP>(
      builder: (_, EzCP config, __) => SosScaffold(
        config,
        body: EzScreen(
          EzSettingsHub(
            pages: <EzSettingsSection>[
              // Global //

              EzSettingsSection(
                position: 0,
                title: config.l10n.gGlobal,
                icon: EzIcon(
                  EzCM.onMobile
                      ? EzCM.platform == TargetPlatform.iOS
                          ? Icons.phone_iphone
                          : Icons.phone_android
                      : Icons.computer,
                  semanticLabel: config.l10n.gGlobal,
                ),
                subSettings: <EzSubSetting>[],
                fromStorage: () => EzSubSetting.blank,
                build: (_) => EzGlobalSettings(
                  excludeLocaleSetting: true,
                  resetTitle: () => config.l10n.ssResetAppearance,
                ),
              ),

              // Color //

              EzSettingsSection(
                position: 1,
                title: config.l10n.gColor,
                icon: EzIcon(
                  Icons.palette,
                  semanticLabel: config.l10n.gColor,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckColor,
                  EzSubSetting.advColor,
                ],
                fromStorage: () => EzCM.get(advancedColorsKey) == true
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
                title: config.l10n.gDesign,
                icon: EzIcon(
                  Icons.design_services,
                  semanticLabel: config.l10n.gDesign,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.butDesign,
                  EzSubSetting.pagDesign,
                ],
                fromStorage: () =>
                    EzCM.get(pageTabKey) == true ? EzSubSetting.pagDesign : EzSubSetting.butDesign,
                build: (EzSubSetting subSec) => EzDesignSettings(
                  target: subSec,
                  prependPage: <Widget>[_RightsOpacity(config), config.separator],
                ),
              ),

              // Text //

              EzSettingsSection(
                position: 3,
                title: config.l10n.gText,
                icon: EzIcon(
                  Icons.text_format,
                  semanticLabel: config.l10n.gText,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckText,
                  EzSubSetting.advText,
                ],
                fromStorage: () =>
                    EzCM.get(advancedTextKey) == true ? EzSubSetting.advText : EzSubSetting.qckText,
                build: (EzSubSetting subSec) => EzTextSettings(target: subSec),
              ),
            ],
            target: targetPass,
          ),
          safeArea: true,
        ),
        fabs: <Widget>[
          // Rebuild (conditional)
          if (config.needsRebuild) ...<Widget>[
            config.spacer,
            EzRebuildFAB(config),
          ],

          // Save/upload config
          config.spacer,
          EzConfigFAB(config),
        ],
      ),
    );
  }
}

class _RightsOpacity extends StatelessWidget {
  final EzCP config;

  const _RightsOpacity(this.config);

  @override
  Widget build(BuildContext context) {
    return EzElevatedIconButton(
      onPressed: () async {
        double opacity = config.textBackgroundOpacity;
        Color background = config.colors.surface.withValues(alpha: opacity);

        await ezModal(
          context: context,
          builder: (_) => StatefulBuilder(
            builder: (BuildContext mCon, StateSetter setModal) => ezModalScroll(<Widget>[
              // Preview
              Container(
                width: double.infinity,
                height: heightOf(context) * 0.667,
                color: config.colors.surface,
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
              config.spacer,

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
                    background = config.colors.surface.withValues(alpha: opacity);
                  }),
                  onChangeEnd: (double value) async {
                    if (EzCM.updateBoth || config.isDark) {
                      await EzCM.setDouble(darkTextBackgroundOpacityKey, value);
                    }
                    if (EzCM.updateBoth || !config.isDark) {
                      await EzCM.setDouble(lightTextBackgroundOpacityKey, value);
                    }
                  },
                ),
              ),
              config.spacer,

              // Footer
              EzRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Local reset
                  EzElevatedIconButton(
                    onPressed: () async {
                      if (EzCM.updateBoth || config.isDark) {
                        await EzCM.remove(darkTextBackgroundOpacityKey);
                      }
                      if (EzCM.updateBoth || !config.isDark) {
                        await EzCM.remove(lightTextBackgroundOpacityKey);
                      }

                      setModal(() {
                        opacity = EzCM.getDefault(config.isDark
                            ? darkTextBackgroundOpacityKey
                            : lightTextBackgroundOpacityKey);
                        background = config.colors.surface.withValues(alpha: opacity);
                      });
                    },
                    icon: EzIcon(Icons.refresh),
                    label: config.l10n.gReset,
                  ),
                  config.rowSpacer,

                  // Done/submit
                  EzElevatedIconButton(
                    onPressed: Navigator.of(mCon).pop,
                    icon: EzIcon(Icons.done),
                    label: l10n.gDone,
                  ),
                ],
              ),
              config.separator,
            ]),
          ),
        );

        if (opacity != config.textBackgroundOpacity) await config.rebuildUI();
      },
      icon: EzIcon(Icons.opacity),
      label: config.l10n.tsTextBackground,
    );
  }
}
