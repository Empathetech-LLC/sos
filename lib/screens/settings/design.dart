/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class DesignSettingsScreen extends StatefulWidget {
  DesignSettingsScreen() : super(key: ValueKey<int>(EzConfig.seed));

  @override
  State<DesignSettingsScreen> createState() => _DesignSettingsScreenState();
}

class _DesignSettingsScreenState extends State<DesignSettingsScreen> {
  bool updateBoth = false;
  void redraw() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Consumer<EzConfigProvider>(
      builder: (_, EzConfigProvider config, __) => SosScaffold(
        EzScreen(
          EzDesignSettings(
            onUpdate: redraw,
            updateBoth: updateBoth,
            appName: appName,
            androidPackage: androidPackage,
            includeBackgroundImage: false,
            beforeDesign: <Widget>[
              // Text Background Opacity mirror
              // TODO: done button and live updates (also double check update both)
              EzElevatedIconButton(
                onPressed: () async {
                  double opacity = EzConfig.get(EzConfig.isDark
                      ? darkTextBackgroundOpacityKey
                      : lightTextBackgroundOpacityKey);
                  final double backup = opacity;

                  Color background =
                      EzConfig.colors.surface.withValues(alpha: opacity);

                  await ezModal(
                    context: context,
                    builder: (_) => StatefulBuilder(
                      builder: (_, StateSetter setModal) => EzScrollView(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
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
                            constraints:
                                BoxConstraints(maxWidth: ScreenSize.small.size),
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
                                background = EzConfig.colors.surface
                                    .withValues(alpha: opacity);
                              }),
                              onChangeEnd: (double value) async {
                                if (updateBoth || EzConfig.isDark) {
                                  await EzConfig.setDouble(
                                      darkTextBackgroundOpacityKey, value);
                                }
                                if (updateBoth || !EzConfig.isDark) {
                                  await EzConfig.setDouble(
                                      lightTextBackgroundOpacityKey, value);
                                }
                              },
                            ),
                          ),
                          EzConfig.spacer,

                          // Local reset
                          EzElevatedIconButton(
                            onPressed: () async {
                              if (updateBoth || EzConfig.isDark) {
                                await EzConfig.remove(
                                    darkTextBackgroundOpacityKey);
                              }
                              if (updateBoth || !EzConfig.isDark) {
                                await EzConfig.remove(
                                    lightTextBackgroundOpacityKey);
                              }

                              setModal(() {
                                opacity = EzConfig.getDefault(EzConfig.isDark
                                    ? darkTextBackgroundOpacityKey
                                    : lightTextBackgroundOpacityKey);
                                background = EzConfig.colors.surface
                                    .withValues(alpha: opacity);
                              });
                            },
                            icon: const Icon(Icons.refresh),
                            label: EzConfig.l10n.gReset,
                          ),
                          EzSpacer(space: EzConfig.spargin),
                        ],
                      ),
                    ),
                  );

                  if (opacity != backup) await EzConfig.rebuildUI(redraw);
                },
                icon: const Icon(Icons.opacity),
                label: EzConfig.l10n.tsTextBackground,
              ),
              EzConfig.spacer,
            ],
          ),
          useImageDecoration: false,
        ),
        fabs: <Widget>[
          if (config.needsRebuild) ...<Widget>[
            config.layout.spacer,
            EzRebuildFAB(() => setState(() {})),
          ],
          config.layout.spacer,
          EzSettingsDupeFAB(
            updateBoth,
            () => setState(() => updateBoth = !updateBoth),
          ),
          config.layout.spacer,
          const EzBackFAB(),
        ],
      ),
    );
  }
}
