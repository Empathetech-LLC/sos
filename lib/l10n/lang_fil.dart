// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class LangFil extends Lang {
  LangFil([String locale = 'fil']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => 'Paalala';

  @override
  String get gSystem => 'System settings';

  @override
  String get gNotAgain => 'Wag ka nang magpakita ulit';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => 'Huling napag-alamang lokasyon';

  @override
  String get sosNeedSMS =>
      'Kailangan ng SOS ang pahintulot sa SMS para gumana nang maayos.';

  @override
  String get sosDisabled => 'Hindi ma-access ang lokasyon (disabled)';

  @override
  String get sosDenied => 'Hindi ma-access ang lokasyon (denied)';

  @override
  String get sosError => 'Hindi ma-access ang lokasyon (error)';

  @override
  String get hsWelcome => 'Welcome sa InstaSOS';

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
  String get hsHybridTranslation =>
      'The tutorial and setting are machine translated.\nThe rights list is human translated.';

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
      'Activate to give Insta-SOS permission to the camera.';

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
      'Activate to give Insta-SOS permission to view your contacts.';

  @override
  String get hsTexting => 'Texting';

  @override
  String get hsAddTexting => 'Part 2 of enabling emergency contact alerts.';

  @override
  String get hsTextingReady => 'Texting is ready';

  @override
  String get hsTextingSetupHint =>
      'Activate to give Insta-SOS permission to send messages.';

  @override
  String get hsLocation => 'Location';

  @override
  String get hsUnable => 'Unable to determine';

  @override
  String get hsAddLocation =>
      'Enables location sharing with emergency contacts.';

  @override
  String get hsAddAlways =>
      'Recommended to enable always. Press again to open the System Settings.';

  @override
  String get hsLocationReady => 'Location is ready';

  @override
  String get hsLocationSetupHint =>
      'Activate to give Insta-SOS permission to view your location.';

  @override
  String get hsOneOfFour => 'First of four. Continue...';

  @override
  String get hsBroadcastTutorial =>
      'I-activate ang SOS para awtomatikong mag-tetext sa iyong mga emergency contact.\n\nKung may access ang InstaSOS sa iyong lokasyon, isasama ito sa mga text.\n\nMagpapatuloy ang mga text kahit naka-lock ang telepono.\n\nI-deactivate ang SOS o isara ang app para ihinto ang mga text.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'The texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      'Maaari kang...\n\n- Magdagdag ng mas maraming emergency contact\n- I-setup ang automatic SOS\n- Palitan ang wika ng app, at\n- I-update ang hitsura ng app\n\nsa settings.\n\nPindutin nang matagal ang settings button para magbigay ng feedback para sa app.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'Kapag kumukuha ka ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nBy default, kung maputol ang recording, awtomatikong maa-activate ang SOS.\n\nPindutin nang matagal ang gitnang preview para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsIOSVideoTutorial =>
      'Kapag kumukuha ka ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nPindutin nang matagal ang gitnang preview para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'I-activate para simulan ang SOS broadcast.';

  @override
  String get hsEndSOS => 'Nagbo-broadcast ang SOS. I-activate para ihinto.';

  @override
  String get hsSafeCloseHint =>
      'Clear na lahat. Isara ang app nang walang SOS.';

  @override
  String get hsBroadcasting => 'Broadcasting';

  @override
  String get hsStop => 'Itigil';

  @override
  String get hsCameraHint => 'Kunan ng larawan.';

  @override
  String get hsPreviewHint =>
      'Pindutin nang matagal para ipakita ang iyong mga karapatan.';

  @override
  String get hsShowRights => 'Ipakita ang iyong mga karapatan.';

  @override
  String get hsHideRights => 'Ihide ang iyong mga karapatan.';

  @override
  String get hsStartRecord => 'Magsimulang mag-record ng video.';

  @override
  String get hsEndRecord => 'Itigil ang pagre-record.';

  @override
  String get hsFlashOff => 'Naka-off ang flash. I-activate para i-auto flash.';

  @override
  String get hsFlashAuto => 'Auto flash. I-activate para i-on ang flash.';

  @override
  String get hsFlashOn => 'Naka-on ang flash. I-activate para i-off.';

  @override
  String get hsFlashTorch => 'Torch mode. I-activate para i-off ang flash.';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => 'May karapatan kang...';

  @override
  String get rvOnFoot => 'Habang naglalakad';

  @override
  String get rvWhileDriving => 'Habang nagmamaneho';

  @override
  String get rvAtHome => 'Habang nasa bahay';

  @override
  String get rvSharedRemainSilent =>
      'Manahimik. Huwag magsinungaling, pero hindi mo kailangang sumagot sa mga tanong.';

  @override
  String get rvSharedDocument =>
      'I-dokumento ang lahat. May karapatan kang kumuha ng larawan, mag-record ng video, at mag-record ng audio.';

  @override
  String get rvMobilePockets =>
      'Tumangging ipasuri ang iyong bulsa. Puwedeng kapkapan ka ng ICE, pero hindi puwedeng maghalughog.';

  @override
  String get rvMobileQuestion => 'Magtanong. Alamin kung bakit ka pinahinto.';

  @override
  String get rvMobileLeave => 'Umalis ka kung hindi ka pinipigilan.';

  @override
  String get rvDriveSearch => 'Tumangging ipasuri ang iyong sasakyan.';

  @override
  String get rvDriveID =>
      'Tumangging magbigay ng ID bilang pasahero. Tanging driver lang ang kailangang magbigay ng ID.';

  @override
  String get rvDriveWarrant =>
      'Magtanong kung may warrant ang mga opisyal. May karapatan kang makita ito. Kung walang pirma ng hukom, wala itong bisa.';

  @override
  String get rvHomeWarrant =>
      'Panatilihing nakasara ang pinto. Kung may warrant, hilingin na ipasok ito sa ilalim ng pinto. Kung walang pirma ng hukom, wala itong bisa. Panatilihing nakasara ang pinto.';

  @override
  String get rvSharedSign => 'Tumangging pumirma ng anuman.';

  @override
  String get rvSharedFingerprint =>
      'Tumangging magpa-fingerprint sa ICE maliban kung inaaresto ka.';

  @override
  String get rvSharedLawyer =>
      'Kumonsulta sa abogado. Kung pormal kang naaresto, may karapatan kang bigyan ng abogado ng korte.';

  @override
  String get ssAutoShare => 'Auto-share ng media';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Hitsura';

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
  String get pmManualPermission =>
      'If you remove permissions in the system settings, they must be restored there too.';

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
  String get faqListQ => 'Paano binuo ang listahan ng mga karapatan?';

  @override
  String get faqListA =>
      'Ang listahan ng mga karapatan ay tinipon mula sa ilang pampublikong sanggunian, kabilang ang:';

  @override
  String get faqSettings => 'Para saan ang mga settings?';

  @override
  String get faqAutoShareA =>
      ' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.';

  @override
  String get faqLinkA =>
      ' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.';

  @override
  String get faqOnOpenA =>
      ' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.';

  @override
  String get faqOnInterruptA =>
      ' if a video is recording and InstaSOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video is recording and Insta-SOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqUnavailable =>
      'Sinasabi ba ng SOS na \"Location unavailable\"?';

  @override
  String get faqReliability =>
      'Upang mas maging maasahan ang SOS, paki-enable ang \"Allow all the time\" sa ';

  @override
  String get faqLocationPermissions => 'location permissions';

  @override
  String get faqLocationTrust =>
      'Ginagamit lamang ng app ang iyong lokasyon habang aktibo ang isang SOS broadcast. Hindi sinusubaybayan, iniimbak, o ibinebenta ng InstaSOS o Empathetech LLC ang data ng user.';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetic LLC track, store, or sell user data.';

  @override
  String get faqContactPermissions =>
      'Kung natanggap mo ang mensaheng ito habang nagdadagdag ng emergency contact, walang pahintulot ang InstaSOS na i-access ang contact na iyon.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that specific contact.';

  @override
  String get faqUpdateContacts =>
      'Maaari mong i-update ang contact permissions sa ';

  @override
  String get faqSplitClarity1 =>
      'Giving access to a contact does not make them an emergency contact. Only the numbers listed in the ';

  @override
  String get faqSplitClarity2 => 'will be contacted during an SOS broadcast.';

  @override
  String get faqMissing => 'Bakit nawawala ang ilang Android features?';

  @override
  String get faqRestricted =>
      'Ang mga nawawalang features ay nangangailangan ng SMS automation, at hindi pinapayagan ng Apple ang mga developer na i-automate ang mga text message (nang walang bayad na serbisyo).';

  @override
  String get faqShortcuts =>
      'Paano naman ang iOS shortcuts?\nMayroon ding mga paghihigpit sa pag-access sa mga shortcut ng user, na makakasira sa mahahalagang feature. Pangunahin: maaantala nito ang mga video recording.';

  @override
  String get faqLanguages => 'Bakit hindi available ang X na wika?';

  @override
  String get faqResponsible =>
      'Iresponsableng gumamit ng machine translation para sa listahan ng mga karapatan. Mangyaring isaalang-alang ang ';

  @override
  String get faqContributing => 'pag-contribute';

  @override
  String get faqExpand =>
      ' upang makatulong na palawakin ang mga opsyon sa wika.';

  @override
  String get faqReset => 'I-reset ang tutorial';

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
      'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, open the ';

  @override
  String get bsPartialContactsFix =>
      'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, open the ';

  @override
  String get bsNumError =>
      'This contact is private or does not have a phone number.';

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
  String get bsSOSOnVideo => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'Isang larawan ng Statue of Liberty, na may preview ng listahan ng mga karapatan.';

  @override
  String get dsShowBack => 'Show back button?';
}
