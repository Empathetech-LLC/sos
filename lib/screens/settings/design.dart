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
  void redraw() {
    if (mounted) setState(() {});
  }

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
                      builder: (BuildContext mContext, StateSetter setModal) =>
                          EzScrollView(
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

                          // Footer
                          EzRow(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
                                    opacity = EzConfig.getDefault(
                                        EzConfig.isDark
                                            ? darkTextBackgroundOpacityKey
                                            : lightTextBackgroundOpacityKey);
                                    background = EzConfig.colors.surface
                                        .withValues(alpha: opacity);
                                  });
                                },
                                icon: const Icon(Icons.refresh),
                                label: EzConfig.l10n.gReset,
                              ),
                              EzConfig.rowSpacer,

                              // Done/submit
                              EzElevatedIconButton(
                                onPressed: Navigator.of(mContext).pop,
                                icon: const Icon(Icons.done),
                                label: l10n.gDone,
                              ),
                            ],
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
            includeIconSize: false,
            afterDesign: <Widget>[
              EzSwitchPair(
                valueKey: showBackFABKey,
                text: l10n.dsShowBack,
                afterChanged: (_) => EzConfig.redrawUI(redraw),
              ),
            ],
          ),
          useImageDecoration: false,
        ),
        fabs: <Widget>[
          if (config.needsRebuild) ...<Widget>[
            config.layout.spacer,
            EzRebuildFAB(redraw),
          ],
          config.layout.spacer,
          EzSettingsDupeFAB(
            updateBoth,
            () {
              if (mounted) setState(() => updateBoth = !updateBoth);
            },
          ),
          if (showBackFAB) ...<Widget>[
            config.layout.spacer,
            const EzBackFAB(),
          ]
        ],
      ),
    );
  }
}
