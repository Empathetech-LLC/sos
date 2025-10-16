/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../../utils/export.dart';
import '../../widgets/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DesignSettingsScreen extends StatelessWidget {
  const DesignSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Lang l10n = Lang.of(context)!;
    final EFUILang el10n = ezL10n(context);

    return SosScaffold(
      EzScreen(
        EzDesignSettings(
          includeBackgroundImage: false,
          themedSettingsPrepend: <Widget>[
            // Text Background Opacity mirror
            EzElevatedIconButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  builder: (_) {
                    final bool isDark = isDarkTheme(context);
                    final ColorScheme colorScheme =
                        Theme.of(context).colorScheme;

                    final String opacityKey = isDark
                        ? darkTextBackgroundOpacityKey
                        : lightTextBackgroundOpacityKey;

                    double opacity = EzConfig.get(opacityKey);
                    Color background =
                        colorScheme.surface.withValues(alpha: opacity);

                    return StatefulBuilder(
                      builder: (_, StateSetter setModal) => EzScrollView(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Preview
                          Container(
                            width: double.infinity,
                            height: heightOf(context) * 0.667,
                            color: colorScheme.surface,
                            child: Stack(children: <Widget>[
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
                            ]),
                          ),
                          ezSpacer,

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
                                background = colorScheme.surface
                                    .withValues(alpha: opacity);
                              }),
                              onChangeEnd: (double value) =>
                                  EzConfig.setDouble(opacityKey, value),
                            ),
                          ),
                          ezSpacer,

                          // Local reset
                          EzElevatedIconButton(
                            onPressed: () async {
                              await EzConfig.remove(opacityKey);

                              setModal(() {
                                opacity = EzConfig.getDefault(opacityKey);
                                background = colorScheme.surface
                                    .withValues(alpha: opacity);
                              });
                            },
                            icon: EzIcon(PlatformIcons(context).refresh),
                            label: el10n.gReset,
                          ),
                          EzSpacer(space: EzConfig.get(spacingKey) * 1.5),
                        ],
                      ),
                    );
                  }),
              icon: const Icon(Icons.opacity),
              label: el10n.tsTextBackground,
            ),
            ezSpacer,
          ],
        ),
        useImageDecoration: false,
      ),
      fabs: <Widget>[
        ezSpacer,
        EzConfigFAB(
          context,
          appName: appName,
          androidPackage: packageName,
        ),
        ezSpacer,
        EzBackFAB(context),
      ],
    );
  }
}
