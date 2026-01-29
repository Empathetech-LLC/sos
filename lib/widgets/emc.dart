/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // Define the build data //

  List<String> emc = EzConfig.get(emcKey);

  // Return the build //

  @override
  Widget build(BuildContext context) {
    final EzSpacer listSpacer =
        EzSpacer(space: EzConfig.spacing - EzConfig.marginVal * 2);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Title && add button
        EzScrollView(
          reverseHands: true,
          mainAxisSize: MainAxisSize.min,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text(l10n.ssEMC, style: EzConfig.styles.titleLarge),
            EzMargin(vertical: false),
            EzIconButton(
              icon: Icon(
                Icons.add_circle_outline,
                semanticLabel: l10n.ssAddHint,
              ),
              onPressed: () async {
                emc =
                    await addEMC(context, emc, loop: false, l10n: l10n) ?? emc;
                setState(() {});
              },
              tooltip: l10n.ssAddHint,
            ),
          ],
        ),
        EzConfig.margin,

        // List of numbers (with remove buttons)
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: heightOf(context) / 3),
          child: Card(
            child: EzScrollView(
              mainAxisSize: MainAxisSize.min,
              children: emc.fold<List<Widget>>(<Widget>[], (
                List<Widget> acc,
                String contact,
              ) {
                final List<String> parts = contact.split(contactSplit);
                late final String? initials;
                late final String number;

                if (parts.length == 2) {
                  initials = parts.first;
                  number = parts.last;
                } else {
                  initials = null;
                  number = contact;
                }

                acc.add(_ContactTile(
                  key: ValueKey<String>(contact),
                  initials: initials,
                  number: number,
                  enabled: emc.length > 1,
                  onRemove: () async {
                    emc.remove(contact);
                    await EzConfig.setStringList(emcKey, emc);
                    setState(() {});
                  },
                ));
                acc.add(listSpacer);
                return acc;
              }).sublist(0, emc.length * 2 - 1), // Remove trailing spacer
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactTile extends StatelessWidget {
  final String? initials;
  final String number;
  final bool enabled;
  final VoidCallback onRemove;

  const _ContactTile({
    super.key,
    required this.initials,
    required this.number,
    required this.enabled,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(EzConfig.marginVal),
        child: EzScrollView(
          reverseHands: true,
          showScrollHint: true,
          mainAxisSize: MainAxisSize.min,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            // Initials coin (if available)
            if (initials != null) ...<Widget>[
              CircleAvatar(
                radius: EzConfig.padding + EzConfig.iconSize / 2,
                foregroundColor: EzConfig.colors.onSurface,
                backgroundColor: EzConfig.colors.surfaceContainer,
                child: Text(
                  initials!,
                  style: EzConfig.styles.bodyLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              EzMargin(vertical: false),
            ],

            // Number
            Text(
              number,
              style: EzConfig.styles.bodyLarge,
              textAlign: TextAlign.start,
            ),
            const EzSpacer(vertical: false),

            // Remove button
            EzIconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                semanticLabel:
                    '${l10n.ssRemoveHint}.${enabled ? '' : ' ${EzConfig.l10n.gDisabled}.'}',
              ),
              enabled: enabled,
              onPressed: onRemove,
              tooltip: l10n.ssRemoveHint,
            ),
          ],
        ),
      );
}
