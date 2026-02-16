/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

// Functions //

/// Gets coordinates from [Geolocator]
/// Returns the coordinates injected into a Google Maps URL
/// Includes error handling
Future<String> getCoordinates(String linkBase) async {
  final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return l10n.sosDisabled;

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) return l10n.sosDenied;

  if (permission == LocationPermission.denied) {
    // Changeably denied, ask again
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return l10n.sosDenied;
    }
  }

  try {
    ezLog('Building maps link');
    final Position pos = await Geolocator.getCurrentPosition();
    return '$linkBase${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
  } catch (e) {
    ezLog('Error getting coordinates');
    ezLog(e.toString());
    return l10n.sosError;
  }
}

/// Call the [MethodChannel] to send a foregroundSOS
/// Includes error handling
Future<void> foregroundSOS() async {
  final List<String> currEMC = List<String>.from(emc ?? <String>[]);
  if (currEMC.isEmpty) return;

  final List<String> numbers = currEMC
      .map((String contact) => contact.split(contactSplit).last)
      .toList();

  final Map<String, dynamic> mapData = <String, dynamic>{
    'message': 'SOS\n${await getCoordinates(linkType.base)}',
    'recipients': isIOS ? numbers : numbers.join(';'),
  };

  ezLog('Sending SOS (foreground)');
  ezLog(mapData.toString());

  try {
    await platform.invokeMethod<void>('foregroundSOS', mapData);
  } catch (e) {
    ezLog(e.toString());
  }
}

/// Currently Android only
/// Call a custom worker factory to send periodic SOS messages
/// Does NOT include error handling
Future<void> backgroundSOS() async {
  final List<String> currEMC = List<String>.from(emc ?? <String>[]);
  if (currEMC.isEmpty) return;

  final List<String> numbers = currEMC
      .map((String contact) => contact.split(contactSplit).last)
      .toList();

  await platform.invokeMethod<void>(
    'backgroundSOS',
    <String, dynamic>{
      'recipients': numbers.join(';'),
      'heading': 'SOS - ${l10n.sosLastKnown}',
    },
  );
}

/// Also Android only
/// Cancel [backgroundSOS]
/// Does NOT include error handling
Future<void> cancelBackgroundSOS() =>
    platform.invokeMethod<void>('cancelBackgroundSOS');
