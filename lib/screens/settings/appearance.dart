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
          config,
          safeArea: true,
          child: EzSettingsHub(
            config,
            pages: <EzSettingsSection>[
              // Global //

              EzSettingsSection(
                position: 0,
                title: config.ezL10n.gGlobal,
                icon: EzIcon(
                  config,
                  EzCM.onMobile
                      ? EzCM.platform == TargetPlatform.iOS
                          ? Icons.phone_iphone
                          : Icons.phone_android
                      : Icons.computer,
                  semanticLabel: config.ezL10n.gGlobal,
                ),
                subSettings: <EzSubSetting>[],
                fromStorage: () => EzSubSetting.blank,
                build: (_) => EzGlobalSettings(
                  config,
                  excludeLocaleSetting: true,
                  resetTitle: () => config.ezL10n.ssResetAppearance,
                ),
              ),

              // Color //

              EzSettingsSection(
                position: 1,
                title: config.ezL10n.gColor,
                icon: EzIcon(
                  config,
                  Icons.palette,
                  semanticLabel: config.ezL10n.gColor,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckColor,
                  EzSubSetting.advColor,
                ],
                fromStorage: () => EzCM.get(advancedColorsKey) == true
                    ? EzSubSetting.advColor
                    : EzSubSetting.qckColor,
                build: (EzSubSetting subSec) => EzColorSettings(
                  config,
                  target: subSec,
                  extraDark: <String>[darkVideoColorKey],
                  extraLight: <String>[lightVideoColorKey],
                ),
              ),

              // Design //

              EzSettingsSection(
                position: 2,
                title: config.ezL10n.gDesign,
                icon: EzIcon(
                  config,
                  Icons.design_services,
                  semanticLabel: config.ezL10n.gDesign,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.butDesign,
                  EzSubSetting.pagDesign,
                ],
                fromStorage: () =>
                    EzCM.get(pageTabKey) == true ? EzSubSetting.pagDesign : EzSubSetting.butDesign,
                build: (EzSubSetting subSec) => EzDesignSettings(
                  config,
                  target: subSec,
                  prependPage: <Widget>[_RightsOpacity(config), config.separator],
                ),
              ),

              // Text //

              EzSettingsSection(
                position: 3,
                title: config.ezL10n.gText,
                icon: EzIcon(
                  config,
                  Icons.text_format,
                  semanticLabel: config.ezL10n.gText,
                ),
                subSettings: <EzSubSetting>[
                  EzSubSetting.qckText,
                  EzSubSetting.advText,
                ],
                fromStorage: () =>
                    EzCM.get(advancedTextKey) == true ? EzSubSetting.advText : EzSubSetting.qckText,
                build: (EzSubSetting subSec) => EzTextSettings(config, target: subSec),
              ),
            ],
            target: targetPass,
          ),
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
      config,
      onPressed: () async {
        double opacity = config.textBackgroundOpacity;
        Color background = config.colors.surface.withValues(alpha: opacity);

        await ezModal(
          config,
          context: context,
          builder: (_) => StatefulBuilder(
            builder: (BuildContext mCon, StateSetter setModal) =>
                ezModalScroll(config, children: <Widget>[
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
                        semanticLabel: l10n(config).dsLadyLiberty,
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: background,
                      child: RightsView(config),
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
                config,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Local reset
                  EzElevatedIconButton(
                    config,
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
                    icon: EzIcon(config, Icons.refresh),
                    label: config.ezL10n.gReset,
                  ),
                  config.rowSpacer,

                  // Done/submit
                  EzElevatedIconButton(
                    config,
                    onPressed: Navigator.of(mCon).pop,
                    icon: EzIcon(config, Icons.done),
                    label: l10n(config).gDone,
                  ),
                ],
              ),
              config.separator,
            ]),
          ),
        );

        if (opacity != config.textBackgroundOpacity) {
          await config.rebuildUI(<EzCacheType>{EzCacheType.text});
        }
      },
      icon: EzIcon(config, Icons.opacity),
      label: config.ezL10n.tsTextBackground,
    );
  }
}
