/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import './export.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_sms/flutter_sms.dart';
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

// Not gonna work, relies on external apps
void sendSOS({
  required List<String>? emc,
  required Lang l10n,
  required bool isAndroid,
}) {
  if (emc == null || emc.isEmpty) return;

  final String message = 'SOS\n${getCoordinates(l10n)}';

  try {
    if (isAndroid) {
      sendSMS(message: message, recipients: emc, sendDirect: true);
    } else {
      debugPrint(message);
    }
  } catch (e) {
    ezLog('Error sending SOS: $e');
  }
}

/// Register [broadcastTask] (aka [sendSOS]) with [Workmanager]
Future<void> runBackgroundBroadcast() =>
    Workmanager().registerPeriodicTask(broadcastTask, broadcastTask);
