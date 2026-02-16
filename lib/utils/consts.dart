/* sos
 * Copyright (c) 2026 Empathetech LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/services.dart';

// App config //

/// InstaSOS
const String appName = 'InstaSOS';

/// net.empathetech.sos
const String androidPackage = 'net.empathetech.sos';

/// [androidPackage]/broadcast
const MethodChannel platform = MethodChannel('$androidPackage/broadcast');

// Local assets //

/// assets/images/og-baddie.jpg
const String ladyLiberty = 'assets/images/og-baddie.jpg';

/// [ladyLiberty]
const Set<String> assetPaths = <String>{ladyLiberty};

/// [ladyLiberty]
const Map<String, String> credits = <String, String>{
  ladyLiberty: 'Public domain; CC0 1.0 Universal',
};

// Runtime //

/// :
const String contactSplit = ':';

/// https://www.aclu.org/know-your-rights
const String acluLink = 'https://www.aclu.org/know-your-rights';

/// https://www.immdef.org/resources
const String immdefLink = 'https://www.immdef.org/resources';

/// https://dunkthevote4ever.org/project/the-black-book-know-your-rights/
const String dunkLink =
    'https://dunkthevote4ever.org/project/the-black-book-know-your-rights/';

/// https://lab.witness.org/projects/eyes-on-ice/
const String howToLink = 'https://lab.witness.org/projects/eyes-on-ice/';

/// https://www.empathetech.net/#/contribute
const String contributeLink = 'https://www.empathetech.net/#/contribute';
