/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // Gather the fixed theme data //

  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double iconSize = EzConfig.get(iconSizeKey);

  late final Lang l10n = Lang.of(context)!;
  late final EFUILang el10n = ezL10n(context);

  // Return the build //

  List<String> emc = EzConfig.get(emcKey);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Title && add button
        EzScrollView(
          reverseHands: true,
          mainAxisSize: MainAxisSize.min,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text(l10n.ssEMC, style: textTheme.titleLarge),
            ezRowMargin,
            EzIconButton(
              icon: Icon(
                PlatformIcons(context).addCircledOutline,
                semanticLabel: l10n.ssAddHint,
              ),
              onPressed: () async {
                emc = await addEMC(context, emc, loop: false) ?? emc;
                setState(() {});
              },
              tooltip: l10n.ssAddHint,
            ),
          ],
        ),
        ezMargin,

        // List of numbers (with remove buttons)
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: heightOf(context) / 3),
          child: Card(
            child: EzScrollView(
              mainAxisSize: MainAxisSize.min,
              children: emc.length > 1
                  ? emc.fold<List<Widget>>(
                      <Widget>[],
                      (List<Widget> acc, String contact) {
                        acc.add(_ContactTile(
                          key: ValueKey<String>(contact),
                          initials: 'MW', // TODO: for realz
                          number: contact,
                          enabled: emc.length > 1,
                          onRemove: () async {
                            emc.remove(contact);
                            await EzConfig.setStringList(emcKey, emc);
                            setState(() {});
                          },
                          l10n: l10n,
                          el10n: el10n,
                          textTheme: textTheme,
                          colorScheme: colorScheme,
                          margin: margin,
                          padding: padding,
                          iconSize: iconSize,
                        ));
                        acc.add(ezSpacer);
                        return acc;
                      },
                    )
                  : <Widget>[
                      _ContactTile(
                        initials: 'MW', // TODO: ditto
                        number: emc.first,
                        enabled: false,
                        onRemove: doNothing,
                        l10n: l10n,
                        el10n: el10n,
                        textTheme: textTheme,
                        colorScheme: colorScheme,
                        margin: margin,
                        padding: padding,
                        iconSize: iconSize,
                      ),
                    ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactTile extends StatelessWidget {
  final String initials;
  final String number;
  final bool enabled;
  final VoidCallback onRemove;
  final Lang l10n;
  final EFUILang el10n;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final double margin;
  final double padding;
  final double iconSize;

  const _ContactTile({
    super.key,
    // Core parameters
    required this.initials,
    required this.number,
    required this.enabled,
    required this.onRemove,

    // Theme parameters
    required this.l10n,
    required this.el10n,
    required this.textTheme,
    required this.colorScheme,
    required this.margin,
    required this.padding,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: margin),
        child: EzScrollView(
          reverseHands: true,
          showScrollHint: true,
          mainAxisSize: MainAxisSize.min,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ezRowMargin,
            CircleAvatar(
              radius: padding + iconSize / 2,
              foregroundColor: colorScheme.onSurface,
              backgroundColor: colorScheme.surfaceContainer,
              child: Text(
                initials,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            ezRowMargin,
            Text(number,
                style: textTheme.bodyLarge, textAlign: TextAlign.start),
            ezRowSpacer,
            EzIconButton(
              icon: Icon(
                PlatformIcons(context).removeCircledOutline,
                semanticLabel:
                    '${l10n.ssRemoveHint}.${enabled ? '' : ' ${el10n.gDisabled}.'}',
              ),
              enabled: enabled,
              onPressed: onRemove,
              tooltip: l10n.ssRemoveHint,
            ),
            ezRowMargin,
          ],
        ),
      );
}
