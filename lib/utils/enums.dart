/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';

// Location (services) //

enum LinkType { google, apple, waze, raw }

const String _google = 'google';
const String _apple = 'apple';
const String _waze = 'waze';
const String _raw = 'raw';

extension LinkConfig on LinkType {
  String get name {
    switch (this) {
      case LinkType.google:
        return _google;
      case LinkType.apple:
        return _apple;
      case LinkType.waze:
        return _waze;
      case LinkType.raw:
        return _raw;
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

  static LinkType lookup(String name) {
    switch (name) {
      case _apple:
        return LinkType.apple;
      case _waze:
        return LinkType.waze;
      case _raw:
        return LinkType.raw;
      default:
        return LinkType.google;
    }
  }
}

// Location (user rights) //

enum Location { walking, driving, home }

/// atHome
const String atHomeTab = 'atHome';

/// driving
const String drivingTab = 'driving';

/// walking
const String walkingTab = 'walking';

extension LocationConfig on Location {
  IconData get icon {
    switch (this) {
      case Location.walking:
        return Icons.directions_walk;
      case Location.driving:
        return Icons.drive_eta;
      case Location.home:
        return Icons.home;
    }
  }

  String get name {
    switch (this) {
      case Location.walking:
        return walkingTab;
      case Location.driving:
        return drivingTab;
      case Location.home:
        return atHomeTab;
    }
  }

  static Location lookup(String? tab) {
    switch (tab) {
      case drivingTab:
        return Location.driving;
      case atHomeTab:
        return Location.home;
      default:
        return Location.walking;
    }
  }
}
