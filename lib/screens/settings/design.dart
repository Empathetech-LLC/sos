/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class DesignSettingsScreen extends StatelessWidget {
  const DesignSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SosScaffold(
      EzScreen(
        EzDesignSettings(
          includeBackgroundImage: false,
          beforeDesign: <Widget>[
            // Text Background Opacity mirror
            EzElevatedIconButton(
              onPressed: () => ezModal(
                context: context,
                builder: (_) {
                  final String opacityKey = EzConfig.isDark
                      ? darkTextBackgroundOpacityKey
                      : lightTextBackgroundOpacityKey;

                  double opacity = EzConfig.get(opacityKey);
                  Color background = EzConfig.colors.surface.withValues(
                    alpha: opacity,
                  );

                  return StatefulBuilder(
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
                          constraints: BoxConstraints(
                            maxWidth: ScreenSize.small.size,
                          ),
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
                              background = EzConfig.colors.surface.withValues(
                                alpha: opacity,
                              );
                            }),
                            onChangeEnd: (double value) =>
                                EzConfig.setDouble(opacityKey, value),
                          ),
                        ),
                        EzConfig.spacer,

                        // Local reset
                        EzElevatedIconButton(
                          onPressed: () async {
                            await EzConfig.remove(opacityKey);

                            setModal(() {
                              opacity = EzConfig.getDefault(opacityKey);
                              background = EzConfig.colors.surface.withValues(
                                alpha: opacity,
                              );
                            });
                          },
                          icon: const Icon(Icons.refresh),
                          label: EzConfig.l10n.gReset,
                        ),
                        EzSpacer(space: EzConfig.spacing * 1.5),
                      ],
                    ),
                  );
                },
              ),
              icon: const Icon(Icons.opacity),
              label: EzConfig.l10n.tsTextBackground,
            ),
            EzConfig.spacer,
          ],
          appName: appName,
          androidPackage: androidPackage,
        ),
        useImageDecoration: false,
      ),
      fabs: <Widget>[
        EzConfig.spacer,
        EzConfigFAB(
          context,
          appName: appName,
          androidPackage: androidPackage,
        ),
        EzConfig.spacer,
        const EzBackFAB(),
      ],
    );
  }
}
