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
  String get gDone => 'Tapos na';

  @override
  String get gReminder => 'Paalala';

  @override
  String get gSystem => 'Mga setting ng system';

  @override
  String get gNotAgain => 'Huwag nang ipakita muli';

  @override
  String get gOnCloseWarning =>
      'Naka-enable ang \"SOS on close\". Magsisimula ito ng broadcast.';

  @override
  String get sosLastKnown => 'huling kilalang lokasyon:';

  @override
  String get sosNeedSMS => 'Kailangan ng SOS ng pahintulot sa SMS (pagte-text).';

  @override
  String get sosDisabled => 'Hindi ma-access ang lokasyon (na-disable)';

  @override
  String get sosDenied => 'Hindi ma-access ang lokasyon (tinanggihan)';

  @override
  String get sosError => 'Hindi ma-access ang lokasyon (error)';

  @override
  String get hsWelcome => 'Maligayang pagdating sa InstaSOS';

  @override
  String get hsWelcomeFix => 'Maligayang pagdating sa Insta-SOS';

  @override
  String get hsAppIntro =>
      'Upang magsimula, isa lamang itong Know Your Rights app.\nMaaari kang mag-enable ng higit pang mga tool sa pamamagitan ng pagbibigay sa kanila ng pahintulot sa listahan sa ibaba.';

  @override
  String get hsAppIntroAlt =>
      'Ang pinakabagong update ay napakalaki, tiyaking handa na ang lahat sa ibaba.';

  @override
  String get hsYourApp => 'Maaari mong baguhin ang iyong isip/mga pahintulot anumang oras.';

  @override
  String get hsHybridTranslation =>
      'Ang tutorial at mga setting ay isinalin ng makina.\nAng listahan ng mga karapatan ay isinalin ng tao.';

  @override
  String get hsCamMic => 'Camera at Mikropono';

  @override
  String get hsAddRecording => 'Pina-enable ang pag-record ng video.';

  @override
  String get hsGallery => 'Gallery';

  @override
  String get hsAddSave => 'Kinakailangan upang i-save ang iyong mga recording.';

  @override
  String get hsCameraReady => 'Handa na ang camera';

  @override
  String get hsCameraSetupHint =>
      'I-activate para bigyan ang Insta-SOS ng pahintulot sa camera.';

  @override
  String get hsContacts => 'Mga Contact';

  @override
  String get hsAddContacts => 'Unang bahagi ng pag-enable sa mga alerto sa emergency contact.';

  @override
  String get hsAddContactsIOS => 'Pina-enable ang mga alerto sa emergency contact.';

  @override
  String get hsContactsReady => 'Handa na ang mga contact';

  @override
  String get hsContactsSetupHint =>
      'I-activate para bigyan ang Insta-SOS ng pahintulot na tingnan ang iyong mga contact.';

  @override
  String get hsAppleContacts =>
      'Ang hakbang na ito ay para lamang sa mga pahintulot sa app.\nHindi ka pa pumipili ng mga pang-emergency na contact.\n\nInirerekomenda na pahintulutan ang lahat upang mabawasan ang sakit ng ulo.';

  @override
  String get hsTexting => 'Pagte-text';

  @override
  String get hsAddTexting =>
      'Ikalawang bahagi ng pag-enable sa mga alerto sa emergency contact.';

  @override
  String get hsTextingReady => 'Handa na ang pagte-text';

  @override
  String get hsTextingSetupHint =>
      'I-activate para bigyan ang Insta-SOS ng pahintulot na magpadala ng mga mensahe.';

  @override
  String get hsLocation => 'Lokasyon';

  @override
  String get hsUnable => 'Hindi matukoy';

  @override
  String get hsAddLocation => 'Pina-enable ang pagbahagi ng lokasyon sa mga emergency contact.';

  @override
  String get hsAddAlways =>
      'Inirerekomendang i-enable palagi. Pindutin muli para buksan ang Mga Setting ng System.';

  @override
  String get hsLocationReady => 'Handa na ang lokasyon';

  @override
  String get hsLocationSetupHint =>
      'I-activate para bigyan ang Insta-SOS ng pahintulot na tingnan ang iyong lokasyon.';

  @override
  String get hsOneOfFour => 'Una sa apat. Magpatuloy...';

  @override
  String get hsBroadcastTutorial =>
      'I-activate ang SOS para awtomatikong i-text ang iyong mga emergency contact.\n\nKapag may access ang InstaSOS sa iyong lokasyon, isasama ito sa mga text.';

  @override
  String get hsBroadcastTutorialFix =>
      'I-activate ang SOS para awtomatikong i-text ang iyong mga emergency contact.\n\nKapag may access ang Insta-SOS sa iyong lokasyon, isasama ito sa mga text.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Magpapatuloy ang mga text kapag naka-lock ang telepono.\n\nManu-manong i-deactivate ang SOS o ganap na isara ang app para ihinto ang mga text.';

  @override
  String get hsTwoOfFour => 'Ikalawa sa apat. Magpatuloy...';

  @override
  String get hsSettingsTutorial =>
      '- I-configure ang iyong SOS broadcast\n- I-customize ang anyo ng app\n- I-access ang higit pang mga mapagkukunan at suporta\n\nsa mga setting.';

  @override
  String get hsSettingsTutorialFix =>
      'Maaari mong i-configure ang iyong SOS broadcast, i-customize ang anyo ng app, at i-access ang higit pang mga mapagkukunan/suporta sa mga setting.';

  @override
  String get hsThreeOfFour => 'Ikatlo sa apat. Magpatuloy...';

  @override
  String get hsVideoTutorial =>
      'Kapag kumuha ka ng litrato o nag-record ng video, maaari mo itong ibahagi kaagad.\n\nBilang default, kung maantala ang isang recording, awtomatikong magsisimula ang isang SOS broadcast.\n\nPindutin nang matagal ang preview ng camera para ipakita/itago ang iyong mga karapatan.';

  @override
  String get hsIOSVideoTutorial =>
      'Kapag kumuha ka ng litrato o nag-record ng video, maaari mo itong ibahagi kaagad.\n\nPindutin nang matagal ang preview ng camera para ipakita/itago ang iyong mga karapatan.';

  @override
  String get hsTutorialComplete => 'Tapos na ang tutorial';

  @override
  String get hsAddEMC =>
      'Kung gumagamit ka ng mga SOS alert, mangyaring pumunta sa page ng mga setting at idagdag ang iyong mga emergency contact.';

  @override
  String get hsStartSOS => 'I-activate para simulan ang SOS broadcast.';

  @override
  String get hsEndSOS => 'Nagbo-broadcast ang SOS. I-activate para ihinto.';

  @override
  String get hsSafeCloseHint => 'Ligtas na ang lahat. Isara ang app nang walang SOS.';

  @override
  String get hsBroadcasting => 'Nagbo-broadcast';

  @override
  String get hsStop => 'Ihinto';

  @override
  String get hsCameraHint => 'Kumuha ng litrato.';

  @override
  String get hsPreviewHint =>
      'Pindutin nang matagal para ipakita/itago ang iyong mga karapatan.';

  @override
  String get hsShowRights => 'Ipakita ang iyong mga karapatan.';

  @override
  String get hsHideRights => 'Itago ang iyong mga karapatan.';

  @override
  String get hsStartRecord => 'Mag-record ng video.';

  @override
  String get hsEndRecord => 'Tapusin ang recording.';

  @override
  String get hsFlashOff => 'Naka-off ang flash. I-activate para i-on ang auto flash.';

  @override
  String get hsFlashAuto => 'Auto flash. I-activate para i-on ang flash.';

  @override
  String get hsFlashOn => 'Naka-on ang flash. I-activate para i-off ang flash.';

  @override
  String get hsFlashTorch => 'Torch mode. I-activate para i-off ang flash.';

  @override
  String get hsNoFlash => 'Hindi gumagana ang flash ng camera';

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
  String get ssAutoShare => 'Awtomatikong ibahagi ang mga litrato/video';

  @override
  String get ssSOS => 'Mga setting ng SOS';

  @override
  String get ssAppearance => 'Mga setting ng anyo';

  @override
  String get ssPermissions => 'Mga Pahintulot';

  @override
  String get ssResources => 'Mga Mapagkukunan';

  @override
  String get ssSupport => 'Suporta';

  @override
  String get pmOnlyAdd => 'Nakakatulong lamang ang tool na ito na magdagdag ng mga pahintulot.';

  @override
  String get pmRemoveIn => 'Maaari mong alisin ang mga pahintulot sa ';

  @override
  String get pmManualPermission =>
      'Kung aalisin mo ang mga pahintulot sa mga setting ng system, dapat din itong ibalik doon.';

  @override
  String get rmCommunity => 'Mga mapagkukunan ng komunidad';

  @override
  String get rmGov => 'Mga mapagkukunan ng gobyerno ng US';

  @override
  String get rmAffiliate => 'Wala sa mga ito ang may kaugnayan sa Empathetech LLC';

  @override
  String get rmAffiliateFix => 'Wala sa mga ito ang may kaugnayan sa Empathetic LLC';

  @override
  String get faqName => 'Mga FAQ';

  @override
  String get faqListQ => 'Paano ginawa ang listahan ng mga karapatan?';

  @override
  String get faqListA =>
      'Ang listahan ng mga karapatan ay kinuha mula sa ilang mga pampublikong mapagkukunan, kabilang ang:';

  @override
  String get faqSettings => 'Paano gumagana ang mga setting?';

  @override
  String get faqAutoShareA =>
      ' ay gumagamit ng built-in na share ng iyong telepono. Hindi nito ginagamit ang iyong naka-save na mga emergency contact (kung mayroon man). Ang pagbabahagi ay opsyonal at maaaring palaging kanselahin.';

  @override
  String get faqLinkA =>
      ' kung paano ipapadala ang iyong lokasyon sa iyong mga emergency contact. Ang \"Google Maps\", \"Apple Maps\", at \"Waze\" ay magpapadala ng naki-click na link para sa kaukulang serbisyo. Ang \"Coordinates\" ay magpapadala ng iyong latitude at longitude bilang plain text.';

  @override
  String get faqOnOpenA =>
      ' magsisimula kaagad ang isang SOS broadcast pagkabukas ng app. Hindi inirerekomenda para sa karamihan ng mga user, dahil maaari itong magdulot ng aksidenteng mga broadcast.';

  @override
  String get faqOnInterruptA =>
      ' kung may nagre-record na video at nawalan ng focus ang InstaSOS, magsisimula ang isang SOS broadcast. Ang pagkawala ng focus ay: pag-minimize sa app, paglipat ng mga app, at/o pag-lock sa screen. Inirerekomendang i-enable ito o ang \"SOS on close\" (o pareho).';

  @override
  String get faqOnInterruptAFix =>
      ' kung may nagre-record na video at nawalan ng focus ang Insta-SOS, magsisimula ang isang SOS broadcast. Ang pagkawala ng focus ay: pag-minimize sa app, paglipat ng mga app, at/o pag-lock sa screen. Inirerekomendang i-enable ito o ang \"SOS on close\" (o pareho).';

  @override
  String get faqUnavailable => 'Sinasabi ng SOS na \"Hindi available ang lokasyon\"?';

  @override
  String get faqReliability =>
      'Upang mapabuti ang pagiging maaasahan ng SOS, mangyaring i-enable ang \"Payagan sa lahat ng oras\" sa ';

  @override
  String get faqLocationPermissions => 'mga pahintulot sa lokasyon';

  @override
  String get faqLocationTrust =>
      'Ginagamit lamang ng app ang iyong lokasyon habang aktibo ang isang SOS broadcast. Hindi sinusubaybayan, iniimbak, o ibinebenta ng InstaSOS o ng Empathetech LLC ang data ng user.';

  @override
  String get faqLocationTrustFix =>
      'Ginagamit lamang ng app ang iyong lokasyon habang aktibo ang isang SOS broadcast. Hindi sinusubaybayan, iniimbak, o ibinebenta ng Insta-SOS o ng Empathetic LLC ang data ng user.';

  @override
  String get faqContactPermissions =>
      'Kung makuha mo ang mensaheng ito kapag nagdadagdag ng emergency contact, walang pahintulot ang InstaSOS na i-access ang partikular na contact na iyon.';

  @override
  String get faqContactPermissionsFix =>
      'Kung makuha mo ang mensaheng ito kapag nagdadagdag ng emergency contact, walang pahintulot ang Insta-SOS na i-access ang partikular na contact na iyon.';

  @override
  String get faqUpdateContacts =>
      'Maaari kang magbigay ng access sa higit pang (o lahat ng) contact sa ';

  @override
  String get faqSplitClarity1 =>
      'Ang pagbibigay ng access sa isang contact ay hindi ginagawa silang emergency contact. Tanging ang mga numerong nakalista sa ';

  @override
  String get faqSplitClarity2 => ' ang kokontakin sa panahon ng isang SOS broadcast.';

  @override
  String get faqMissing => 'Bakit nawawala ang ilang mga feature sa Android?';

  @override
  String get faqRestricted =>
      'Ang mga nawawalang feature ay nangangailangan ng SMS automation, at hindi pinapayagan ng Apple ang mga developer na i-automate ang mga text message (nang walang binabayarang serbisyo).';

  @override
  String get faqShortcuts =>
      'Paano naman ang mga shortcut sa iOS?\nMayroon ding mga paghihigpit sa pag-access ng mga shortcut ng user, na makakasira sa mahahalagang feature. Pangunahin dito: aabalahin nito ang mga pag-record ng video.';

  @override
  String get faqLanguages => 'Bakit hindi available ang X na wika?';

  @override
  String get faqResponsible =>
      'Magiging iresponsable na gumamit ng machine translation para sa listahan ng mga karapatan. Mangyaring isaalang-alang ang ';

  @override
  String get faqContributing => 'pag-ambag';

  @override
  String get faqExpand => ' upang makatulong na palawakin ang mga opsyon sa wika.';

  @override
  String get faqReset => 'I-reset ang tutorial';

  @override
  String get faqContact => 'Makipag-ugnayan sa suporta';

  @override
  String get faqContactHint => 'I-email ang Empathetic LLC';

  @override
  String get bsEMC => 'Mga emergency contact';

  @override
  String get bsAddSomeone => 'Magdagdag ng tao para i-enable ang SOS';

  @override
  String get bsRemoveHint => 'Alisin ang contact';

  @override
  String get bsAddHint => 'Magdagdag ng isa pang contact';

  @override
  String get bsLinkType => 'Uri ng link sa lokasyon';

  @override
  String get bsSnackRequest => 'Mangyaring magdagdag ng mga emergency contact';

  @override
  String get bsNeedPermission => 'Hindi makapagdagdag ng mga contact nang walang pahintulot';

  @override
  String get bsPartialContacts =>
      'Ipapakita ng Apple ang lahat ng contact, hindi lang ang mga ibinahagi sa InstaSOS.\nUpang magbahagi ng higit pang mga contact, buksan ang ';

  @override
  String get bsPartialContactsFix =>
      'Ipapakita ng Apple ang lahat ng contact, hindi lang ang mga ibinahagi sa Insta-SOS.\nUpang magbahagi ng higit pang mga contact, buksan ang ';

  @override
  String get bsNumError => 'Ang contact na ito ay pribado o walang numero ng telepono.';

  @override
  String get bsSOSOnOpen => 'SOS pagkabukas';

  @override
  String get bsSOSOnClose => 'SOS pagsara';

  @override
  String get bsSOSOnCloseHint =>
      'Lilitaw ang isang ligtas na button sa pagsasara (thumbs up) sa home page, sa kabilang banda ng mga setting.\nKung mawalan ng focus ang InstaSOS sa anumang dahilan maliban sa ligtas na button sa pagsasara (na-minimize, lumipat ng app, naka-off ang screen), magsisimula ang isang SOS broadcast.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Lilitaw ang isang ligtas na button sa pagsasara (thumbs up) sa home page, sa kabilang banda ng mga setting.\nKung mawalan ng focus ang Insta-SOS sa anumang dahilan maliban sa ligtas na button sa pagsasara (na-minimize, lumipat ng app, naka-off ang screen), magsisimula ang isang SOS broadcast.';

  @override
  String get bsCloseOffWarning =>
      'Awtomatikong magsasara ang app para maiwasan ang mga hindi sinadyang broadcast.';

  @override
  String get bsSOSOnVideo => 'SOS sa naantalang pag-record';

  @override
  String get dsLadyLiberty =>
      'Isang litrato ng Statue of Liberty, na may preview ng listahan ng mga karapatan.';

  @override
  String get dsShowBack => 'Ipakita ang back button?';
}
