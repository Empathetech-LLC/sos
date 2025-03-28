/* sos
 * Copyright (c) 2025 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

// import './export.dart';

// import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:empathetech_flutter_ui/empathetech_flutter_ui.dart';

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

// const MethodChannel _channel = MethodChannel('sos');

void sendSOS() async {
  debugPrint('CAW SOS CAW');

  // final String sos = EzConfig.get(customSOSKey) ?? 'SOS';
  // final String pos = await getCoordinates();

  // final List<String> emc = EzConfig.get('recipients') ??
  //     <String>['NUMBER']; // Change to exit on null when ready

  // await _channel.invokeMethod('sendSMS', <String, String>{
  //   'message': '$sos\n$pos',
  //   'recipients': emc.join(','),
  // });
}
