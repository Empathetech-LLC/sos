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

  /// No description provided for @sosNeedSMS.
  ///
  /// In en, this message translates to:
  /// **'SOS needs SMS permission to function properly.'**
  String get sosNeedSMS;

  /// No description provided for @sosDisabled.
  ///
  /// In en, this message translates to:
  /// **'Cannot access location (disabled)'**
  String get sosDisabled;

  /// No description provided for @sosDenied.
  ///
  /// In en, this message translates to:
  /// **'Cannot access location (denied)'**
  String get sosDenied;

  /// No description provided for @hsStartSOS.
  ///
  /// In en, this message translates to:
  /// **'Activate to start SOS broadcast.'**
  String get hsStartSOS;

  /// No description provided for @hsEndSOS.
  ///
  /// In en, this message translates to:
  /// **'SOS is broadcasting. Activate to stop.'**
  String get hsEndSOS;

  /// No description provided for @hsSafeCloseHint.
  ///
  /// In en, this message translates to:
  /// **'All clear. Close the app without SOS.'**
  String get hsSafeCloseHint;

  /// No description provided for @hsCameraHint.
  ///
  /// In en, this message translates to:
  /// **'Take a photo.'**
  String get hsCameraHint;

  /// No description provided for @hsPreviewHint.
  ///
  /// In en, this message translates to:
  /// **'Long press to toggle your rights view.'**
  String get hsPreviewHint;

  /// No description provided for @hsShowRights.
  ///
  /// In en, this message translates to:
  /// **'Show your rights.'**
  String get hsShowRights;

  /// No description provided for @hsHideRights.
  ///
  /// In en, this message translates to:
  /// **'Hide your rights.'**
  String get hsHideRights;

  /// No description provided for @hsStartRecord.
  ///
  /// In en, this message translates to:
  /// **'Record a video.'**
  String get hsStartRecord;

  /// No description provided for @hsEndRecord.
  ///
  /// In en, this message translates to:
  /// **'End the recording.'**
  String get hsEndRecord;

  /// No description provided for @hsFlashOff.
  ///
  /// In en, this message translates to:
  /// **'Flash Off. Activate to turn on auto flash.'**
  String get hsFlashOff;

  /// No description provided for @hsFlashAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto flash. Activate to turn flash on.'**
  String get hsFlashAuto;

  /// No description provided for @hsFlashOn.
  ///
  /// In en, this message translates to:
  /// **'Flash on. Activate to turn flash off.'**
  String get hsFlashOn;

  /// No description provided for @hsFlashTorch.
  ///
  /// In en, this message translates to:
  /// **'Torch mode. Activate to turn flash off.'**
  String get hsFlashTorch;

  /// No description provided for @hsWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to InstaSOS'**
  String get hsWelcome;

  /// No description provided for @hsAppTutorial.
  ///
  /// In en, this message translates to:
  /// **'It shares your status with emergency contacts in a moment of crisis.\n\nPlease choose an emergency contact.\nJust one for now, you can add more later.'**
  String get hsAppTutorial;

  /// No description provided for @hsPermissionsTutorialTitle.
  ///
  /// In en, this message translates to:
  /// **'If you want'**
  String get hsPermissionsTutorialTitle;

  /// No description provided for @hsPermissionsTutorial.
  ///
  /// In en, this message translates to:
  /// **'InstaSOS can also gather and share evidence.\n\nIt will ask for camera, microphone, and gallery access to do so.'**
  String get hsPermissionsTutorial;

  /// No description provided for @hsBroadcastTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to automatically text your emergency contacts.\n\nIf InstaSOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nEither deactivate SOS or fully close the app to stop the texts.'**
  String get hsBroadcastTutorial;

  /// No description provided for @hsIOSBroadcastTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to automatically text your emergency contacts.\n\nIf InstaSOS has access to your location, it will be included in the texts.'**
  String get hsIOSBroadcastTutorial;

  /// No description provided for @hsSettingsTutorial.
  ///
  /// In en, this message translates to:
  /// **'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n- Change the app\'s language, and\n- Update the app\'s appearance\n\nin the settings.\n\nHold the settings button to give feedback for the app.'**
  String get hsSettingsTutorial;

  /// No description provided for @hsVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you will be able to share it right away.\n\nBy default, if a recording is interrupted, SOS will activate automatically.\n\nLong press the center preview to show a list of your rights.'**
  String get hsVideoTutorial;

  /// No description provided for @hsIOSVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you will be able to share it right away.\n\nLong press the center preview to show a list of your rights.'**
  String get hsIOSVideoTutorial;

  /// No description provided for @hsRightsTutorial.
  ///
  /// In en, this message translates to:
  /// **'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nBy default, if a recording is interrupted, SOS will activate automatically.\n\nHit the gavel or long press the center of the screen to show a list of your rights.'**
  String get hsRightsTutorial;

  /// No description provided for @hsIOSRightsTutorial.
  ///
  /// In en, this message translates to:
  /// **'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nHit the gavel or long press the center of the screen to show a list of your rights.'**
  String get hsIOSRightsTutorial;

  /// No description provided for @hsNeedContacts.
  ///
  /// In en, this message translates to:
  /// **'InstaSOS needs access to your contacts to function properly.'**
  String get hsNeedContacts;

  /// No description provided for @hsNoNumber.
  ///
  /// In en, this message translates to:
  /// **'The contact must have a phone number.'**
  String get hsNoNumber;

  /// No description provided for @rsSharedHeader.
  ///
  /// In en, this message translates to:
  /// **'You have the right to...'**
  String get rsSharedHeader;

  /// No description provided for @rsSharedRemainSilent.
  ///
  /// In en, this message translates to:
  /// **'Remain silent. Do not lie, but you don\'t have to answer questions.'**
  String get rsSharedRemainSilent;

  /// No description provided for @rsSharedDocument.
  ///
  /// In en, this message translates to:
  /// **'Document everything. You have the right to take pictures, record videos, and record audio.'**
  String get rsSharedDocument;

  /// No description provided for @rsWalkPockets.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your pockets. ICE can give a pat-down, but not a search.'**
  String get rsWalkPockets;

  /// No description provided for @rsWalkLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave if you are not under arrest.'**
  String get rsWalkLeave;

  /// No description provided for @rsDriveSearch.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your car.'**
  String get rsDriveSearch;

  /// No description provided for @rsDrivePockets.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your pockets. ICE can give a pat-down, but not a search.'**
  String get rsDrivePockets;

  /// No description provided for @rsDriveID.
  ///
  /// In en, this message translates to:
  /// **'Refuse to provide ID as a passenger. Only the driver is required to provide ID.'**
  String get rsDriveID;

  /// No description provided for @rsDriveQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask questions. Find out why you are being stopped.'**
  String get rsDriveQuestion;

  /// No description provided for @rsDriveWarrant.
  ///
  /// In en, this message translates to:
  /// **'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.'**
  String get rsDriveWarrant;

  /// No description provided for @rsDriveLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave if you are not under arrest.'**
  String get rsDriveLeave;

  /// No description provided for @rsHomeWarrant.
  ///
  /// In en, this message translates to:
  /// **'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.'**
  String get rsHomeWarrant;

  /// No description provided for @rsSharedFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Refuse to be fingerprinted by ICE unless you are under arrest.'**
  String get rsSharedFingerprint;

  /// No description provided for @rsSharedLawyer.
  ///
  /// In en, this message translates to:
  /// **'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.'**
  String get rsSharedLawyer;

  /// No description provided for @ssSOSOnOpen.
  ///
  /// In en, this message translates to:
  /// **'SOS on open'**
  String get ssSOSOnOpen;

  /// No description provided for @ssSOSOnClose.
  ///
  /// In en, this message translates to:
  /// **'SOS on close'**
  String get ssSOSOnClose;

  /// No description provided for @ssSOSOnCloseHint.
  ///
  /// In en, this message translates to:
  /// **'When enabled, a safe close button will be shown opposite the settings.'**
  String get ssSOSOnCloseHint;

  /// No description provided for @ssVideoSOS.
  ///
  /// In en, this message translates to:
  /// **'SOS on interrupted recording'**
  String get ssVideoSOS;

  /// No description provided for @ssEMC.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get ssEMC;

  /// No description provided for @ssRemoveHint.
  ///
  /// In en, this message translates to:
  /// **'Remove contact'**
  String get ssRemoveHint;

  /// No description provided for @ssAddHint.
  ///
  /// In en, this message translates to:
  /// **'Add another contact'**
  String get ssAddHint;

  /// No description provided for @ssAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get ssAppearance;
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
