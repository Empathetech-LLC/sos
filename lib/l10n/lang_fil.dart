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
  String get gReminder => 'Paalala';

  @override
  String get gNotAgain => 'Wag ka nang magpakita ulit';

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
  String get hsStartSOS => 'I-activate para simulan ang SOS broadcast.';

  @override
  String get hsEndSOS => 'Nagbo-broadcast ang SOS. I-activate para ihinto.';

  @override
  String get hsSafeCloseHint =>
      'Clear na lahat. Isara ang app nang walang SOS.';

  @override
  String get hsAutoSOS => 'Auto SOS';

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
  String get hsWelcome => 'Welcome sa InstaSOS';

  @override
  String get hsAppTutorial =>
      'Ibinabahagi nito ang iyong status sa mga emergency contact sa oras ng krisis.\n\nPumili ng isang emergency contact.\nIsa lang muna ngayon, maaari kang magdagdag mamaya.';

  @override
  String get hsPermissionsTutorialTitle => 'Kung nais mo';

  @override
  String get hsPermissionsTutorial =>
      'Maaaring mangolekta at magbahagi ng ebidensya ang InstaSOS.\n\nHihingi ito ng access sa camera, mikropono, at gallery.';

  @override
  String get hsBroadcastTutorial =>
      'I-activate ang SOS para awtomatikong mag-tetext sa iyong mga emergency contact.\n\nKung may access ang InstaSOS sa iyong lokasyon, isasama ito sa mga text.\n\nMagpapatuloy ang mga text kahit naka-lock ang telepono.\n\nI-deactivate ang SOS o isara ang app para ihinto ang mga text.';

  @override
  String get hsIOSBroadcastTutorial =>
      'I-activate ang SOS para awtomatikong mag-text sa iyong mga emergency contact.\n\nKung may access ang InstaSOS sa iyong lokasyon, isasama ito sa mga text.';

  @override
  String get hsSettingsTutorial =>
      'Maaari kang...\n\n- Magdagdag ng mas maraming emergency contact\n- I-setup ang automatic SOS\n- Palitan ang wika ng app, at\n- I-update ang hitsura ng app\n\nsa settings.\n\nPindutin nang matagal ang settings button para magbigay ng feedback para sa app.';

  @override
  String get hsVideoTutorial =>
      'Kapag kumukuha ka ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nBy default, kung maputol ang recording, awtomatikong maa-activate ang SOS.\n\nPindutin nang matagal ang gitnang preview para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsIOSVideoTutorial =>
      'Kapag kumukuha ka ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nPindutin nang matagal ang gitnang preview para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsPartialContacts =>
      'Ipapakita ng Apple ang lahat ng mga contact, hindi lamang ang mga ibinahagi sa InstaSOS.\nUpang magbahagi ng higit pang mga contact, pumunta sa iOS Settings -> Apps -> InstaSOS';

  @override
  String get hsNumError =>
      'Ang contact ay pribado o walang numero ng telepono.';

  @override
  String get rsSharedHeader => 'May karapatan kang...';

  @override
  String get rsOnFoot => 'Habang naglalakad';

  @override
  String get rsWhileDriving => 'Habang nagmamaneho';

  @override
  String get rsAtHome => 'Habang nasa bahay';

  @override
  String get rsSharedRemainSilent =>
      'Manahimik. Huwag magsinungaling, pero hindi mo kailangang sumagot sa mga tanong.';

  @override
  String get rsSharedDocument =>
      'I-dokumento ang lahat. May karapatan kang kumuha ng larawan, mag-record ng video, at mag-record ng audio.';

  @override
  String get rsMobilePockets =>
      'Tumangging ipasuri ang iyong bulsa. Puwedeng kapkapan ka ng ICE, pero hindi puwedeng maghalughog.';

  @override
  String get rsMobileQuestion => 'Magtanong. Alamin kung bakit ka pinahinto.';

  @override
  String get rsMobileLeave => 'Umalis ka kung hindi ka pinipigilan.';

  @override
  String get rsDriveSearch => 'Tumangging ipasuri ang iyong sasakyan.';

  @override
  String get rsDriveID =>
      'Tumangging magbigay ng ID bilang pasahero. Tanging driver lang ang kailangang magbigay ng ID.';

  @override
  String get rsDriveWarrant =>
      'Magtanong kung may warrant ang mga opisyal. May karapatan kang makita ito. Kung walang pirma ng hukom, wala itong bisa.';

  @override
  String get rsHomeWarrant =>
      'Panatilihing nakasara ang pinto. Kung may warrant, hilingin na ipasok ito sa ilalim ng pinto. Kung walang pirma ng hukom, wala itong bisa. Panatilihing nakasara ang pinto.';

  @override
  String get rsSharedSign => 'Tumangging pumirma ng anuman.';

  @override
  String get rsSharedFingerprint =>
      'Tumangging magpa-fingerprint sa ICE maliban kung inaaresto ka.';

  @override
  String get rsSharedLawyer =>
      'Kumonsulta sa abogado. Kung pormal kang naaresto, may karapatan kang bigyan ng abogado ng korte.';

  @override
  String get ssAutoShare => 'Auto-share ng media';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Hitsura';

  @override
  String get ssResources => 'Resources';

  @override
  String get rsCommunity => 'Community resources';

  @override
  String get rsGov => 'US government resources';

  @override
  String get rsAffiliate => 'None are affiliated with Empathetech LLC';

  @override
  String get rsAffiliateFix => 'None are affiliated with Empathetic LLC';

  @override
  String get ssSupport => 'Support';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Paano binuo ang listahan ng mga karapatan?';

  @override
  String get faqListA1 =>
      'Ang listahan ng mga karapatan ay tinipon mula sa ilang pampublikong sanggunian, kabilang ang:';

  @override
  String get faqListA2 => 'Isa pang kapaki-pakinabang na sanggunian: ';

  @override
  String get faqSettings => 'Para saan ang mga settings?';

  @override
  String get faqOnOpen =>
      'SOS sa pagbukas: kapag naka-enable, magsisimula agad ang SOS broadcast pagkalunsad ng app. Hindi inirerekomenda para sa karamihan, dahil maaari itong magdulot ng aksidenteng broadcast.';

  @override
  String get faqOnInterrupt =>
      'SOS kapag naantala ang recording: kapag naka-enable, kung aktibo ang video recording at nawala sa focus ang InstaSOS sa anumang dahilan (na-minimize, lumipat ng app, namatay ang screen), magsisimula ang SOS broadcast.\nInirerekomendang i-enable ito o ang \"SOS sa pag-sarado\" (o pareho).';

  @override
  String get faqAutoShare =>
      'Auto-share media: kapag naka-enable, lalabas ang mga native share option sa oras na matapos ang video o makakuha ng litrato.';

  @override
  String get faqEMC =>
      'Emergency contacts: ang mga taong padadalhan ng iyong lokasyon habang aktibo ang isang SOS broadcast.';

  @override
  String get faqLink =>
      'Uri ng link: paano ipadadala ang iyong lokasyon sa iyong emergency contacts. Ang \"Google Maps\", \"Apple Maps\", at \"Waze\" ay magpapadala ng naki-click na link para sa kaukulang serbisyo. Ang \"Coordinates\" ay magpapadala ng iyong latitude at longitude bilang plain text.';

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
  String get faqPrivateContact =>
      'Ang contact ay pribado o walang numero ng telepono?';

  @override
  String get faqContactPermissions =>
      'Kung natanggap mo ang mensaheng ito habang nagdadagdag ng emergency contact, walang pahintulot ang InstaSOS na i-access ang contact na iyon.';

  @override
  String get faqUpdateContacts =>
      'Maaari mong i-update ang contact permissions sa ';

  @override
  String get faqOSSettings => 'iOS settings';

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
  String get faqOnCloseWarning =>
      'Naka-enable ang \"SOS sa pag-sarado\". Magsisimula ito ng broadcast.';

  @override
  String get bsEMC => 'Emergency contacts';

  @override
  String get bsRemoveHint => 'Remove contact';

  @override
  String get bsAddHint => 'Add another contact';

  @override
  String get bsLinkType => 'Link type';

  @override
  String get bsSOSOnOpen => 'SOS on open';

  @override
  String get bsSOSOnClose => 'SOS on close';

  @override
  String get bsSOSOnCloseHint =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsCloseOffWarning =>
      'The app will auto-close to prevent unintentional broadcasts.';

  @override
  String get bsVideoSOS => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'Isang larawan ng Statue of Liberty, na may preview ng listahan ng mga karapatan.';
}
