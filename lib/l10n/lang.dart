import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'lang_ar.dart' deferred as lang_ar;
import 'lang_de.dart' deferred as lang_de;
import 'lang_en.dart' deferred as lang_en;
import 'lang_es.dart' deferred as lang_es;
import 'lang_fil.dart' deferred as lang_fil;
import 'lang_fr.dart' deferred as lang_fr;
import 'lang_hi.dart' deferred as lang_hi;
import 'lang_ht.dart' deferred as lang_ht;
import 'lang_ja.dart' deferred as lang_ja;
import 'lang_ko.dart' deferred as lang_ko;
import 'lang_ru.dart' deferred as lang_ru;
import 'lang_sw.dart' deferred as lang_sw;
import 'lang_uk.dart' deferred as lang_uk;
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
    Locale('de'),
    Locale('en'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('hi'),
    Locale('ht'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('sw'),
    Locale('uk'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @gOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get gOk;

  /// No description provided for @gDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get gDone;

  /// No description provided for @gReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get gReminder;

  /// No description provided for @gSystem.
  ///
  /// In en, this message translates to:
  /// **'System settings'**
  String get gSystem;

  /// No description provided for @gNotAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show again'**
  String get gNotAgain;

  /// No description provided for @gOnCloseWarning.
  ///
  /// In en, this message translates to:
  /// **'\"SOS on close\" is enabled. This will start a broadcast.'**
  String get gOnCloseWarning;

  /// No description provided for @sosLastKnown.
  ///
  /// In en, this message translates to:
  /// **'last known location:'**
  String get sosLastKnown;

  /// No description provided for @sosNeedSMS.
  ///
  /// In en, this message translates to:
  /// **'SOS needs SMS (texting) permission.'**
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

  /// No description provided for @hsWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to InstaSOS'**
  String get hsWelcome;

  /// No description provided for @hsWelcomeFix.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Insta-SOS'**
  String get hsWelcomeFix;

  /// No description provided for @hsAppIntro.
  ///
  /// In en, this message translates to:
  /// **'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.'**
  String get hsAppIntro;

  /// No description provided for @hsAppIntroAlt.
  ///
  /// In en, this message translates to:
  /// **'The latest update was a big one, let\'s make sure everything is ready below.'**
  String get hsAppIntroAlt;

  /// No description provided for @hsYourApp.
  ///
  /// In en, this message translates to:
  /// **'You can change your mind/permissions at any time.'**
  String get hsYourApp;

  /// No description provided for @hsHybridTranslation.
  ///
  /// In en, this message translates to:
  /// **'The tutorial and settings are machine translated.\nThe rights list is human translated.'**
  String get hsHybridTranslation;

  /// No description provided for @hsCamMic.
  ///
  /// In en, this message translates to:
  /// **'Camera & Microphone'**
  String get hsCamMic;

  /// No description provided for @hsAddRecording.
  ///
  /// In en, this message translates to:
  /// **'Enables video recording.'**
  String get hsAddRecording;

  /// No description provided for @hsGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get hsGallery;

  /// No description provided for @hsAddSave.
  ///
  /// In en, this message translates to:
  /// **'Required to save your recordings.'**
  String get hsAddSave;

  /// No description provided for @hsCameraReady.
  ///
  /// In en, this message translates to:
  /// **'Camera is ready'**
  String get hsCameraReady;

  /// No description provided for @hsCameraSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Activate to give Insta-SOS permission to the camera.'**
  String get hsCameraSetupHint;

  /// No description provided for @hsContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get hsContacts;

  /// No description provided for @hsAddContacts.
  ///
  /// In en, this message translates to:
  /// **'Enables emergency contact alerts.'**
  String get hsAddContacts;

  /// No description provided for @hsContactsReady.
  ///
  /// In en, this message translates to:
  /// **'Contacts are ready'**
  String get hsContactsReady;

  /// No description provided for @hsContactsSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Activate to give Insta-SOS permission to view your contacts.'**
  String get hsContactsSetupHint;

  /// No description provided for @hsAppleContacts.
  ///
  /// In en, this message translates to:
  /// **'This step is for app permissions only.\nYou are not choosing emergency contacts yet.\n\nIt is recommended to allow all to reduce headaches.'**
  String get hsAppleContacts;

  /// No description provided for @hsTexting.
  ///
  /// In en, this message translates to:
  /// **'Texting'**
  String get hsTexting;

  /// No description provided for @hsAddTexting.
  ///
  /// In en, this message translates to:
  /// **'Part 2 of enabling emergency contact alerts.'**
  String get hsAddTexting;

  /// No description provided for @hsTextingReady.
  ///
  /// In en, this message translates to:
  /// **'Texting is ready'**
  String get hsTextingReady;

  /// No description provided for @hsTextingSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Activate to give Insta-SOS permission to send messages.'**
  String get hsTextingSetupHint;

  /// No description provided for @hsLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get hsLocation;

  /// No description provided for @hsUnable.
  ///
  /// In en, this message translates to:
  /// **'Unable to determine'**
  String get hsUnable;

  /// No description provided for @hsAddLocation.
  ///
  /// In en, this message translates to:
  /// **'Enables location sharing with emergency contacts.'**
  String get hsAddLocation;

  /// No description provided for @hsAddAlways.
  ///
  /// In en, this message translates to:
  /// **'Recommended to enable always. Press again to open the System Settings.'**
  String get hsAddAlways;

  /// No description provided for @hsLocationReady.
  ///
  /// In en, this message translates to:
  /// **'Location is ready'**
  String get hsLocationReady;

  /// No description provided for @hsLocationSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Activate to give Insta-SOS permission to view your location.'**
  String get hsLocationSetupHint;

  /// No description provided for @hsOneOfFour.
  ///
  /// In en, this message translates to:
  /// **'First of four. Continue...'**
  String get hsOneOfFour;

  /// No description provided for @hsBroadcastTutorial.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.'**
  String get hsBroadcastTutorial;

  /// No description provided for @hsBroadcastTutorialFix.
  ///
  /// In en, this message translates to:
  /// **'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.'**
  String get hsBroadcastTutorialFix;

  /// No description provided for @hsBroadcastTutorialAndroid.
  ///
  /// In en, this message translates to:
  /// **'The texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.'**
  String get hsBroadcastTutorialAndroid;

  /// No description provided for @hsTwoOfFour.
  ///
  /// In en, this message translates to:
  /// **'Second of four. Continue...'**
  String get hsTwoOfFour;

  /// No description provided for @hsSettingsTutorial.
  ///
  /// In en, this message translates to:
  /// **'- Configure your SOS broadcast\n- Customize the app\'s appearance\n- Access more resources and support\n\nin the settings.'**
  String get hsSettingsTutorial;

  /// No description provided for @hsSettingsTutorialFix.
  ///
  /// In en, this message translates to:
  /// **'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.'**
  String get hsSettingsTutorialFix;

  /// No description provided for @hsThreeOfFour.
  ///
  /// In en, this message translates to:
  /// **'Third of four. Continue...'**
  String get hsThreeOfFour;

  /// No description provided for @hsVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you can share it right away.\n\nBy default, if a recording is interrupted, an SOS broadcast will start automatically.\n\nLong press the camera preview to show/hide your rights.'**
  String get hsVideoTutorial;

  /// No description provided for @hsIOSVideoTutorial.
  ///
  /// In en, this message translates to:
  /// **'When you take a picture or record a video, you can share it right away.\n\nLong press the camera preview to show/hide your rights.'**
  String get hsIOSVideoTutorial;

  /// No description provided for @hsTutorialComplete.
  ///
  /// In en, this message translates to:
  /// **'Tutorial complete'**
  String get hsTutorialComplete;

  /// No description provided for @hsAddEMC.
  ///
  /// In en, this message translates to:
  /// **'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.'**
  String get hsAddEMC;

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

  /// No description provided for @hsBroadcasting.
  ///
  /// In en, this message translates to:
  /// **'Broadcasting'**
  String get hsBroadcasting;

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
  /// **'Long press to show/hide your rights.'**
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

  /// No description provided for @hsNoFlash.
  ///
  /// In en, this message translates to:
  /// **'Camera flash not working'**
  String get hsNoFlash;

  /// No description provided for @rvSharedHeader.
  ///
  /// In en, this message translates to:
  /// **'You have the right to...'**
  String get rvSharedHeader;

  /// No description provided for @rvOnFoot.
  ///
  /// In en, this message translates to:
  /// **'On foot'**
  String get rvOnFoot;

  /// No description provided for @rvWhileDriving.
  ///
  /// In en, this message translates to:
  /// **'While driving'**
  String get rvWhileDriving;

  /// No description provided for @rvAtHome.
  ///
  /// In en, this message translates to:
  /// **'At home'**
  String get rvAtHome;

  /// No description provided for @rvSharedRemainSilent.
  ///
  /// In en, this message translates to:
  /// **'Remain silent. Do not lie, but you don\'t have to answer questions.'**
  String get rvSharedRemainSilent;

  /// No description provided for @rvSharedDocument.
  ///
  /// In en, this message translates to:
  /// **'Document everything. You have the right to take pictures, record videos, and record audio.'**
  String get rvSharedDocument;

  /// No description provided for @rvMobilePockets.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your pockets. ICE can give a pat-down, but not a search.'**
  String get rvMobilePockets;

  /// No description provided for @rvMobileQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask questions. Find out why you are being stopped.'**
  String get rvMobileQuestion;

  /// No description provided for @rvMobileLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave if you are not being detained.'**
  String get rvMobileLeave;

  /// No description provided for @rvDriveSearch.
  ///
  /// In en, this message translates to:
  /// **'Refuse a search of your car.'**
  String get rvDriveSearch;

  /// No description provided for @rvDriveID.
  ///
  /// In en, this message translates to:
  /// **'Refuse to provide ID as a passenger. Only the driver is required to provide ID.'**
  String get rvDriveID;

  /// No description provided for @rvDriveWarrant.
  ///
  /// In en, this message translates to:
  /// **'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.'**
  String get rvDriveWarrant;

  /// No description provided for @rvHomeWarrant.
  ///
  /// In en, this message translates to:
  /// **'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.'**
  String get rvHomeWarrant;

  /// No description provided for @rvSharedSign.
  ///
  /// In en, this message translates to:
  /// **'Refuse to sign anything.'**
  String get rvSharedSign;

  /// No description provided for @rvSharedFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Refuse to be fingerprinted by ICE unless you are under arrest.'**
  String get rvSharedFingerprint;

  /// No description provided for @rvSharedLawyer.
  ///
  /// In en, this message translates to:
  /// **'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.'**
  String get rvSharedLawyer;

  /// No description provided for @ssAutoShare.
  ///
  /// In en, this message translates to:
  /// **'Auto-share pictures/videos'**
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

  /// No description provided for @ssPermissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get ssPermissions;

  /// No description provided for @ssResources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get ssResources;

  /// No description provided for @ssSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get ssSupport;

  /// No description provided for @pmOnlyAdd.
  ///
  /// In en, this message translates to:
  /// **'This tool only helps to add permissions.'**
  String get pmOnlyAdd;

  /// No description provided for @pmRemoveIn.
  ///
  /// In en, this message translates to:
  /// **'You can remove permissions in the '**
  String get pmRemoveIn;

  /// No description provided for @pmManualPermission.
  ///
  /// In en, this message translates to:
  /// **'If you remove permissions in the system settings, they must be restored there too.'**
  String get pmManualPermission;

  /// No description provided for @rmCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community resources'**
  String get rmCommunity;

  /// No description provided for @rmGov.
  ///
  /// In en, this message translates to:
  /// **'US government resources'**
  String get rmGov;

  /// No description provided for @rmAffiliate.
  ///
  /// In en, this message translates to:
  /// **'None are affiliated with Empathetech LLC'**
  String get rmAffiliate;

  /// No description provided for @rmAffiliateFix.
  ///
  /// In en, this message translates to:
  /// **'None are affiliated with Empathetic LLC'**
  String get rmAffiliateFix;

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

  /// No description provided for @faqListA.
  ///
  /// In en, this message translates to:
  /// **'The list of rights was taken from several public resources, including:'**
  String get faqListA;

  /// No description provided for @faqSettings.
  ///
  /// In en, this message translates to:
  /// **'How do the settings work?'**
  String get faqSettings;

  /// No description provided for @faqAutoShareA.
  ///
  /// In en, this message translates to:
  /// **' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.'**
  String get faqAutoShareA;

  /// No description provided for @faqLinkA.
  ///
  /// In en, this message translates to:
  /// **' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.'**
  String get faqLinkA;

  /// No description provided for @faqOnOpenA.
  ///
  /// In en, this message translates to:
  /// **' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.'**
  String get faqOnOpenA;

  /// No description provided for @faqOnInterruptA.
  ///
  /// In en, this message translates to:
  /// **' if a video is recording and InstaSOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen. It is recommended to enable either this or \"SOS on close\" (or both).'**
  String get faqOnInterruptA;

  /// No description provided for @faqOnInterruptAFix.
  ///
  /// In en, this message translates to:
  /// **' if a video is recording and Insta-SOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen. It is recommended to enable either this or \"SOS on close\" (or both).'**
  String get faqOnInterruptAFix;

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

  /// No description provided for @faqLocationTrustFix.
  ///
  /// In en, this message translates to:
  /// **'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetic LLC track, store, or sell user data.'**
  String get faqLocationTrustFix;

  /// No description provided for @faqContactPermissions.
  ///
  /// In en, this message translates to:
  /// **'If you get this message when adding an emergency contact, InstaSOS does not have permission to access that specific contact.'**
  String get faqContactPermissions;

  /// No description provided for @faqContactPermissionsFix.
  ///
  /// In en, this message translates to:
  /// **'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that specific contact.'**
  String get faqContactPermissionsFix;

  /// No description provided for @faqUpdateContacts.
  ///
  /// In en, this message translates to:
  /// **'You can give access to more (or all) contacts in the '**
  String get faqUpdateContacts;

  /// No description provided for @faqSplitClarity1.
  ///
  /// In en, this message translates to:
  /// **'Giving access to a contact does not make them an emergency contact. Only the numbers listed in the '**
  String get faqSplitClarity1;

  /// No description provided for @faqSplitClarity2.
  ///
  /// In en, this message translates to:
  /// **' will be contacted during an SOS broadcast.'**
  String get faqSplitClarity2;

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

  /// No description provided for @faqContact.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get faqContact;

  /// No description provided for @faqContactHint.
  ///
  /// In en, this message translates to:
  /// **'Email Empathetic LLC'**
  String get faqContactHint;

  /// No description provided for @bsEMC.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get bsEMC;

  /// No description provided for @bsAddSomeone.
  ///
  /// In en, this message translates to:
  /// **'Add someone to enable SOS'**
  String get bsAddSomeone;

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
  /// **'Location link type'**
  String get bsLinkType;

  /// No description provided for @bsSnackRequest.
  ///
  /// In en, this message translates to:
  /// **'Please add emergency contacts'**
  String get bsSnackRequest;

  /// No description provided for @bsNeedPermission.
  ///
  /// In en, this message translates to:
  /// **'Cannot add contacts without permission'**
  String get bsNeedPermission;

  /// No description provided for @bsPartialContacts.
  ///
  /// In en, this message translates to:
  /// **'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, open the '**
  String get bsPartialContacts;

  /// No description provided for @bsPartialContactsFix.
  ///
  /// In en, this message translates to:
  /// **'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, open the '**
  String get bsPartialContactsFix;

  /// No description provided for @bsNumError.
  ///
  /// In en, this message translates to:
  /// **'This contact is private or does not have a phone number.'**
  String get bsNumError;

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

  /// No description provided for @bsSOSOnCloseHintFix.
  ///
  /// In en, this message translates to:
  /// **'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf Insta-SOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.'**
  String get bsSOSOnCloseHintFix;

  /// No description provided for @bsCloseOffWarning.
  ///
  /// In en, this message translates to:
  /// **'The app will auto-close to prevent unintentional broadcasts.'**
  String get bsCloseOffWarning;

  /// No description provided for @bsSOSOnVideo.
  ///
  /// In en, this message translates to:
  /// **'SOS on interrupted recording'**
  String get bsSOSOnVideo;

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
        'de',
        'en',
        'es',
        'fil',
        'fr',
        'hi',
        'ht',
        'ja',
        'ko',
        'ru',
        'sw',
        'uk',
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
    case 'de':
      return lang_de.loadLibrary().then((dynamic _) => lang_de.LangDe());
    case 'en':
      return lang_en.loadLibrary().then((dynamic _) => lang_en.LangEn());
    case 'es':
      return lang_es.loadLibrary().then((dynamic _) => lang_es.LangEs());
    case 'fil':
      return lang_fil.loadLibrary().then((dynamic _) => lang_fil.LangFil());
    case 'fr':
      return lang_fr.loadLibrary().then((dynamic _) => lang_fr.LangFr());
    case 'hi':
      return lang_hi.loadLibrary().then((dynamic _) => lang_hi.LangHi());
    case 'ht':
      return lang_ht.loadLibrary().then((dynamic _) => lang_ht.LangHt());
    case 'ja':
      return lang_ja.loadLibrary().then((dynamic _) => lang_ja.LangJa());
    case 'ko':
      return lang_ko.loadLibrary().then((dynamic _) => lang_ko.LangKo());
    case 'ru':
      return lang_ru.loadLibrary().then((dynamic _) => lang_ru.LangRu());
    case 'sw':
      return lang_sw.loadLibrary().then((dynamic _) => lang_sw.LangSw());
    case 'uk':
      return lang_uk.loadLibrary().then((dynamic _) => lang_uk.LangUk());
    case 'zh':
      return lang_zh.loadLibrary().then((dynamic _) => lang_zh.LangZh());
  }

  throw FlutterError(
      'Lang.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
