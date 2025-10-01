/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContactTile extends StatelessWidget {
  final String number;
  final bool enabled;
  final VoidCallback onRemove;

  const ContactTile({
    super.key,
    required this.number,
    required this.enabled,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final Lang l10n = Lang.of(context)!;
    final EFUILang el10n = ezL10n(context);

    return EzScrollView(
      mainAxisSize: MainAxisSize.min,
      scrollDirection: Axis.horizontal,
      reverseHands: true,
      children: <Widget>[
        Text(number, style: Theme.of(context).textTheme.bodyLarge),
        const EzSpacer(vertical: false),
        EzIconButton(
          icon: Icon(
            PlatformIcons(context).removeCircledOutline,
            semanticLabel:
                '${l10n.ssRemoveHint}.${enabled ? '' : ' ${el10n.gDisabled}.'}',
          ),
          enabled: enabled,
          onPressed: onRemove,
          tooltip: l10n.ssRemoveHint,
        )
      ],
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // Gather the fixed theme data //

  final double margin = EzConfig.get(marginKey);
  final double padding = EzConfig.get(paddingKey);
  final double spacing = EzConfig.get(paddingKey);

  final double iconSize = EzConfig.get(iconSizeKey);

  late final Lang l10n = Lang.of(context)!;

  // Define build data //

  List<String> emc = EzConfig.get(emcKey);
  late int heightMod = min(5, emc.length);

  late final Size numSize = ezTextSize(
    '+44 (444) 444-4444',
    context: context,
    style: Theme.of(context).textTheme.bodyLarge,
  );

  late final double listWidth = 2 * margin +
      max(iconSize + padding, kMinInteractiveDimension) +
      numSize.width +
      spacing;

  // Define custom functions //

  double listHeight() => max(
      margin +
          (padding + numSize.height) * heightMod +
          spacing * (heightMod - 1),
      2 * margin + kMinInteractiveDimension);

  // Return the build //

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Title && add button
        EzScrollView(
          scrollDirection: Axis.horizontal,
          reverseHands: true,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(l10n.ssEMC, style: textTheme.titleLarge),
            ezMargin,
            EzIconButton(
              icon: Icon(
                PlatformIcons(context).addCircledOutline,
                semanticLabel: l10n.ssAddHint,
              ),
              onPressed: () async {
                emc = await addEMC(context, emc, loop: false) ?? emc;
                setState(() => heightMod = min(5, emc.length));
              },
              tooltip: l10n.ssAddHint,
            ),
          ],
        ),
        ezMargin,

        // List of numbers (with remove buttons)
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: listHeight(),
            maxWidth: listWidth,
          ),
          child: Card(
            child: Center(
              child: EzScrollView(
                mainAxisAlignment: MainAxisAlignment.center,
                children: emc
                    .map((String number) => ContactTile(
                          key: ValueKey<String>(number),
                          number: number,
                          enabled: emc.length > 1,
                          onRemove: () async {
                            emc.remove(number);
                            heightMod = min(5, emc.length);
                            await EzConfig.setStringList(emcKey, emc);
                            setState(() {});
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
