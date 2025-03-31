/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

Future<String> getCoordinates() async {
  final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return 'Cannot access location (disabled)';

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Changeably denied, ask again
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return 'Cannot access location (denied)';
    }
  } else if (permission == LocationPermission.deniedForever) {
    // Permanently denied
    return 'Cannot access location (denied)';
  }

  final Position pos = await Geolocator.getCurrentPosition();
  return pos.toString();
}

void sendSOS() => debugPrint('CAW SOS CAW');

/// Register [broadcastTask] (aka [sendSOS]) with [Workmanager]
Future<dynamic> startBroadcast() {
  return Workmanager().registerPeriodicTask(
    broadcastTask,
    broadcastTask,
    frequency: const Duration(seconds: 3),
  );
}
