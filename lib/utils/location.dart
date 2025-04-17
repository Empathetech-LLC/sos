/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

Future<String> getCoordinates({
  required String denied,
  required String disabled,
  required String error,
}) async {
  try {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return disabled;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Changeably denied, ask again
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return denied;
      }
    } else if (permission == LocationPermission.deniedForever) {
      // Permanently denied
      return denied;
    }

    final Position pos = await Geolocator.getCurrentPosition();
    return 'https://www.google.com/maps?q=${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
  } catch (e) {
    ezLog('Error getting coordinates');
    ezLog(e.toString());
    return error;
  }
}

const MethodChannel platform = MethodChannel('net.empathetech.sos/broadcast');

void sendSOS({
  required List<String>? emc,
  required String denied,
  required String disabled,
  required String error,
}) async {
  if (emc == null || emc.isEmpty) return;

  final Map<String, dynamic> mapData = <String, dynamic>{};
  mapData['message'] = 'SOS\n${await getCoordinates(
    denied: denied,
    disabled: disabled,
    error: error,
  )}';

  try {
    if (isApple()) {
      mapData['recipients'] = emc;
    } else {
      mapData['recipients'] = emc.join(';');
    }

    ezLog('SOS');
    ezLog(mapData.toString());
    platform.invokeMethod<void>('sendSOS', mapData);
  } catch (e) {
    ezLog('Error sending SOS: $e');
  }
}

const String broadcastName = 'broadcast';
const String broadcastTask = 'broadcastTask';

/// Register [broadcastTask] (aka [sendSOS]) with [Workmanager]
Future<void> backgroundSOS(
  List<String> emc, {
  required String denied,
  required String disabled,
  required String error,
}) =>
    Workmanager().registerOneOffTask(
      broadcastName,
      broadcastTask,
      inputData: <String, dynamic>{
        'emc': emc,
        'denied': denied,
        'disabled': disabled,
        'error': error,
      },
    );
