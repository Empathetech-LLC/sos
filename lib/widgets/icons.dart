/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

class SOSIcon extends StatefulWidget {
  const SOSIcon({super.key});

  @override
  State<SOSIcon> createState() => _PulsingIconWidgetState();
}

class _PulsingIconWidgetState extends State<SOSIcon>
    with SingleTickerProviderStateMixin {
  // Define the build data //

  late AnimationController _controller;
  late Animation<double> _animation;

  final IconData inactive = Icons.notifications;
  final IconData active = Icons.notifications_active;

  // Init //

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() => setState(() {}));
  }

  // Return the build //

  @override
  Widget build(BuildContext context) =>
      EzIcon(_animation.value < 0.5 ? inactive : active);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
