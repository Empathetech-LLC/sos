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
  String get hsPermissionsAlways =>
      'Itakda ang lokasyon sa \'laging payagan\'.\nGagamitin lamang ito habang aktibo ang SOS.';

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
  String get hsRightsTutorial =>
      'Kung pinapagana ang camera at kumukuha ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nBy default, kung maputol ang recording, awtomatikong maa-activate ang SOS.\n\nPindutin ang malyeteng icon o pindutin nang matagal ang gitna ng screen para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsIOSRightsTutorial =>
      'Kung pinapagana ang camera at kumukuha ng larawan o nag-rerecord ng video, maaari mo itong ibahagi agad.\n\nPindutin ang malyeteng icon o pindutin nang matagal ang gitna ng screen para ipakita ang listahan ng iyong mga karapatan.';

  @override
  String get hsNeedContacts =>
      'Kailangan ng InstaSOS ang access sa iyong mga contact para gumana nang maayos.';

  @override
  String get hsNoNumber => 'Dapat may numero ang contact.';

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
  String get rsMobileLeave => 'Umalis kung hindi ka inaaresto.';

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
  String get rsSharedSign =>
      'Tumangging pumirma sa ICE maliban kung inaaresto ka.';

  @override
  String get rsSharedFingerprint =>
      'Tumangging magpa-fingerprint sa ICE maliban kung inaaresto ka.';

  @override
  String get rsSharedLawyer =>
      'Kumonsulta sa abogado. Kung pormal kang naaresto, may karapatan kang bigyan ng abogado ng korte.';

  @override
  String get ssSOSOnOpen => 'SOS sa pagbukas';

  @override
  String get ssSOSOnClose => 'SOS sa pagsara';

  @override
  String get ssSOSOnCloseHint =>
      'Kapag naka-enable, makikita ang safe close button sa tapat ng settings.';

  @override
  String get ssVideoSOS => 'SOS sa naputol na recording';

  @override
  String get ssAutoShare => 'Auto-share ng media';

  @override
  String get ssEMC => 'Mga emergency contact';

  @override
  String get ssRemoveHint => 'Tanggalin ang contact';

  @override
  String get ssAddHint => 'Magdagdag ng isa pang contact';

  @override
  String get ssLinkType => 'Uri ng link';

  @override
  String get ssAppearance => 'Hitsura';
}
