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

  /// No description provided for @hsNeedContacts.
  ///
  /// In en, this message translates to:
  /// **'SOS needs access to your contacts to function properly.'**
  String get hsNeedContacts;

  /// No description provided for @hsNeedLocation.
  ///
  /// In en, this message translates to:
  /// **'SOS needs access to your location to function properly.'**
  String get hsNeedLocation;

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

  /// No description provided for @hsWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to SOS'**
  String get hsWelcome;

  /// No description provided for @hsAppTutorial.
  ///
  /// In en, this message translates to:
  /// **'This app is designed to share your location with emergency contacts in a moment of crisis.\n\nPlease choose your first emergency contact.\nThey must have a phone number.\n\nJust one for now, you can add more later.'**
  String get hsAppTutorial;

  /// No description provided for @hsCameraTutorial.
  ///
  /// In en, this message translates to:
  /// **'SOS can also help share evidence.\n\nThe app will ask you for camera, microphone, and gallery access so it can take and save photos and videos.\n\nThis is recommended, but optional.'**
  String get hsCameraTutorial;

  /// No description provided for @hsBroadcastTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.'**
  String get hsBroadcastTutorial;

  /// No description provided for @hsSettingsTutorial.
  ///
  /// In en, this message translates to:
  /// **'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n- Change the app\'s appearance\n\n in the settings.\n\nHold the settings button to give feedback for the app.'**
  String get hsSettingsTutorial;

  /// No description provided for @hsVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with one that shows you your rights.'**
  String get hsVideoTutorial;

  /// No description provided for @hsRightsTutorial.
  ///
  /// In en, this message translates to:
  /// **'While the camera is disabled, you can still hide/show a list of your rights.\n\nIf you enable the camera, and take a picture or record a video, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.'**
  String get hsRightsTutorial;

  /// No description provided for @hsNoNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact does not have a phone number'**
  String get hsNoNumber;

  /// No description provided for @rsSharedHeader.
  ///
  /// In en, this message translates to:
  /// **'You have the right to...'**
  String get rsSharedHeader;

  /// No description provided for @rsSharedFingerprint.
  ///
  /// In en, this message translates to:
  /// **'- Refuse to be fingerprinted by ICE unless you are under arrest.'**
  String get rsSharedFingerprint;

  /// No description provided for @rsWalkLeave.
  ///
  /// In en, this message translates to:
  /// **'- Leave if you are not under arrest.'**
  String get rsWalkLeave;

  /// No description provided for @rsDriveSearch.
  ///
  /// In en, this message translates to:
  /// **'- Refuse a search of your car.'**
  String get rsDriveSearch;

  /// No description provided for @rsDrivePockets.
  ///
  /// In en, this message translates to:
  /// **'- Refuse a search of your pockets. ICE can give a pat-down, but not a search.'**
  String get rsDrivePockets;

  /// No description provided for @rsDriveWarrant.
  ///
  /// In en, this message translates to:
  /// **'- Ask if the officers have a warrant. You have the right to see it if they do.'**
  String get rsDriveWarrant;

  /// No description provided for @rsDriveID.
  ///
  /// In en, this message translates to:
  /// **'- Refuse to provide ID as a passenger. Only the driver is required to provide ID'**
  String get rsDriveID;

  /// No description provided for @rsDriveQuestion.
  ///
  /// In en, this message translates to:
  /// **'- Ask questions. Find out why you are being stopped.'**
  String get rsDriveQuestion;

  /// No description provided for @rsDriveLeave.
  ///
  /// In en, this message translates to:
  /// **'- Leave if you are not under arrest.'**
  String get rsDriveLeave;

  /// No description provided for @rsDriveRemainSilent.
  ///
  /// In en, this message translates to:
  /// **'- Remain silent. You do not have to answer of their questions.\nYou cannot lie or resist arrest, but you do not have to tell them anything.'**
  String get rsDriveRemainSilent;

  /// No description provided for @rsHomeWarrant.
  ///
  /// In en, this message translates to:
  /// **'- Keep you door shut. If they have a warrant, ask them to slip it under the door first.'**
  String get rsHomeWarrant;

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

  /// No description provided for @ssSOSOnCloseHint.
  ///
  /// In en, this message translates to:
  /// **'When enabled, a safe close button will be shown opposite the settings.'**
  String get ssSOSOnCloseHint;

  /// No description provided for @ssVideoSOS.
  ///
  /// In en, this message translates to:
  /// **'Auto SOS on interrupted recording'**
  String get ssVideoSOS;

  /// No description provided for @ssVideoSOSHint.
  ///
  /// In en, this message translates to:
  /// **'Enable for continuos texts, disable for a single text.'**
  String get ssVideoSOSHint;

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
