import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'lang_ar.dart' deferred as lang_ar;
import 'lang_en.dart' deferred as lang_en;
import 'lang_es.dart' deferred as lang_es;
import 'lang_fil.dart' deferred as lang_fil;
import 'lang_fr.dart' deferred as lang_fr;
import 'lang_ht.dart' deferred as lang_ht;
import 'lang_zh.dart' deferred as lang_zh;

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
    Locale('ar'),
    Locale('ar', 'EG'),
    Locale('en'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('ht'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @gOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get gOk;

  /// No description provided for @gReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get gReminder;

  /// No description provided for @gNotAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show again'**
  String get gNotAgain;

  /// No description provided for @sosLastKnown.
  ///
  /// In en, this message translates to:
  /// **'Last known location'**
  String get sosLastKnown;

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

  /// No description provided for @sosError.
  ///
  /// In en, this message translates to:
  /// **'Cannot access location (error)'**
  String get sosError;

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

  /// No description provided for @hsAutoSOS.
  ///
  /// In en, this message translates to:
  /// **'Auto SOS'**
  String get hsAutoSOS;

  /// No description provided for @hsStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get hsStop;

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
  /// **'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.'**
  String get hsBroadcastTutorial;

  /// No description provided for @hsIOSBroadcastTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.'**
  String get hsIOSBroadcastTutorial;

  /// No description provided for @hsSettingsTutorial.
  ///
  /// In en, this message translates to:
  /// **'- Configure your SOS broadcast\n- Customize the app\'s appearance\n- Access more resources and support\n\nin the settings.'**
  String get hsSettingsTutorial;

  /// No description provided for @hsVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you can share it right away.\n\nBy default, if a recording is interrupted, an SOS broadcast will start automatically.\n\nLong press the camera preview to see your rights.'**
  String get hsVideoTutorial;

  /// No description provided for @hsIOSVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you can share it right away.\n\nLong press the camera preview to see your rights.'**
  String get hsIOSVideoTutorial;

  /// No description provided for @hsPartialContacts.
  ///
  /// In en, this message translates to:
  /// **'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, go to iOS Settings -> Apps -> InstaSOS'**
  String get hsPartialContacts;

  /// No description provided for @hsNumError.
  ///
  /// In en, this message translates to:
  /// **'The contact is private or does not have a phone number.'**
  String get hsNumError;

  /// No description provided for @rsSharedHeader.
  ///
  /// In en, this message translates to:
  /// **'You have the right to...'**
  String get rsSharedHeader;

  /// No description provided for @rsOnFoot.
  ///
  /// In en, this message translates to:
  /// **'On foot'**
  String get rsOnFoot;

  /// No description provided for @rsWhileDriving.
  ///
  /// In en, this message translates to:
  /// **'While driving'**
  String get rsWhileDriving;

  /// No description provided for @rsAtHome.
  ///
  /// In en, this message translates to:
  /// **'At home'**
  String get rsAtHome;

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

  /// No description provided for @rsMobilePockets.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your pockets. ICE can give a pat-down, but not a search.'**
  String get rsMobilePockets;

  /// No description provided for @rsMobileQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask questions. Find out why you are being stopped.'**
  String get rsMobileQuestion;

  /// No description provided for @rsMobileLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave if you are not being detained.'**
  String get rsMobileLeave;

  /// No description provided for @rsDriveSearch.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your car.'**
  String get rsDriveSearch;

  /// No description provided for @rsDriveID.
  ///
  /// In en, this message translates to:
  /// **'Refuse to provide ID as a passenger. Only the driver is required to provide ID.'**
  String get rsDriveID;

  /// No description provided for @rsDriveWarrant.
  ///
  /// In en, this message translates to:
  /// **'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.'**
  String get rsDriveWarrant;

  /// No description provided for @rsHomeWarrant.
  ///
  /// In en, this message translates to:
  /// **'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.'**
  String get rsHomeWarrant;

  /// No description provided for @rsSharedSign.
  ///
  /// In en, this message translates to:
  /// **'Refuse to sign anything.'**
  String get rsSharedSign;

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

  /// No description provided for @ssAutoShare.
  ///
  /// In en, this message translates to:
  /// **'Auto-share media'**
  String get ssAutoShare;

  /// No description provided for @ssSOS.
  ///
  /// In en, this message translates to:
  /// **'SOS settings'**
  String get ssSOS;

  /// No description provided for @ssAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance settings'**
  String get ssAppearance;

  /// No description provided for @ssResources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get ssResources;

  /// No description provided for @rsCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community resources'**
  String get rsCommunity;

  /// No description provided for @rsGov.
  ///
  /// In en, this message translates to:
  /// **'US government resources'**
  String get rsGov;

  /// No description provided for @rsAffiliate.
  ///
  /// In en, this message translates to:
  /// **'None are affiliated with Empathetech LLC'**
  String get rsAffiliate;

  /// No description provided for @rsAffiliateFix.
  ///
  /// In en, this message translates to:
  /// **'None are affiliated with Empathetic LLC'**
  String get rsAffiliateFix;

  /// No description provided for @ssSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get ssSupport;

  /// No description provided for @faqName.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faqName;

  /// No description provided for @faqListQ.
  ///
  /// In en, this message translates to:
  /// **'How was the rights list made?'**
  String get faqListQ;

  /// No description provided for @faqListA1.
  ///
  /// In en, this message translates to:
  /// **'The rights list was compiled from several public sources, including:'**
  String get faqListA1;

  /// No description provided for @faqListA2.
  ///
  /// In en, this message translates to:
  /// **'Another useful resource: '**
  String get faqListA2;

  /// No description provided for @faqSettings.
  ///
  /// In en, this message translates to:
  /// **'What do the settings do?'**
  String get faqSettings;

  /// No description provided for @faqOnOpen.
  ///
  /// In en, this message translates to:
  /// **'SOS on open: when enabled, an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.'**
  String get faqOnOpen;

  /// No description provided for @faqOnInterrupt.
  ///
  /// In en, this message translates to:
  /// **'SOS on interrupted recording: when enabled, if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).'**
  String get faqOnInterrupt;

  /// No description provided for @faqAutoShare.
  ///
  /// In en, this message translates to:
  /// **'Auto-share media: when enabled, the native share options will appear as soon as a video completes or a photo is taken.'**
  String get faqAutoShare;

  /// No description provided for @faqEMC.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts: the people that will be sent your location while an SOS broadcast is active.'**
  String get faqEMC;

  /// No description provided for @faqLink.
  ///
  /// In en, this message translates to:
  /// **'Link type: how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.'**
  String get faqLink;

  /// No description provided for @faqUnavailable.
  ///
  /// In en, this message translates to:
  /// **'SOS says \"Location unavailable\"?'**
  String get faqUnavailable;

  /// No description provided for @faqReliability.
  ///
  /// In en, this message translates to:
  /// **'To improve SOS reliability, please enable \"Allow all the time\" in the '**
  String get faqReliability;

  /// No description provided for @faqLocationPermissions.
  ///
  /// In en, this message translates to:
  /// **'location permissions'**
  String get faqLocationPermissions;

  /// No description provided for @faqLocationTrust.
  ///
  /// In en, this message translates to:
  /// **'The app only uses your location while an SOS broadcast is active. Neither InstaSOS or Empathetech LLC track, store, or sell user data.'**
  String get faqLocationTrust;

  /// No description provided for @faqPrivateContact.
  ///
  /// In en, this message translates to:
  /// **'The contact is private or does not have a phone number?'**
  String get faqPrivateContact;

  /// No description provided for @faqContactPermissions.
  ///
  /// In en, this message translates to:
  /// **'If you get this message when adding an emergency contact, InstaSOS does not have permission to access that contact.'**
  String get faqContactPermissions;

  /// No description provided for @faqUpdateContacts.
  ///
  /// In en, this message translates to:
  /// **'You can update contact permissions in the '**
  String get faqUpdateContacts;

  /// No description provided for @faqOSSettings.
  ///
  /// In en, this message translates to:
  /// **'iOS settings'**
  String get faqOSSettings;

  /// No description provided for @faqMissing.
  ///
  /// In en, this message translates to:
  /// **'Why are some Android features missing?'**
  String get faqMissing;

  /// No description provided for @faqRestricted.
  ///
  /// In en, this message translates to:
  /// **'The missing features require SMS automation, and Apple does not allow developers to automate text messages (without a paid service).'**
  String get faqRestricted;

  /// No description provided for @faqShortcuts.
  ///
  /// In en, this message translates to:
  /// **'What about iOS shortcuts?\nThere are also restrictions on accessing user shortcuts, which would break crucial features. Primarily: it would interrupt video recordings.'**
  String get faqShortcuts;

  /// No description provided for @faqLanguages.
  ///
  /// In en, this message translates to:
  /// **'Why is X language not available?'**
  String get faqLanguages;

  /// No description provided for @faqResponsible.
  ///
  /// In en, this message translates to:
  /// **'It would be irresponsible to use machine translation for the rights list. Please consider '**
  String get faqResponsible;

  /// No description provided for @faqContributing.
  ///
  /// In en, this message translates to:
  /// **'contributing'**
  String get faqContributing;

  /// No description provided for @faqExpand.
  ///
  /// In en, this message translates to:
  /// **' to help expand the language options.'**
  String get faqExpand;

  /// No description provided for @faqReset.
  ///
  /// In en, this message translates to:
  /// **'Reset tutorial'**
  String get faqReset;

  /// No description provided for @faqOnCloseWarning.
  ///
  /// In en, this message translates to:
  /// **'\"SOS on close\" is enabled. This will start a broadcast.'**
  String get faqOnCloseWarning;

  /// No description provided for @bsEMC.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get bsEMC;

  /// No description provided for @bsRemoveHint.
  ///
  /// In en, this message translates to:
  /// **'Remove contact'**
  String get bsRemoveHint;

  /// No description provided for @bsAddHint.
  ///
  /// In en, this message translates to:
  /// **'Add another contact'**
  String get bsAddHint;

  /// No description provided for @bsLinkType.
  ///
  /// In en, this message translates to:
  /// **'Link type'**
  String get bsLinkType;

  /// No description provided for @bsSOSOnOpen.
  ///
  /// In en, this message translates to:
  /// **'SOS on open'**
  String get bsSOSOnOpen;

  /// No description provided for @bsSOSOnClose.
  ///
  /// In en, this message translates to:
  /// **'SOS on close'**
  String get bsSOSOnClose;

  /// No description provided for @bsSOSOnCloseHint.
  ///
  /// In en, this message translates to:
  /// **'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.'**
  String get bsSOSOnCloseHint;

  /// No description provided for @bsCloseOffWarning.
  ///
  /// In en, this message translates to:
  /// **'The app will auto-close to prevent unintentional broadcasts.'**
  String get bsCloseOffWarning;

  /// No description provided for @bsVideoSOS.
  ///
  /// In en, this message translates to:
  /// **'SOS on interrupted recording'**
  String get bsVideoSOS;

  /// No description provided for @dsLadyLiberty.
  ///
  /// In en, this message translates to:
  /// **'A picture of the Statue of Liberty, with a preview of the rights list.'**
  String get dsLadyLiberty;
}

class _LangDelegate extends LocalizationsDelegate<Lang> {
  const _LangDelegate();

  @override
  Future<Lang> load(Locale locale) {
    return lookupLang(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'en',
        'es',
        'fil',
        'fr',
        'ht',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_LangDelegate old) => false;
}

Future<Lang> lookupLang(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'ar':
      {
        switch (locale.countryCode) {
          case 'EG':
            return lang_ar
                .loadLibrary()
                .then((dynamic _) => lang_ar.LangArEg());
        }
        break;
      }
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return lang_en
                .loadLibrary()
                .then((dynamic _) => lang_en.LangEnUs());
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return lang_zh
                .loadLibrary()
                .then((dynamic _) => lang_zh.LangZhCn());
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return lang_ar.loadLibrary().then((dynamic _) => lang_ar.LangAr());
    case 'en':
      return lang_en.loadLibrary().then((dynamic _) => lang_en.LangEn());
    case 'es':
      return lang_es.loadLibrary().then((dynamic _) => lang_es.LangEs());
    case 'fil':
      return lang_fil.loadLibrary().then((dynamic _) => lang_fil.LangFil());
    case 'fr':
      return lang_fr.loadLibrary().then((dynamic _) => lang_fr.LangFr());
    case 'ht':
      return lang_ht.loadLibrary().then((dynamic _) => lang_ht.LangHt());
    case 'zh':
      return lang_zh.loadLibrary().then((dynamic _) => lang_zh.LangZh());
  }

  throw FlutterError(
      'Lang.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
