/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getCoordinates() async {
  final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return 'Cannot access location (disabled)';

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return 'Cannot access location (denied)';
    }
  } else if (permission == LocationPermission.deniedForever) {
    return 'Cannot access location (denied)';
  }

  final Position pos = await Geolocator.getCurrentPosition();
  return pos.toString();
}

void sendSOS() => debugPrint('CAW SOS CAW');
