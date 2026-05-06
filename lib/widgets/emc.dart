/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class ContactList extends StatefulWidget {
  final void Function() onUpdate;
  final bool fauxDisabled;

  const ContactList({
    super.key,
    required this.onUpdate,
    required this.fauxDisabled,
  });

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // Define custom functions //

  Future<void> addContact() async {
    await addEMC(context, loop: false);
    if (mounted) setState(() => currEMC = emc);
    widget.onUpdate.call();
  }

  // Return the build //

  List<String> currEMC = List<String>.from(emc);

  @override
  Widget build(BuildContext context) => EzCol(children: <Widget>[
        // Title && add button
        EzScrollView(
          reverseHands: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text(l10n.bsEMC, style: EzConfig.styles.titleLarge),
            EzConfig.rowMargin,
            EzIconButton(
              fauxDisabled: widget.fauxDisabled,
              icon: Icon(
                Icons.add_circle_outline,
                semanticLabel: l10n.bsAddHint,
              ),
              onPressed: addContact,
              onLongPress: widget.fauxDisabled ? openAppSettings : null,
              tooltip: l10n.bsAddHint,
            ),
          ],
        ),
        EzConfig.margin,

        // List of numbers (with remove buttons)
        emc.isEmpty
            ? EzTextButton(
                text: l10n.bsAddSomeone,
                onPressed: addContact,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(EzConfig.marginVal),
                  side: widget.fauxDisabled
                      ? null
                      : EzConfig.borderSide(
                          color: EzConfig.colors.primaryContainer.withValues(alpha: focusOpacity)),
                ),
                textStyle: EzConfig.styles.bodyLarge,
                textAlign: TextAlign.center,
              )
            : ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: heightOf(context) * 0.4,
                  maxWidth: widthOf(context) * 0.8,
                ),
                child: Card(
                  child: EzScrollView(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fauxDisabled: widget.fauxDisabled,
                          onRemove: () async {
                            currEMC.remove(contact);
                            await EzConfig.setStringList(emcKey, currEMC);
                            if (mounted) setState(() => currEMC = emc);
                            widget.onUpdate.call();
                          },
                        ),
                        EzSpacer(space: max(0, EzConfig.spacing - EzConfig.marginVal * 2)),
                      ]);

                      return acc;
                    }).sublist(0, currEMC.length * 2 - 1),
                    // Removes trailing spacer
                  ),
                ),
              ),
      ]);
}

class _ContactTile extends StatelessWidget {
  final String? initials;
  final String number;
  final bool fauxDisabled;
  final VoidCallback onRemove;

  const _ContactTile({
    super.key,
    required this.initials,
    required this.number,
    required this.fauxDisabled,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(EzConfig.marginVal),
        child: EzRow(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Initials coin (if available)
            if (initials != null) ...<Widget>[
              fauxDisabled
                  ? CircleAvatar(
                      radius: EzConfig.padding + EzConfig.iconSize / 2,
                      foregroundColor: EzConfig.colors.onSurface,
                      backgroundColor: EzConfig.colors.outline,
                      child: Text(
                        initials!,
                        style: EzConfig.styles.bodyLarge?.copyWith(
                          color: EzConfig.colors.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  : CircleAvatar(
                      radius: EzConfig.padding + EzConfig.iconSize / 2,
                      foregroundColor: EzConfig.colors.onSecondary,
                      backgroundColor: EzConfig.colors.secondary,
                      child: Text(
                        initials!,
                        style: EzConfig.styles.bodyLarge?.copyWith(
                          color: EzConfig.colors.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
              EzConfig.rowMargin,
            ],

            // Number
            Expanded(
              child: Text(
                number,
                style: fauxDisabled
                    ? EzConfig.styles.bodyLarge?.copyWith(color: EzConfig.colors.outline)
                    : EzConfig.styles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),

            // Remove button
            EzConfig.rowSpacer,
            EzIconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                semanticLabel: l10n.bsRemoveHint,
              ),
              onPressed: onRemove,
              tooltip: l10n.bsRemoveHint,
            ),
          ],
        ),
      );
}
