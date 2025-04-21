/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import '../utils/export.dart';

import 'package:flutter/material.dart';

class SOSIcon extends StatefulWidget {
  const SOSIcon({super.key});

  @override
  State<SOSIcon> createState() => _PulsingIconWidgetState();
}

class _PulsingIconWidgetState extends State<SOSIcon>
    with SingleTickerProviderStateMixin {
  // Define the animation data //

  late AnimationController controller;
  late Animation<double> breathe;

  // Init //

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    breathe = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.repeat(reverse: true);
  }

  // Return the build //

  @override
  Widget build(BuildContext context) {
    final Lang l10n = Lang.of(context)!;

    return AnimatedBuilder(
      animation: breathe,
      builder: (_, __) => Icon(
        breathe.value < 0.5 ? Icons.notifications : Icons.notifications_active,
        semanticLabel: l10n.hsEndSOS,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
