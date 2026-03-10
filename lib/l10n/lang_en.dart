// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LangEn extends Lang {
  LangEn([String locale = 'en']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => 'Reminder';

  @override
  String get gNotAgain => 'Don\'t show again';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => 'Last known location';

  @override
  String get sosNeedSMS => 'SOS needs SMS permission to function properly.';

  @override
  String get sosDisabled => 'Cannot access location (disabled)';

  @override
  String get sosDenied => 'Cannot access location (denied)';

  @override
  String get sosError => 'Cannot access location (error)';

  @override
  String get hsWelcome => 'Welcome to InstaSOS';

  @override
  String get hsWelcomeFix => 'Welcome to Insta-SOS';

  @override
  String get hsAppIntro =>
      'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.';

  @override
  String get hsAppIntroAlt =>
      'The latest update was a big one, let\'s make sure everything is ready below.';

  @override
  String get hsYourApp => 'You can change your mind/permissions at any time.';

  @override
  String get hsCamMic => 'Camera & Microphone';

  @override
  String get hsAddRecording => 'Enables video recording.';

  @override
  String get hsGallery => 'Gallery';

  @override
  String get hsAddSave => 'Required to save your recordings.';

  @override
  String get hsCameraReady => 'Camera is ready';

  @override
  String get hsCameraSetupHint =>
      'Camera permissions setup. Activate to enable.';

  @override
  String get hsContacts => 'Contacts';

  @override
  String get hsAddContacts => 'Part 1 of enabling emergency contact alerts.';

  @override
  String get hsAddContactsIOS => 'Enables emergency contact alerts.';

  @override
  String get hsContactsReady => 'Contacts are ready';

  @override
  String get hsContactsSetupHint =>
      'Contacts permission setup. Activate to enable.';

  @override
  String get hsTexting => 'Texting';

  @override
  String get hsAddTexting => 'Part 2 of enabling emergency contact alerts.';

  @override
  String get hsTextingReady => 'Texting is ready';

  @override
  String get hsTextingSetupHint => 'SMS permission setup. Activate to enable.';

  @override
  String get hsLocation => 'Location';

  @override
  String get hsUnable => 'Unable to determine';

  @override
  String get hsAddLocation =>
      'Enables location sharing with emergency contacts.';

  @override
  String get hsAddAlways =>
      'Recommended to enable always. Press again to go to the System Settings.';

  @override
  String get hsLocationReady => 'Location is ready';

  @override
  String get hsLocationSetupHint =>
      'Location permission setup. Activate to enable.';

  @override
  String get hsOneOfFour => 'First of four. Continue...';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.';

  @override
  String get hsIOSBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      '- Configure your SOS broadcast\n- Customize the app\'s appearance\n- Access more resources and support\n\nin the settings.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you can share it right away.\n\nBy default, if a recording is interrupted, an SOS broadcast will start automatically.\n\nLong press the camera preview to see your rights.';

  @override
  String get hsIOSVideoTutorial =>
      'When you take a picture or record a video, you can share it right away.\n\nLong press the camera preview to see your rights.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'Activate to start SOS broadcast.';

  @override
  String get hsEndSOS => 'SOS is broadcasting. Activate to stop.';

  @override
  String get hsSafeCloseHint => 'All clear. Close the app without SOS.';

  @override
  String get hsAutoSOS => 'Auto SOS';

  @override
  String get hsStop => 'Stop';

  @override
  String get hsCameraHint => 'Take a photo.';

  @override
  String get hsPreviewHint => 'Long press to toggle your rights view.';

  @override
  String get hsShowRights => 'Show your rights.';

  @override
  String get hsHideRights => 'Hide your rights.';

  @override
  String get hsStartRecord => 'Record a video.';

  @override
  String get hsEndRecord => 'End the recording.';

  @override
  String get hsFlashOff => 'Flash Off. Activate to turn on auto flash.';

  @override
  String get hsFlashAuto => 'Auto flash. Activate to turn flash on.';

  @override
  String get hsFlashOn => 'Flash on. Activate to turn flash off.';

  @override
  String get hsFlashTorch => 'Torch mode. Activate to turn flash off.';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => 'You have the right to...';

  @override
  String get rvOnFoot => 'On foot';

  @override
  String get rvWhileDriving => 'While driving';

  @override
  String get rvAtHome => 'At home';

  @override
  String get rvSharedRemainSilent =>
      'Remain silent. Do not lie, but you don\'t have to answer questions.';

  @override
  String get rvSharedDocument =>
      'Document everything. You have the right to take pictures, record videos, and record audio.';

  @override
  String get rvMobilePockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rvMobileQuestion =>
      'Ask questions. Find out why you are being stopped.';

  @override
  String get rvMobileLeave => 'Leave if you are not being detained.';

  @override
  String get rvDriveSearch => 'Refuse a search of your car.';

  @override
  String get rvDriveID =>
      'Refuse to provide ID as a passenger. Only the driver is required to provide ID.';

  @override
  String get rvDriveWarrant =>
      'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.';

  @override
  String get rvHomeWarrant =>
      'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.';

  @override
  String get rvSharedSign => 'Refuse to sign anything.';

  @override
  String get rvSharedFingerprint =>
      'Refuse to be fingerprinted by ICE unless you are under arrest.';

  @override
  String get rvSharedLawyer =>
      'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.';

  @override
  String get ssAutoShare => 'Auto-share pictures/videos';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Appearance settings';

  @override
  String get ssPermissions => 'Permissions';

  @override
  String get ssResources => 'Resources';

  @override
  String get ssSupport => 'Support';

  @override
  String get pmOnlyAdd => 'This tool only helps to add permissions.';

  @override
  String get pmRemoveIn => 'You can remove permissions in the ';

  @override
  String get pmSystem => 'system settings.';

  @override
  String get pmManualPermission =>
      'If you remove a permission in the system settings, it must be restored there too.';

  @override
  String get rmCommunity => 'Community resources';

  @override
  String get rmGov => 'US government resources';

  @override
  String get rmAffiliate => 'None are affiliated with Empathetech LLC';

  @override
  String get rmAffiliateFix => 'None are affiliated with Empathetic LLC';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'How was the rights list made?';

  @override
  String get faqListA =>
      'The rights list was compiled from several public sources, including:';

  @override
  String get faqSettings => 'How do the settings work?';

  @override
  String get faqAutoShareQ => 'Auto-share pictures/video:';

  @override
  String get faqAutoShareA =>
      ' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.';

  @override
  String get faqLinkQ => 'Link type:';

  @override
  String get faqLinkA =>
      ' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.';

  @override
  String get faqOnOpenQ => 'SOS on open:';

  @override
  String get faqOnOpenA =>
      ' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.';

  @override
  String get faqOnInterruptQ => 'SOS on interrupted recording:';

  @override
  String get faqOnInterruptA =>
      ' if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video recording is active and Insta-SOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqUnavailable => 'SOS says \"Location unavailable\"?';

  @override
  String get faqReliability =>
      'To improve SOS reliability, please enable \"Allow all the time\" in the ';

  @override
  String get faqLocationPermissions => 'location permissions';

  @override
  String get faqLocationTrust =>
      'The app only uses your location while an SOS broadcast is active. Neither InstaSOS or Empathetech LLC track, store, or sell user data.';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetech LLC track, store, or sell user data.';

  @override
  String get faqPrivateContact =>
      'The contact is private or does not have a phone number?';

  @override
  String get faqContactPermissions =>
      'If you get this message when adding an emergency contact, InstaSOS does not have permission to access that contact.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that contact.';

  @override
  String get faqUpdateContacts => 'You can update contact permissions in the ';

  @override
  String get faqOSSettings => 'iOS settings';

  @override
  String get faqMissing => 'Why are some Android features missing?';

  @override
  String get faqRestricted =>
      'The missing features require SMS automation, and Apple does not allow developers to automate text messages (without a paid service).';

  @override
  String get faqShortcuts =>
      'What about iOS shortcuts?\nThere are also restrictions on accessing user shortcuts, which would break crucial features. Primarily: it would interrupt video recordings.';

  @override
  String get faqLanguages => 'Why is X language not available?';

  @override
  String get faqResponsible =>
      'It would be irresponsible to use machine translation for the rights list. Please consider ';

  @override
  String get faqContributing => 'contributing';

  @override
  String get faqExpand => ' to help expand the language options.';

  @override
  String get faqReset => 'Reset tutorial';

  @override
  String get faqContact => 'Contact support';

  @override
  String get faqContactHint => 'Email Empathetic LLC';

  @override
  String get bsEMC => 'Emergency contacts';

  @override
  String get bsAddSomeone => 'Add someone to enable SOS';

  @override
  String get bsRemoveHint => 'Remove contact';

  @override
  String get bsAddHint => 'Add another contact';

  @override
  String get bsLinkType => 'Location link type';

  @override
  String get bsSnackRequest => 'Please add emergency contacts';

  @override
  String get bsNeedPermission => 'Cannot add contacts without permission';

  @override
  String get bsPartialContacts =>
      'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, go to iOS Settings -> Apps -> InstaSOS';

  @override
  String get bsPartialContactsFix =>
      'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, go to iOS Settings -> Apps -> Insta-SOS';

  @override
  String get bsNumError =>
      'The contact is private or does not have a phone number.';

  @override
  String get bsSOSOnOpen => 'SOS on open';

  @override
  String get bsSOSOnClose => 'SOS on close';

  @override
  String get bsSOSOnCloseHint =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsSOSOnCloseHintFix =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf Insta-SOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsCloseOffWarning =>
      'The app will auto-close to prevent unintentional broadcasts.';

  @override
  String get bsVideoSOS => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'A picture of the Statue of Liberty, with a preview of the rights list.';

  @override
  String get dsShowBack => 'Show back button?';
}

/// The translations for English, as used in the United States (`en_US`).
class LangEnUs extends LangEn {
  LangEnUs() : super('en_US');

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => 'Reminder';

  @override
  String get gNotAgain => 'Don\'t show again';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => 'Last known location';

  @override
  String get sosNeedSMS => 'SOS needs SMS permission to function properly.';

  @override
  String get sosDisabled => 'Cannot access location (disabled)';

  @override
  String get sosDenied => 'Cannot access location (denied)';

  @override
  String get sosError => 'Cannot access location (error)';

  @override
  String get hsWelcome => 'Welcome to InstaSOS';

  @override
  String get hsWelcomeFix => 'Welcome to Insta-SOS';

  @override
  String get hsAppIntro =>
      'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.';

  @override
  String get hsAppIntroAlt =>
      'The latest update was a big one, let\'s make sure everything is ready below.';

  @override
  String get hsYourApp => 'You can change your mind/permissions at any time.';

  @override
  String get hsCamMic => 'Camera & Microphone';

  @override
  String get hsAddRecording => 'Enables video recording.';

  @override
  String get hsGallery => 'Gallery';

  @override
  String get hsAddSave => 'Required to save your recordings.';

  @override
  String get hsCameraReady => 'Camera is ready';

  @override
  String get hsCameraSetupHint =>
      'Camera permissions setup. Activate to enable.';

  @override
  String get hsContacts => 'Contacts';

  @override
  String get hsAddContacts => 'Part 1 of enabling emergency contact alerts.';

  @override
  String get hsAddContactsIOS => 'Enables emergency contact alerts.';

  @override
  String get hsContactsReady => 'Contacts are ready';

  @override
  String get hsContactsSetupHint =>
      'Contacts permission setup. Activate to enable.';

  @override
  String get hsTexting => 'Texting';

  @override
  String get hsAddTexting => 'Part 2 of enabling emergency contact alerts.';

  @override
  String get hsTextingReady => 'Texting is ready';

  @override
  String get hsTextingSetupHint => 'SMS permission setup. Activate to enable.';

  @override
  String get hsLocation => 'Location';

  @override
  String get hsUnable => 'Unable to determine';

  @override
  String get hsAddLocation =>
      'Enables location sharing with emergency contacts.';

  @override
  String get hsAddAlways =>
      'Recommended to enable always. Press again to go to the System Settings.';

  @override
  String get hsLocationReady => 'Location is ready';

  @override
  String get hsLocationSetupHint =>
      'Location permission setup. Activate to enable.';

  @override
  String get hsOneOfFour => 'First of four. Continue...';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen InstaSOS has access to your location, it will be included in the texts.';

  @override
  String get hsIOSBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      '- Configure your SOS broadcast\n- Customize the app\'s appearance\n- Access more resources and support\n\nin the settings.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you can share it right away.\n\nBy default, if a recording is interrupted, an SOS broadcast will start automatically.\n\nLong press the camera preview to see your rights.';

  @override
  String get hsIOSVideoTutorial =>
      'When you take a picture or record a video, you can share it right away.\n\nLong press the camera preview to see your rights.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'Activate to start SOS broadcast.';

  @override
  String get hsEndSOS => 'SOS is broadcasting. Activate to stop.';

  @override
  String get hsSafeCloseHint => 'All clear. Close the app without SOS.';

  @override
  String get hsAutoSOS => 'Auto SOS';

  @override
  String get hsStop => 'Stop';

  @override
  String get hsCameraHint => 'Take a photo.';

  @override
  String get hsPreviewHint => 'Long press to toggle your rights view.';

  @override
  String get hsShowRights => 'Show your rights.';

  @override
  String get hsHideRights => 'Hide your rights.';

  @override
  String get hsStartRecord => 'Record a video.';

  @override
  String get hsEndRecord => 'End the recording.';

  @override
  String get hsFlashOff => 'Flash Off. Activate to turn on auto flash.';

  @override
  String get hsFlashAuto => 'Auto flash. Activate to turn flash on.';

  @override
  String get hsFlashOn => 'Flash on. Activate to turn flash off.';

  @override
  String get hsFlashTorch => 'Torch mode. Activate to turn flash off.';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => 'You have the right to...';

  @override
  String get rvOnFoot => 'On foot';

  @override
  String get rvWhileDriving => 'While driving';

  @override
  String get rvAtHome => 'At home';

  @override
  String get rvSharedRemainSilent =>
      'Remain silent. Do not lie, but you don\'t have to answer questions.';

  @override
  String get rvSharedDocument =>
      'Document everything. You have the right to take pictures, record videos, and record audio.';

  @override
  String get rvMobilePockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rvMobileQuestion =>
      'Ask questions. Find out why you are being stopped.';

  @override
  String get rvMobileLeave => 'Leave if you are not being detained.';

  @override
  String get rvDriveSearch => 'Refuse a search of your car.';

  @override
  String get rvDriveID =>
      'Refuse to provide ID as a passenger. Only the driver is required to provide ID.';

  @override
  String get rvDriveWarrant =>
      'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.';

  @override
  String get rvHomeWarrant =>
      'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.';

  @override
  String get rvSharedSign => 'Refuse to sign anything.';

  @override
  String get rvSharedFingerprint =>
      'Refuse to be fingerprinted by ICE unless you are under arrest.';

  @override
  String get rvSharedLawyer =>
      'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.';

  @override
  String get ssAutoShare => 'Auto-share pictures/videos';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Appearance settings';

  @override
  String get ssPermissions => 'Permissions';

  @override
  String get ssResources => 'Resources';

  @override
  String get ssSupport => 'Support';

  @override
  String get pmOnlyAdd => 'This tool only helps to add permissions.';

  @override
  String get pmRemoveIn => 'You can remove permissions in the ';

  @override
  String get pmSystem => 'system settings.';

  @override
  String get pmManualPermission =>
      'If you remove a permission in the system settings, it must be restored there too.';

  @override
  String get rmCommunity => 'Community resources';

  @override
  String get rmGov => 'US government resources';

  @override
  String get rmAffiliate => 'None are affiliated with Empathetech LLC';

  @override
  String get rmAffiliateFix => 'None are affiliated with Empathetic LLC';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'How was the rights list made?';

  @override
  String get faqListA =>
      'The rights list was compiled from several public sources, including:';

  @override
  String get faqSettings => 'How do the settings work?';

  @override
  String get faqAutoShareQ => 'Auto-share pictures/video:';

  @override
  String get faqAutoShareA =>
      ' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.';

  @override
  String get faqLinkQ => 'Link type:';

  @override
  String get faqLinkA =>
      ' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.';

  @override
  String get faqOnOpenQ => 'SOS on open:';

  @override
  String get faqOnOpenA =>
      ' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.';

  @override
  String get faqOnInterruptQ => 'SOS on interrupted recording:';

  @override
  String get faqOnInterruptA =>
      ' if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video recording is active and Insta-SOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqUnavailable => 'SOS says \"Location unavailable\"?';

  @override
  String get faqReliability =>
      'To improve SOS reliability, please enable \"Allow all the time\" in the ';

  @override
  String get faqLocationPermissions => 'location permissions';

  @override
  String get faqLocationTrust =>
      'The app only uses your location while an SOS broadcast is active. Neither InstaSOS or Empathetech LLC track, store, or sell user data.';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetech LLC track, store, or sell user data.';

  @override
  String get faqPrivateContact =>
      'The contact is private or does not have a phone number?';

  @override
  String get faqContactPermissions =>
      'If you get this message when adding an emergency contact, InstaSOS does not have permission to access that contact.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that contact.';

  @override
  String get faqUpdateContacts => 'You can update contact permissions in the ';

  @override
  String get faqOSSettings => 'iOS settings';

  @override
  String get faqMissing => 'Why are some Android features missing?';

  @override
  String get faqRestricted =>
      'The missing features require SMS automation, and Apple does not allow developers to automate text messages (without a paid service).';

  @override
  String get faqShortcuts =>
      'What about iOS shortcuts?\nThere are also restrictions on accessing user shortcuts, which would break crucial features. Primarily: it would interrupt video recordings.';

  @override
  String get faqLanguages => 'Why is X language not available?';

  @override
  String get faqResponsible =>
      'It would be irresponsible to use machine translation for the rights list. Please consider ';

  @override
  String get faqContributing => 'contributing';

  @override
  String get faqExpand => ' to help expand the language options.';

  @override
  String get faqReset => 'Reset tutorial';

  @override
  String get faqContact => 'Contact support';

  @override
  String get faqContactHint => 'Email Empathetic LLC';

  @override
  String get bsEMC => 'Emergency contacts';

  @override
  String get bsAddSomeone => 'Add someone to enable SOS';

  @override
  String get bsRemoveHint => 'Remove contact';

  @override
  String get bsAddHint => 'Add another contact';

  @override
  String get bsLinkType => 'Location link type';

  @override
  String get bsSnackRequest => 'Please add emergency contacts';

  @override
  String get bsNeedPermission => 'Cannot add contacts without permission';

  @override
  String get bsPartialContacts =>
      'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, go to iOS Settings -> Apps -> InstaSOS';

  @override
  String get bsPartialContactsFix =>
      'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, go to iOS Settings -> Apps -> Insta-SOS';

  @override
  String get bsNumError =>
      'The contact is private or does not have a phone number.';

  @override
  String get bsSOSOnOpen => 'SOS on open';

  @override
  String get bsSOSOnClose => 'SOS on close';

  @override
  String get bsSOSOnCloseHint =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsSOSOnCloseHintFix =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf Insta-SOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsCloseOffWarning =>
      'The app will auto-close to prevent unintentional broadcasts.';

  @override
  String get bsVideoSOS => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'A picture of the Statue of Liberty, with a preview of the rights list.';

  @override
  String get dsShowBack => 'Show back button?';
}
