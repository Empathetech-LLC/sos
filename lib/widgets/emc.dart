/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ContactList extends StatefulWidget {
  final void Function() onUpdate;

  const ContactList(this.onUpdate, {super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<String> currEMC = List<String>.from(emc ?? <String>[]);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Title && add button
          EzScrollView(
            reverseHands: true,
            mainAxisSize: MainAxisSize.min,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Text(l10n.ssEMC, style: EzConfig.styles.titleLarge),
              EzConfig.rowMargin,
              EzIconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  semanticLabel: l10n.ssAddHint,
                ),
                onPressed: () async {
                  await addEMC(context, loop: false);
                  setState(() => currEMC = emc ?? currEMC);
                  widget.onUpdate.call();
                },
                tooltip: l10n.ssAddHint,
              ),
            ],
          ),
          EzConfig.margin,

          // List of numbers (with remove buttons)
          if (emc != null && emc!.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: heightOf(context) / 3),
              child: Card(
                child: EzScrollView(
                  mainAxisSize: MainAxisSize.min,
                  // Using fold w/ spacers bc map w/ padding looks weird with screen readers
                  children: currEMC.fold<List<Widget>>(<Widget>[], (
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

                    acc.addAll(<Widget>[
                      _ContactTile(
                        key: ValueKey<String>(contact),
                        initials: initials,
                        number: number,
                        onRemove: () async {
                          currEMC.remove(contact);
                          await EzConfig.setStringList(emcKey, currEMC);
                          setState(() => currEMC = emc ?? currEMC);
                          widget.onUpdate.call();
                        },
                      ),
                      EzSpacer(
                          space: EzConfig.spacing - EzConfig.marginVal * 2),
                    ]);

                    return acc;
                  }).sublist(0, currEMC.length * 2 - 1),
                  // Removes trailing spacer
                ),
              ),
            ),

          currEMC.isEmpty ? EzConfig.spacer : EzConfig.separator,
        ],
      );
}

class _ContactTile extends StatelessWidget {
  final String? initials;
  final String number;
  final VoidCallback onRemove;

  const _ContactTile({
    super.key,
    required this.initials,
    required this.number,
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
              EzConfig.rowMargin,
            ],

            // Number
            Text(
              number,
              style: EzConfig.styles.bodyLarge,
              textAlign: TextAlign.start,
            ),
            EzConfig.rowSpacer,

            // Remove button
            EzIconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                semanticLabel: l10n.ssRemoveHint,
              ),
              onPressed: onRemove,
              tooltip: l10n.ssRemoveHint,
            ),
          ],
        ),
      );
}
