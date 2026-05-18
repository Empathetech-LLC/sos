// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class LangSw extends Lang {
  LangSw([String locale = 'sw']) : super(locale);

  @override
  String get gOk => 'Sawa';

  @override
  String get gDone => 'Tayari';

  @override
  String get gReminder => 'Kikumbusho';

  @override
  String get gSystem => 'Mipangilio ya mfumo';

  @override
  String get gNotAgain => 'Usionyeshe tena';

  @override
  String get gOnCloseWarning =>
      '\"SOS unapofunga\" imewashwa. Hii itaanzisha tangazo.';

  @override
  String get sosLastKnown => 'eneo la mwisho linalojulikana:';

  @override
  String get sosNeedSMS => 'SOS inahitaji ruhusa ya SMS (kutuma ujumbe).';

  @override
  String get sosDisabled => 'Haiwezi kufikia eneo (imezimwa)';

  @override
  String get sosDenied => 'Haiwezi kufikia eneo (imekataliwa)';

  @override
  String get sosError => 'Haiwezi kufikia eneo (hitilafu)';

  @override
  String get hsWelcome => 'Karibu kwenye InstaSOS';

  @override
  String get hsWelcomeFix => 'Karibu kwenye Insta-SOS';

  @override
  String get hsAppIntro =>
      'Kuanza, hii ni programu ya Jua Haki Zako pekee.\nUnaweza kuwezesha zana zaidi kwa kuzipa ruhusa katika orodha iliyo hapa chini.';

  @override
  String get hsAppIntroAlt =>
      'Sasisho la hivi karibuni lilikuwa kubwa, hebu tuhakikishe kila kitu kiko tayari hapa chini.';

  @override
  String get hsYourApp => 'Unaweza kubadilisha nia/ruhusa zako wakati wowote.';

  @override
  String get hsHybridTranslation =>
      'Mafunzo na mipangilio imetafsiriwa na mashine.\nOrodha ya haki imetafsiriwa na binadamu.';

  @override
  String get hsCamMic => 'Kamera na Maikrofoni';

  @override
  String get hsAddRecording => 'Huwezesha kurekodi video.';

  @override
  String get hsGallery => 'Matunzio';

  @override
  String get hsAddSave => 'Inahitajika ili kuhifadhi rekodi zako.';

  @override
  String get hsCameraReady => 'Kamera iko tayari';

  @override
  String get hsCameraSetupHint =>
      'Washa ili kupa Insta-SOS ruhusa kwenye kamera.';

  @override
  String get hsContacts => 'Wasiliani';

  @override
  String get hsAddContacts =>
      'Sehemu ya 1 ya kuwezesha arifa za dharura kwa wasiliani.';

  @override
  String get hsAddContactsIOS => 'Huwezesha arifa za dharura kwa wasiliani.';

  @override
  String get hsContactsReady => 'Wasiliani wako tayari';

  @override
  String get hsContactsSetupHint =>
      'Washa ili kupa Insta-SOS ruhusa ya kutazama wasiliani wako.';

  @override
  String get hsAppleContacts =>
      'Hatua hii ni kwa ajili ya ruhusa za programu pekee.\nBado huchagui wasiliani wa dharura.\n\nInapendekezwa kuruhusu wote ili kupunguza usumbufu.';

  @override
  String get hsTexting => 'Kutuma ujumbe';

  @override
  String get hsAddTexting =>
      'Sehemu ya 2 ya kuwezesha arifa za dharura kwa wasiliani.';

  @override
  String get hsTextingReady => 'Kutuma ujumbe kuko tayari';

  @override
  String get hsTextingSetupHint =>
      'Washa ili kupa Insta-SOS ruhusa ya kutuma ujumbe.';

  @override
  String get hsLocation => 'Eneo';

  @override
  String get hsUnable => 'Imeshindwa kutambua';

  @override
  String get hsAddLocation =>
      'Huwezesha kushiriki eneo na wasiliani wa dharura.';

  @override
  String get hsAddAlways =>
      'Inapendekezwa kuwezesha kila wakati. Bonyeza tena ili kufungua Mipangilio ya Mfumo.';

  @override
  String get hsLocationReady => 'Eneo liko tayari';

  @override
  String get hsLocationSetupHint =>
      'Washa ili kupa Insta-SOS ruhusa ya kutazama eneo lako.';

  @override
  String get hsOneOfFour => 'Ya kwanza kati ya nne. Endelea...';

  @override
  String get hsBroadcastTutorial =>
      'Washa SOS ili kutuma ujumbe kiotomatiki kwa wasiliani wako wa dharura.\n\nWakati InstaSOS ina idhini ya kufikia eneo lako, litajumuishwa kwenye ujumbe.';

  @override
  String get hsBroadcastTutorialFix =>
      'Washa SOS ili kutuma ujumbe kiotomatiki kwa wasiliani wako wa dharura.\n\nWakati Insta-SOS ina idhini ya kufikia eneo lako, litajumuishwa kwenye ujumbe.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Ujumbe utaendelea wakati simu imefungwa.\n\nZima SOS wewe mwenyewe au funga programu kabisa ili kusimamisha ujumbe.';

  @override
  String get hsTwoOfFour => 'Ya pili kati ya nne. Endelea...';

  @override
  String get hsSettingsTutorial =>
      '- Sanidi utangazaji wako wa SOS\n- Geuza kukufaa mwonekano wa programu\n- Fikia nyenzo na usaidizi zaidi\n\nkwenye mipangilio.';

  @override
  String get hsSettingsTutorialFix =>
      'Unaweza kusanidi utangazaji wako wa SOS, kugeuza kukufaa mwonekano wa programu, na kufikia nyenzo/usaidizi zaidi kwenye mipangilio.';

  @override
  String get hsThreeOfFour => 'Ya tatu kati ya nne. Endelea...';

  @override
  String get hsVideoTutorial =>
      'Unapopiga picha au kurekodi video, unaweza kuishiriki mara moja.\n\nKwa chaguo-msingi, ikiwa kurekodi kutakatizwa, tangazo la SOS litaanza kiotomatiki.\n\nBonyeza kwa muda mrefu onyesho la kukagua la kamera ili kuonyesha/kuficha haki zako.';

  @override
  String get hsIOSVideoTutorial =>
      'Unapopiga picha au kurekodi video, unaweza kuishiriki mara moja.\n\nBonyeza kwa muda mrefu onyesho la kukagua la kamera ili kuonyesha/kuficha haki zako.';

  @override
  String get hsTutorialComplete => 'Mafunzo yamekamilika';

  @override
  String get hsAddEMC =>
      'Ikiwa unatumia arifa za SOS, tafadhali nenda kwenye ukurasa wa mipangilio na uongeze wasiliani wako wa dharura.';

  @override
  String get hsStartSOS => 'Washa ili kuanzisha tangazo la SOS.';

  @override
  String get hsEndSOS => 'SOS inatangaza. Washa ili kusimamisha.';

  @override
  String get hsSafeCloseHint => 'Shwari kabisa. Funga programu bila SOS.';

  @override
  String get hsBroadcasting => 'Inatangaza';

  @override
  String get hsStop => 'Simamisha';

  @override
  String get hsCameraHint => 'Piga picha.';

  @override
  String get hsPreviewHint =>
      'Bonyeza kwa muda mrefu ili kuonyesha/kuficha haki zako.';

  @override
  String get hsShowRights => 'Onyesha haki zako.';

  @override
  String get hsHideRights => 'Ficha haki zako.';

  @override
  String get hsStartRecord => 'Rekodi video.';

  @override
  String get hsEndRecord => 'Maliza kurekodi.';

  @override
  String get hsFlashOff =>
      'Mwangaza Umezimwa. Washa ili kuwasha mwangaza kiotomatiki.';

  @override
  String get hsFlashAuto => 'Mwangaza kiotomatiki. Washa ili kuwasha mwangaza.';

  @override
  String get hsFlashOn => 'Mwangaza umewashwa. Washa ili kuzima mwangaza.';

  @override
  String get hsFlashTorch => 'Hali ya tochi. Washa ili kuzima mwangaza.';

  @override
  String get hsNoFlash => 'Mwangaza wa kamera haufanyi kazi';

  @override
  String get rvSharedHeader => '';

  @override
  String get rvOnFoot => '';

  @override
  String get rvWhileDriving => '';

  @override
  String get rvAtHome => '';

  @override
  String get rvSharedRemainSilent => '';

  @override
  String get rvSharedDocument => '';

  @override
  String get rvMobilePockets => '';

  @override
  String get rvMobileQuestion => '';

  @override
  String get rvMobileLeave => '';

  @override
  String get rvDriveSearch => '';

  @override
  String get rvDriveID => '';

  @override
  String get rvDriveWarrant => '';

  @override
  String get rvHomeWarrant => '';

  @override
  String get rvSharedSign => '';

  @override
  String get rvSharedFingerprint => '';

  @override
  String get rvSharedLawyer => '';

  @override
  String get ssAutoShare => 'Shiriki picha/video kiotomatiki';

  @override
  String get ssSOS => 'Mipangilio ya SOS';

  @override
  String get ssAppearance => 'Mipangilio ya mwonekano';

  @override
  String get ssPermissions => 'Ruhusa';

  @override
  String get ssResources => 'Nyenzo';

  @override
  String get ssSupport => 'Usaidizi';

  @override
  String get pmOnlyAdd => 'Zana hii inasaidia tu kuongeza ruhusa.';

  @override
  String get pmRemoveIn => 'Unaweza kuondoa ruhusa katika ';

  @override
  String get pmManualPermission =>
      'Ukiondoa ruhusa katika mipangilio ya mfumo, lazima zirejeshwe hapo pia.';

  @override
  String get rmCommunity => 'Nyenzo za jamii';

  @override
  String get rmGov => 'Nyenzo za serikali ya Marekani';

  @override
  String get rmAffiliate => 'Hakuna inayohusishwa na Empathetech LLC';

  @override
  String get rmAffiliateFix => 'Hakuna inayohusishwa na Empathetic LLC';

  @override
  String get faqName => 'Maswali Yanayoulizwa Mara kwa Mara';

  @override
  String get faqListQ => 'Orodha ya haki ilitengenezwaje?';

  @override
  String get faqListA =>
      'Orodha ya haki ilichukuliwa kutoka kwa nyenzo kadhaa za umma, ikiwa ni pamoja na:';

  @override
  String get faqSettings => 'Mipangilio inafanyaje kazi?';

  @override
  String get faqAutoShareA =>
      ' inatumia kipengele cha kushiriki kilichojengewa ndani ya simu yako. Haitumii wasiliani wako wa dharura uliohifadhiwa (kama wapo). Kushiriki ni kwa hiari na kunaweza kufutwa wakati wowote.';

  @override
  String get faqLinkA =>
      ' jinsi eneo lako litakavyowasilishwa kwa wasiliani wako wa dharura. \"Google Maps\", \"Apple Maps\", na \"Waze\" zitatuma kiungo kinachoweza kubofanywa kwa huduma husika. \"Coordinates\" itatuma latitudo na longitudo yako kama maandishi ya kawaida.';

  @override
  String get faqOnOpenA =>
      ' tangazo la SOS litaanza mara moja unapofungua programu. Haipendekezwi kwa watumiaji wengi, kwani inaweza kusababisha matangazo kwa bahati mbaya.';

  @override
  String get faqOnInterruptA =>
      ' ikiwa video inarekodiwa na InstaSOS inakatizwa, tangazo la SOS litaanza. Kukatizwa maana yake ni: kupunguza programu, kubadilisha programu, na/au kufunga skrini. Inapendekezwa kuwezesha hii au \"SOS unapofunga\" (au zote mbili).';

  @override
  String get faqOnInterruptAFix =>
      ' ikiwa video inarekodiwa na Insta-SOS inakatizwa, tangazo la SOS litaanza. Kukatizwa maana yake ni: kupunguza programu, kubadilisha programu, na/au kufunga skrini. Inapendekezwa kuwezesha hii au \"SOS unapofunga\" (au zote mbili).';

  @override
  String get faqUnavailable => 'SOS inasema \"Eneo halipatikani\"?';

  @override
  String get faqReliability =>
      'Ili kuboresha utegemezi wa SOS, tafadhali wezesha \"Ruhusu wakati wote\" katika ';

  @override
  String get faqLocationPermissions => 'ruhusa za eneo';

  @override
  String get faqLocationTrust =>
      'Programu inatumia tu eneo lako wakati tangazo la SOS linaendelea. Wala InstaSOS au Empathetech LLC haifuatilii, haihifadhi, au kuuza data ya mtumiaji.';

  @override
  String get faqLocationTrustFix =>
      'Programu inatumia tu eneo lako wakati tangazo la SOS linaendelea. Wala Insta-SOS au Empathetic LLC haifuatilii, haihifadhi, au kuuza data ya mtumiaji.';

  @override
  String get faqContactPermissions =>
      'Ukipata ujumbe huu wakati wa kuongeza mwasiliani wa dharura, InstaSOS haina ruhusa ya kufikia mwasiliani huyo mahususi.';

  @override
  String get faqContactPermissionsFix =>
      'Ukipata ujumbe huu wakati wa kuongeza mwasiliani wa dharura, Insta-SOS haina ruhusa ya kufikia mwasiliani huyo mahususi.';

  @override
  String get faqUpdateContacts =>
      'Unaweza kutoa idhini ya kufikia wasiliani zaidi (au wote) katika ';

  @override
  String get faqSplitClarity1 =>
      'Kutoa idhini ya kufikia mwasiliani hakumfanyi kuwa mwasiliani wa dharura. Ni nambari tu zilizoorodheshwa katika ';

  @override
  String get faqSplitClarity2 =>
      ' zitawasiliana nazo wakati wa tangazo la SOS.';

  @override
  String get faqMissing => 'Kwa nini baadhi ya vipengele vya Android havipo?';

  @override
  String get faqRestricted =>
      'Vipengele ambavyo havipo vinahitaji otomatiki ya SMS, na Apple hairuhusu wasanidi programu kufanya ujumbe wa maandishi kuwa wa kiotomatiki (bila huduma ya kulipia).';

  @override
  String get faqShortcuts =>
      'Vipi kuhusu njia za mkato za iOS?\nPia kuna vizuizi vya kufikia njia za mkato za mtumiaji, ambazo zingeharibu vipengele muhimu. Kimsingi: ingekatiza kurekodi video.';

  @override
  String get faqLanguages => 'Kwa nini lugha X haipatikani?';

  @override
  String get faqResponsible =>
      'Ingekuwa kutowajibika kutumia tafsiri ya mashine kwa orodha ya haki. Tafadhali fikiria ';

  @override
  String get faqContributing => 'kuchangia';

  @override
  String get faqExpand => ' ili kusaidia kupanua chaguo za lugha.';

  @override
  String get faqReset => 'Weka upya mafunzo';

  @override
  String get faqContact => 'Wasiliana na usaidizi';

  @override
  String get faqContactHint => 'Tuma barua pepe kwa Empathetic LLC';

  @override
  String get bsEMC => 'Wasiliani wa dharura';

  @override
  String get bsAddSomeone => 'Ongeza mtu ili kuwezesha SOS';

  @override
  String get bsRemoveHint => 'Ondoa mwasiliani';

  @override
  String get bsAddHint => 'Ongeza mwasiliani mwingine';

  @override
  String get bsLinkType => 'Aina ya kiungo cha eneo';

  @override
  String get bsSnackRequest => 'Tafadhali ongeza wasiliani wa dharura';

  @override
  String get bsNeedPermission => 'Huwezi kuongeza wasiliani bila ruhusa';

  @override
  String get bsPartialContacts =>
      'Apple itaonyesha wasiliani wote, si tu wale walioshirikiwa na InstaSOS.\nIli kushiriki wasiliani zaidi, fungua ';

  @override
  String get bsPartialContactsFix =>
      'Apple itaonyesha wasiliani wote, si tu wale walioshirikiwa na Insta-SOS.\nIli kushiriki wasiliani zaidi, fungua ';

  @override
  String get bsNumError =>
      'Mwasiliani huyu ni wa faragha au hana nambari ya simu.';

  @override
  String get bsSOSOnOpen => 'SOS unapofungua';

  @override
  String get bsSOSOnClose => 'SOS unapofunga';

  @override
  String get bsSOSOnCloseHint =>
      'Kitufe salama cha kufunga (kidole gumba juu) kitaonekana kwenye ukurasa wa nyumbani, kinyume na mipangilio.\nIkiwa InstaSOS itakatizwa kwa sababu yoyote isipokuwa kitufe salama cha kufunga (kupunguzwa, kubadilishwa programu, skrini kuzima), tangazo la SOS litaanza.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Kitufe salama cha kufunga (kidole gumba juu) kitaonekana kwenye ukurasa wa nyumbani, kinyume na mipangilio.\nIkiwa Insta-SOS itakatizwa kwa sababu yoyote isipokuwa kitufe salama cha kufunga (kupunguzwa, kubadilishwa programu, skrini kuzima), tangazo la SOS litaanza.';

  @override
  String get bsCloseOffWarning =>
      'Programu itajifunga yenyewe ili kuzuia matangazo yasiyokusudiwa.';

  @override
  String get bsSOSOnVideo => 'SOS kwenye kurekodi kulikokatizwa';

  @override
  String get dsLadyLiberty =>
      'Picha ya Sanamu ya Uhuru, na onyesho la kukagua la orodha ya haki.';

  @override
  String get dsShowBack => 'Onyesha kitufe cha nyuma?';
}
