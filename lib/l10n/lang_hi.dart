// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class LangHi extends Lang {
  LangHi([String locale = 'hi']) : super(locale);

  @override
  String get gOk => 'ठीक है';

  @override
  String get gDone => 'हो गया';

  @override
  String get gReminder => 'रिमाइंडर';

  @override
  String get gSystem => 'सिस्टम सेटिंग्स';

  @override
  String get gNotAgain => 'फिर से न दिखाएं';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" सक्षम है। इससे ब्रॉडकास्ट शुरू हो जाएगा।';

  @override
  String get sosLastKnown => 'अंतिम ज्ञात स्थान:';

  @override
  String get sosNeedSMS => 'SOS के लिए SMS (टेक्स्टिंग) की अनुमति आवश्यक है।';

  @override
  String get sosDisabled => 'स्थान तक नहीं पहुंच सकते (अक्षम है)';

  @override
  String get sosDenied => 'स्थान तक नहीं पहुंच सकते (अस्वीकार किया गया)';

  @override
  String get sosError => 'स्थान तक नहीं पहुंच सकते (त्रुटि)';

  @override
  String get hsWelcome => 'InstaSOS में आपका स्वागत है';

  @override
  String get hsWelcomeFix => 'Insta-SOS में आपका स्वागत है';

  @override
  String get hsAppIntro =>
      'शुरू करने के लिए, यह केवल \'अपने अधिकार जानें\' (Know Your Rights) ऐप है।\nआप नीचे दी गई सूची में उन्हें अनुमति देकर अधिक टूल सक्षम कर सकते हैं।';

  @override
  String get hsAppIntroAlt =>
      'नवीनतम अपडेट बड़ा था, आइए नीचे सुनिश्चित करें कि सब कुछ तैयार है।';

  @override
  String get hsYourApp => 'आप किसी भी समय अपना विचार/अनुमतियां बदल सकते हैं।';

  @override
  String get hsHybridTranslation =>
      'ट्यूटोरियल और सेटिंग्स का मशीन द्वारा अनुवाद किया गया है।\nअधिकारों की सूची का अनुवाद मानव द्वारा किया गया है।';

  @override
  String get hsCamMic => 'कैमरा और माइक्रोफ़ोन';

  @override
  String get hsAddRecording => 'वीडियो रिकॉर्डिंग सक्षम करता है।';

  @override
  String get hsGallery => 'गैलरी';

  @override
  String get hsAddSave => 'आपकी रिकॉर्डिंग सहेजने के लिए आवश्यक है।';

  @override
  String get hsCameraReady => 'कैमरा तैयार है';

  @override
  String get hsCameraSetupHint =>
      'Insta-SOS को कैमरे की अनुमति देने के लिए सक्रिय करें।';

  @override
  String get hsContacts => 'संपर्क';

  @override
  String get hsAddContacts => 'आपातकालीन संपर्क अलर्ट सक्षम करने का भाग 1।';

  @override
  String get hsAddContactsIOS => 'आपातकालीन संपर्क अलर्ट सक्षम करता है।';

  @override
  String get hsContactsReady => 'संपर्क तैयार हैं';

  @override
  String get hsContactsSetupHint =>
      'Insta-SOS को आपके संपर्क देखने की अनुमति देने के लिए सक्रिय करें。';

  @override
  String get hsAppleContacts =>
      'यह चरण केवल ऐप अनुमतियों के लिए है।\nआप अभी तक आपातकालीन संपर्क नहीं चुन रहे हैं।\n\nपरेशानी कम करने के लिए सभी को अनुमति देने की अनुशंसा की जाती है।';

  @override
  String get hsTexting => 'टेक्स्टिंग';

  @override
  String get hsAddTexting => 'आपातकालीन संपर्क अलर्ट सक्षम करने का भाग 2।';

  @override
  String get hsTextingReady => 'टेक्स्टिंग तैयार है';

  @override
  String get hsTextingSetupHint =>
      'Insta-SOS को संदेश भेजने की अनुमति देने के लिए सक्रिय करें।';

  @override
  String get hsLocation => 'स्थान';

  @override
  String get hsUnable => 'निर्धारित करने में असमर्थ';

  @override
  String get hsAddLocation =>
      'आपातकालीन संपर्कों के साथ स्थान साझाकरण सक्षम करता है।';

  @override
  String get hsAddAlways =>
      'हमेशा के लिए सक्षम करने की अनुशंसा की जाती है। सिस्टम सेटिंग्स खोलने के लिए फिर से दबाएं।';

  @override
  String get hsLocationReady => 'स्थान तैयार है';

  @override
  String get hsLocationSetupHint =>
      'Insta-SOS को अपना स्थान देखने की अनुमति देने के लिए सक्रिय करें।';

  @override
  String get hsOneOfFour => 'चार में से पहला। जारी रखें...';

  @override
  String get hsBroadcastTutorial =>
      'अपने आपातकालीन संपर्कों को स्वचालित रूप से टेक्स्ट करने के लिए SOS को सक्रिय करें।\n\nजब InstaSOS के पास आपके स्थान तक पहुंच होगी, तो इसे टेक्स्ट में शामिल किया जाएगा।';

  @override
  String get hsBroadcastTutorialFix =>
      'अपने आपातकालीन संपर्कों को स्वचालित रूप से टेक्स्ट करने के लिए SOS को सक्रिय करें।\n\nजब Insta-SOS के पास आपके स्थान तक पहुंच होगी, तो इसे टेक्स्ट में शामिल किया जाएगा।';

  @override
  String get hsBroadcastTutorialAndroid =>
      'फ़ोन लॉक होने पर भी टेक्स्ट जारी रहेंगे।\n\nटेक्स्ट को रोकने के लिए SOS को मैन्युअल रूप से निष्क्रिय करें या ऐप को पूरी तरह से बंद करें।';

  @override
  String get hsTwoOfFour => 'चार में से दूसरा। जारी रखें...';

  @override
  String get hsSettingsTutorial =>
      '- अपना SOS ब्रॉडकास्ट कॉन्फ़िगर करें\n- ऐप के स्वरूप को कस्टमाइज़ करें\n- अधिक संसाधनों और समर्थन तक पहुंचें\n\nसेटिंग्स में।';

  @override
  String get hsSettingsTutorialFix =>
      'आप सेटिंग्स में अपना SOS ब्रॉडकास्ट कॉन्फ़िगर कर सकते हैं, ऐप का स्वरूप कस्टमाइज़ कर सकते हैं, और अधिक संसाधनों/समर्थन तक पहुंच प्राप्त कर सकते हैं।';

  @override
  String get hsThreeOfFour => 'चार में से तीसरा। जारी रखें...';

  @override
  String get hsVideoTutorial =>
      'जब आप कोई चित्र लेते हैं या वीडियो रिकॉर्ड करते हैं, तो आप उसे तुरंत साझा कर सकते हैं।\n\nडिफ़ॉल्ट रूप से, यदि रिकॉर्डिंग बाधित होती है, तो एक SOS ब्रॉडकास्ट स्वचालित रूप से शुरू हो जाएगा।\n\nअपने अधिकार दिखाने/छिपाने के लिए कैमरा पूर्वावलोकन को देर तक दबाएं।';

  @override
  String get hsIOSVideoTutorial =>
      'जब आप कोई चित्र लेते हैं या वीडियो रिकॉर्ड करते हैं, तो आप उसे तुरंत साझा कर सकते हैं।\n\nअपने अधिकार दिखाने/छिपाने के लिए कैमरा पूर्वावलोकन को देर तक दबाएं।';

  @override
  String get hsTutorialComplete => 'ट्यूटोरियल पूरा हुआ';

  @override
  String get hsAddEMC =>
      'यदि आप SOS अलर्ट का उपयोग कर रहे हैं, तो कृपया सेटिंग्स पृष्ठ पर जाएं और अपने आपातकालीन संपर्क जोड़ें।';

  @override
  String get hsStartSOS => 'SOS ब्रॉडकास्ट शुरू करने के लिए सक्रिय करें।';

  @override
  String get hsEndSOS => 'SOS ब्रॉडकास्ट हो रहा है। रोकने के लिए सक्रिय करें।';

  @override
  String get hsSafeCloseHint => 'सब ठीक है। SOS के बिना ऐप बंद करें।';

  @override
  String get hsBroadcasting => 'ब्रॉडकास्ट हो रहा है';

  @override
  String get hsStop => 'रोकें';

  @override
  String get hsCameraHint => 'एक फ़ोटो लें।';

  @override
  String get hsPreviewHint => 'अपने अधिकार दिखाने/छिपाने के लिए देर तक दबाएं।';

  @override
  String get hsShowRights => 'अपने अधिकार दिखाएं।';

  @override
  String get hsHideRights => 'अपने अधिकार छिपाएं।';

  @override
  String get hsStartRecord => 'एक वीडियो रिकॉर्ड करें।';

  @override
  String get hsEndRecord => 'रिकॉर्डिंग समाप्त करें।';

  @override
  String get hsFlashOff =>
      'फ़्लैश बंद। ऑटो फ़्लैश चालू करने के लिए सक्रिय करें।';

  @override
  String get hsFlashAuto => 'ऑटो फ़्लैश। फ़्लैश चालू करने के लिए सक्रिय करें।';

  @override
  String get hsFlashOn => 'फ़्लैश चालू। फ़्लैश बंद करने के लिए सक्रिय करें।';

  @override
  String get hsFlashTorch => 'टॉर्च मोड। फ़्लैश बंद करने के लिए सक्रिय करें।';

  @override
  String get hsNoFlash => 'कैमरा फ़्लैश काम नहीं कर रहा है';

  @override
  String get rvSharedHeader => 'आपको यह अधिकार है कि...';

  @override
  String get rvOnFoot => 'पैदल चलते समय';

  @override
  String get rvWhileDriving => 'गाड़ी चलाते समय';

  @override
  String get rvAtHome => 'घर पर';

  @override
  String get rvSharedRemainSilent =>
      'चुप रहें। झूठ न बोलें, लेकिन आपके लिए सवालों का जवाब देना ज़रूरी नहीं है।';

  @override
  String get rvSharedDocument =>
      'हर चीज़ का रिकॉर्ड रखें। आपको तस्वीरें लेने, वीडियो रिकॉर्ड करने और ऑडियो रिकॉर्ड करने का अधिकार है।';

  @override
  String get rvMobilePockets =>
      'अपनी जेबों की तलाशी लेने देने से मना करें। ICE केवल ऊपर से तलाशी ले सकता है, लेकिन पूरी तलाशी नहीं।';

  @override
  String get rvMobileQuestion => 'सवाल पूछें। जानें कि आपको क्यों रोका गया है।';

  @override
  String get rvMobileLeave =>
      'अगर आपको हिरासत में नहीं लिया गया है, तो वहाँ से चले जाएँ।';

  @override
  String get rvDriveSearch => 'अपनी गाड़ी की तलाशी देने से मना करें।';

  @override
  String get rvDriveID =>
      'अगर आप यात्री हैं, तो पहचान पत्र देने से मना करें। केवल ड्राइवर के लिए पहचान पत्र देना ज़रूरी है।';

  @override
  String get rvDriveWarrant =>
      'पूछें कि क्या अधिकारियों के पास वारंट है। अगर है, तो आपको उसे देखने का अधिकार है। अगर किसी \"वारंट\" पर जज के हस्ताक्षर नहीं हैं, तो वह मान्य नहीं है।';

  @override
  String get rvHomeWarrant =>
      'दरवाज़ा बंद रखें। अगर उनके पास वारंट है, तो पहले उसे दरवाज़े के नीचे से सरकाने के लिए कहें। अगर किसी \"वारंट\" पर जज के हस्ताक्षर नहीं हैं, तो वह मान्य नहीं है। दरवाज़ा बंद रखें।';

  @override
  String get rvSharedSign => 'किसी भी दस्तावेज़ पर हस्ताक्षर करने से मना करें।';

  @override
  String get rvSharedFingerprint =>
      'जब तक आपको गिरफ्तार नहीं किया गया है, तब तक ICE को अपनी उंगलियों के निशान देने से मना करें।';

  @override
  String get rvSharedLawyer =>
      'वकील से सलाह लेने का अधिकार। अगर आपको औपचारिक रूप से गिरफ्तार किया गया है, तो आपको अदालत द्वारा नियुक्त वकील पाने का अधिकार है।';

  @override
  String get ssAutoShare => 'चित्र/वीडियो ऑटो-शेयर करें';

  @override
  String get ssSOS => 'SOS सेटिंग्स';

  @override
  String get ssAppearance => 'स्वरूप सेटिंग्स';

  @override
  String get ssPermissions => 'अनुमतियां';

  @override
  String get ssResources => 'संसाधन';

  @override
  String get ssSupport => 'समर्थन';

  @override
  String get pmOnlyAdd => 'यह टूल केवल अनुमतियां जोड़ने में मदद करता है।';

  @override
  String get pmRemoveIn => 'आप अनुमतियां यहां हटा सकते हैं: ';

  @override
  String get pmManualPermission =>
      'यदि आप सिस्टम सेटिंग्स में अनुमतियां हटाते हैं, तो उन्हें वहां भी पुनर्स्थापित किया जाना चाहिए।';

  @override
  String get rmCommunity => 'सामुदायिक संसाधन';

  @override
  String get rmGov => 'अमेरिकी सरकार के संसाधन';

  @override
  String get rmAffiliate => 'कोई भी Empathetech LLC से संबद्ध नहीं है';

  @override
  String get rmAffiliateFix => 'कोई भी Empathetic LLC से संबद्ध नहीं है';

  @override
  String get faqName => 'सामान्य प्रश्न';

  @override
  String get faqListQ => 'अधिकारों की सूची कैसे बनाई गई थी?';

  @override
  String get faqListA =>
      'अधिकारों की सूची कई सार्वजनिक संसाधनों से ली गई थी, जिनमें शामिल हैं:';

  @override
  String get faqSettings => 'सेटिंग्स कैसे काम करती हैं?';

  @override
  String get faqAutoShareA =>
      ' आपके फ़ोन के अंतर्निहित शेयर का उपयोग करता है। यह आपके सहेजे गए आपातकालीन संपर्कों (यदि कोई हो) का उपयोग नहीं करता है। साझा करना वैकल्पिक है और इसे हमेशा रद्द किया जा सकता है।';

  @override
  String get faqLinkA =>
      ' आपका स्थान आपके आपातकालीन संपर्कों तक कैसे पहुंचाया जाएगा। \"Google Maps\", \"Apple Maps\", और \"Waze\" संबंधित सेवा के लिए एक क्लिक करने योग्य लिंक भेजेंगे। \"Coordinates\" आपके अक्षांश और देशांतर को सादे पाठ के रूप में भेजेंगे।';

  @override
  String get faqOnOpenA =>
      ' ऐप लॉन्च होते ही SOS ब्रॉडकास्ट तुरंत शुरू हो जाएगा। अधिकांश उपयोगकर्ताओं के लिए अनुशंसित नहीं है, क्योंकि इससे आकस्मिक ब्रॉडकास्ट हो सकते हैं।';

  @override
  String get faqOnInterruptA =>
      ' यदि वीडियो रिकॉर्ड हो रहा है और InstaSOS का फ़ोकस हट जाता है, तो एक SOS ब्रॉडकास्ट शुरू हो जाएगा। फ़ोकस हटने का मतलब है: ऐप को छोटा करना, ऐप्स बदलना, और/या स्क्रीन को लॉक करना। इसे या \"SOS on close\" को (या दोनों को) सक्षम करने की अनुशंसा की जाती है।';

  @override
  String get faqOnInterruptAFix =>
      ' यदि वीडियो रिकॉर्ड हो रहा है और Insta-SOS का फ़ोकस हट जाता है, तो एक SOS ब्रॉडकास्ट शुरू हो जाएगा। फ़ोकस हटने का मतलब है: ऐप को छोटा करना, ऐप्स बदलना, और/या स्क्रीन को लॉक करना। इसे या \"SOS on close\" को (या दोनों को) सक्षम करने की अनुशंसा की जाती है।';

  @override
  String get faqUnavailable => 'SOS कहता है \"स्थान अनुपलब्ध\"?';

  @override
  String get faqReliability =>
      'SOS विश्वसनीयता में सुधार करने के लिए, कृपया यहां \"हर समय अनुमति दें\" सक्षम करें: ';

  @override
  String get faqLocationPermissions => 'स्थान अनुमतियां';

  @override
  String get faqLocationTrust =>
      'ऐप केवल तभी आपके स्थान का उपयोग करता है जब SOS ब्रॉडकास्ट सक्रिय होता है। न तो InstaSOS और न ही Empathetech LLC उपयोगकर्ता डेटा को ट्रैक करते हैं, सहेजते हैं, या बेचते हैं।';

  @override
  String get faqLocationTrustFix =>
      'ऐप केवल तभी आपके स्थान का उपयोग करता है जब SOS ब्रॉडकास्ट सक्रिय होता है। न तो Insta-SOS और न ही Empathetic LLC उपयोगकर्ता डेटा को ट्रैक करते हैं, सहेजते हैं, या बेचते हैं।';

  @override
  String get faqContactPermissions =>
      'यदि आपातकालीन संपर्क जोड़ते समय आपको यह संदेश मिलता है, तो InstaSOS के पास उस विशिष्ट संपर्क तक पहुंचने की अनुमति नहीं है।';

  @override
  String get faqContactPermissionsFix =>
      'यदि आपातकालीन संपर्क जोड़ते समय आपको यह संदेश मिलता है, तो Insta-SOS के पास उस विशिष्ट संपर्क तक पहुंचने की अनुमति नहीं है।';

  @override
  String get faqUpdateContacts =>
      'आप अधिक (या सभी) संपर्कों तक पहुंच प्रदान कर सकते हैं यहां: ';

  @override
  String get faqSplitClarity1 =>
      'किसी संपर्क तक पहुंच देने से वे आपातकालीन संपर्क नहीं बन जाते। केवल वे नंबर जो इसमें सूचीबद्ध हैं ';

  @override
  String get faqSplitClarity2 =>
      ' उनसे SOS ब्रॉडकास्ट के दौरान संपर्क किया जाएगा।';

  @override
  String get faqMissing => 'कुछ Android सुविधाएं क्यों गायब हैं?';

  @override
  String get faqRestricted =>
      'अनुपलब्ध सुविधाओं के लिए SMS स्वचालन की आवश्यकता होती है, और Apple डेवलपर्स को (भुगतान की गई सेवा के बिना) टेक्स्ट संदेशों को स्वचालित करने की अनुमति नहीं देता है।';

  @override
  String get faqShortcuts =>
      'iOS शॉर्टकट के बारे में क्या?\nउपयोगकर्ता शॉर्टकट तक पहुंचने पर भी प्रतिबंध हैं, जो महत्वपूर्ण सुविधाओं को तोड़ देंगे। मुख्य रूप से: यह वीडियो रिकॉर्डिंग को बाधित करेगा।';

  @override
  String get faqLanguages => 'X भाषा क्यों उपलब्ध नहीं है?';

  @override
  String get faqResponsible =>
      'अधिकारों की सूची के लिए मशीन अनुवाद का उपयोग करना गैर-जिम्मेदाराना होगा। कृपया विचार करें ';

  @override
  String get faqContributing => 'योगदान देने पर';

  @override
  String get faqExpand => ' भाषा विकल्पों का विस्तार करने में मदद करने के लिए।';

  @override
  String get faqReset => 'ट्यूटोरियल रीसेट करें';

  @override
  String get faqContact => 'समर्थन से संपर्क करें';

  @override
  String get faqContactHint => 'Empathetic LLC को ईमेल करें';

  @override
  String get bsEMC => 'आपातकालीन संपर्क';

  @override
  String get bsAddSomeone => 'SOS सक्षम करने के लिए किसी को जोड़ें';

  @override
  String get bsRemoveHint => 'संपर्क हटाएं';

  @override
  String get bsAddHint => 'एक और संपर्क जोड़ें';

  @override
  String get bsLinkType => 'स्थान लिंक का प्रकार';

  @override
  String get bsSnackRequest => 'कृपया आपातकालीन संपर्क जोड़ें';

  @override
  String get bsNeedPermission => 'अनुमति के बिना संपर्क नहीं जोड़े जा सकते';

  @override
  String get bsPartialContacts =>
      'Apple सभी संपर्क प्रदर्शित करेगा, न कि केवल InstaSOS के साथ साझा किए गए संपर्क।\nअधिक संपर्क साझा करने के लिए, खोलें ';

  @override
  String get bsPartialContactsFix =>
      'Apple सभी संपर्क प्रदर्शित करेगा, न कि केवल Insta-SOS के साथ साझा किए गए संपर्क।\nअधिक संपर्क साझा करने के लिए, खोलें ';

  @override
  String get bsNumError => 'यह संपर्क निजी है या इसमें फ़ोन नंबर नहीं है।';

  @override
  String get bsSOSOnOpen => 'खोलने पर SOS';

  @override
  String get bsSOSOnClose => 'बंद करने पर SOS';

  @override
  String get bsSOSOnCloseHint =>
      'सेटिंग्स के विपरीत, होम पेज पर एक सुरक्षित बंद (थंब्स अप) बटन दिखाई देगा।\nयदि सुरक्षित बंद बटन को छोड़कर किसी अन्य कारण से (छोटा किया गया, ऐप्स बदले गए, स्क्रीन बंद) InstaSOS का फ़ोकस हट जाता है, तो एक SOS ब्रॉडकास्ट शुरू हो जाएगा।';

  @override
  String get bsSOSOnCloseHintFix =>
      'सेटिंग्स के विपरीत, होम पेज पर एक सुरक्षित बंद (थंब्स अप) बटन दिखाई देगा।\nयदि सुरक्षित बंद बटन को छोड़कर किसी अन्य कारण से (छोटा किया गया, ऐप्स बदले गए, स्क्रीन बंद) Insta-SOS का फ़ोकस हट जाता है, तो एक SOS ब्रॉडकास्ट शुरू हो जाएगा।';

  @override
  String get bsCloseOffWarning =>
      'अनजाने ब्रॉडकास्ट को रोकने के लिए ऐप अपने आप बंद हो जाएगा।';

  @override
  String get bsSOSOnVideo => 'बाधित रिकॉर्डिंग पर SOS';

  @override
  String get dsLadyLiberty =>
      'स्टैच्यू ऑफ लिबर्टी की एक तस्वीर, जिसमें अधिकारों की सूची का पूर्वावलोकन है।';

  @override
  String get dsShowBack => 'बैक बटन दिखाएं?';
}
