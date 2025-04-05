/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sos/utils/consts.dart';

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
    final bool isLefty = EzConfig.get(isLeftyKey);

    final EzIconButton remove = EzIconButton(
      icon: Icon(PlatformIcons(context).removeCircledOutline),
      enabled: enabled,
      onPressed: onRemove,
      tooltip: 'Remove',
    );

    return ListTile(
      leading: isLefty ? remove : null,
      title: Text(number, style: Theme.of(context).textTheme.bodyLarge),
      trailing: isLefty ? null : remove,
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<String> emc = EzConfig.get(emcKey);
  late final TextTheme textTheme = Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Emergency Contacts',
            style: textTheme.titleLarge,
          ),
          EzMargin(),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: EzConfig.get(marginKey),
              ),
              height: ezTextSize(
                    '(000) 000-0000',
                    context: context,
                    style: textTheme.bodyLarge,
                  ).height *
                  5,
              width: double.infinity,
              child: EzScrollView(
                children: <Widget>[
                  for (final String number in emc)
                    ContactTile(
                      key: ValueKey<String>(number),
                      number: number,
                      enabled: emc.length > 1,
                      onRemove: () async {
                        emc.remove(number);
                        await EzConfig.setStringList(emcKey, emc);
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      );
}
