/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

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

  final Position pos = await Geolocator.getCurrentPosition();
  return pos.toString();
}

const MethodChannel platform = MethodChannel('net.empathetech.sos/broadcast');

void sendSOS({
  required List<String>? emc,
  required Lang l10n,
}) {
  if (emc == null || emc.isEmpty) return;

  final Map<String, dynamic> mapData = <String, dynamic>{};
  mapData['message'] = 'SOS\n${getCoordinates(l10n)}';

  try {
    if (isCupertino()) {
      mapData['recipients'] = emc;
    } else {
      mapData['recipients'] = emc.join(';');
    }

    platform.invokeMethod<void>('sendSOS', mapData);
  } catch (e) {
    ezLog('Error sending SOS: $e');
  }
}

/// Register [broadcastTask] (aka [sendSOS]) with [Workmanager]
Future<void> runBackgroundBroadcast() =>
    Workmanager().registerPeriodicTask(broadcastTask, broadcastTask);
