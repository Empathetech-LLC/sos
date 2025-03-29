import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'lang_en.dart' deferred as lang_en;
import 'lang_es.dart' deferred as lang_es;
import 'lang_fr.dart' deferred as lang_fr;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Lang
/// returned by `Lang.of(context)`.
///
/// Applications need to include `Lang.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/lang.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Lang.localizationsDelegates,
///   supportedLocales: Lang.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Lang.supportedLocales
/// property.
abstract class Lang {
  Lang(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Lang? of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  static const LocalizationsDelegate<Lang> delegate = _LangDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @gOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get gOk;

  /// No description provided for @hsSOSHint.
  ///
  /// In en, this message translates to:
  /// **'Start sharing location'**
  String get hsSOSHint;

  /// No description provided for @hsSafeCloseHint.
  ///
  /// In en, this message translates to:
  /// **'All clear\nClose the app without SOS'**
  String get hsSafeCloseHint;

  /// No description provided for @hsCameraHint.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get hsCameraHint;

  /// No description provided for @hsRecordHint.
  ///
  /// In en, this message translates to:
  /// **'Record a video'**
  String get hsRecordHint;

  /// No description provided for @hsBTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.'**
  String get hsBTutorial;

  /// No description provided for @hsSTutorial.
  ///
  /// In en, this message translates to:
  /// **'You can...\n\n- Add more emergency contacts\n- Customize the SOS message\n- Enable automatic SOS\n- Change the app\'s appearance\n\nand more in the settings.'**
  String get hsSTutorial;

  /// No description provided for @hsRTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or finish a video, you will be asked to share it.\n\nIf a video is interrupted, SOS will activate automatically.'**
  String get hsRTutorial;

  /// No description provided for @hsNoNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact does not have a phone number'**
  String get hsNoNumber;

  /// No description provided for @ssSOSOnOpen.
  ///
  /// In en, this message translates to:
  /// **'Auto SOS on open'**
  String get ssSOSOnOpen;

  /// No description provided for @ssSOSOnClose.
  ///
  /// In en, this message translates to:
  /// **'Auto SOS on close'**
  String get ssSOSOnClose;

  /// No description provided for @ssVideoSOS.
  ///
  /// In en, this message translates to:
  /// **'Auto SOS on interrupted recording'**
  String get ssVideoSOS;

  /// No description provided for @ssSOSFrequency.
  ///
  /// In en, this message translates to:
  /// **'SOS Frequency'**
  String get ssSOSFrequency;

  /// No description provided for @ssSOSMessage.
  ///
  /// In en, this message translates to:
  /// **'SOS Message'**
  String get ssSOSMessage;

  /// No description provided for @ssEMC.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get ssEMC;
}

class _LangDelegate extends LocalizationsDelegate<Lang> {
  const _LangDelegate();

  @override
  Future<Lang> load(Locale locale) {
    return lookupLang(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_LangDelegate old) => false;
}

Future<Lang> lookupLang(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return lang_en.loadLibrary().then((dynamic _) => lang_en.LangEn());
    case 'es':
      return lang_es.loadLibrary().then((dynamic _) => lang_es.LangEs());
    case 'fr':
      return lang_fr.loadLibrary().then((dynamic _) => lang_fr.LangFr());
  }

  throw FlutterError(
      'Lang.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
