/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

enum LinkType {
  google,
  apple,
  waze,
  raw,
}

extension LinkConfig on LinkType {
  String get name {
    switch (this) {
      case LinkType.google:
        return 'google';
      case LinkType.apple:
        return 'apple';
      case LinkType.waze:
        return 'waze';
      case LinkType.raw:
        return 'raw';
    }
  }

  String get label {
    switch (this) {
      case LinkType.google:
        return 'Google Maps';
      case LinkType.apple:
        return 'Apple Maps';
      case LinkType.waze:
        return 'Waze';
      case LinkType.raw:
        return 'Coordinates';
    }
  }

  String get base {
    switch (this) {
      case LinkType.google:
        return 'https://www.google.com/maps?q=';
      case LinkType.apple:
        return 'https://maps.apple.com/?ll=';
      case LinkType.waze:
        return 'https://waze.com/ul?ll=';
      case LinkType.raw:
        return '';
    }
  }
}

/// Gets coordinates from [Geolocator]
/// Returns the coordinates injected into a Google Maps URL
/// Includes error handling
Future<String> getCoordinates(Lang l10n) async {
  final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return l10n.sosDisabled;

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Changeably denied, ask again
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return l10n.sosDenied;
    }
  } else if (permission == LocationPermission.deniedForever) {
    // Permanently denied
    return l10n.sosDenied;
  }

  try {
    ezLog('Building maps link');
    final Position pos = await Geolocator.getCurrentPosition();
    return 'https://www.google.com/maps?q=${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
  } catch (e) {
    ezLog('Error getting coordinates');
    ezLog(e.toString());
    return l10n.sosError;
  }
}

const MethodChannel platform = MethodChannel('$packageName/broadcast');

/// Call the [MethodChannel] to send a foregroundSOS
/// Includes error handling
Future<void> foregroundSOS(List<String>? emc, Lang l10n) async {
  if (emc == null || emc.isEmpty) return;

  final Map<String, dynamic> mapData = <String, dynamic>{};

  if (isApple()) {
    mapData['recipients'] = emc;
  } else {
    mapData['recipients'] = emc.join(';');
  }
  mapData['message'] = 'SOS\n${await getCoordinates(l10n)}';

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
/// Does not include error handling
Future<void> backgroundSOS(List<String> emc, Lang l10n) =>
    platform.invokeMethod<void>(
      'backgroundSOS',
      <String, dynamic>{
        'recipients': emc.join(';'),
        'heading': 'SOS - ${l10n.sosLastKnown}',
      },
    );

/// Also Android only
/// Cancel [backgroundSOS]
/// Dos not include error handling
Future<void> cancelBackgroundSOS() =>
    platform.invokeMethod<void>('cancelBackgroundSOS');
