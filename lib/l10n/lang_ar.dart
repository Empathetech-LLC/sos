// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class LangAr extends Lang {
  LangAr([String locale = 'ar']) : super(locale);

  @override
  String get gOk => 'حسنًا';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => 'تذكير';

  @override
  String get gSystem => 'System settings';

  @override
  String get gNotAgain => 'لا تظهر مرة أخرى';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => 'آخر موقع معروف';

  @override
  String get sosNeedSMS => 'تحتاج خدمة SOS إلى إذن SMS لتعمل بشكل صحيح.';

  @override
  String get sosDisabled => 'لا يمكن الوصول إلى الموقع (معطل)';

  @override
  String get sosDenied => 'لا يمكن الوصول إلى الموقع (مرفوض)';

  @override
  String get sosError => 'لا يمكن الوصول إلى الموقع (خطأ)';

  @override
  String get hsWelcome => 'مرحباً بكم في InstaSOS';

  @override
  String get hsWelcomeFix => 'مرحباً بكم في Insta-SOS';

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
      'The tutorial and settings are machine translated.\nThe rights list is human translated.';

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
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsBroadcastTutorialFix =>
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى Insta-SOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'The texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      'يمكنك...\n\n- إضافة المزيد من جهات الاتصال في حالات الطوارئ\n- إعداد خدمة SOS تلقائية\n- تغيير لغة التطبيق، و\n- تحديث مظهر التطبيق\n\nفي الإعدادات.\n\nاضغط باستمرار على زر الإعدادات لتقديم ملاحظات حول التطبيق.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، ستتمكن من مشاركته على الفور.\n\nافتراضيًا، إذا تمت مقاطعة التسجيل، فسيتم تنشيط SOS تلقائيًا.\n\nاضغط مطولًا على المعاينة المركزية لإظهار قائمة بحقوقك.';

  @override
  String get hsIOSVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، ستتمكن من مشاركته على الفور.\n\nاضغط لفترة طويلة على المعاينة المركزية لإظهار قائمة بحقوقك.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'قم بالتفعيل لبدء بث SOS.';

  @override
  String get hsEndSOS => 'يتم بث SOS. قم بتفعيله لإيقافه.';

  @override
  String get hsSafeCloseHint => 'كل شيء واضح. أغلق التطبيق بدون SOS.';

  @override
  String get hsBroadcasting => 'Broadcasting';

  @override
  String get hsStop => 'إيقاف';

  @override
  String get hsCameraHint => 'التقط صورة.';

  @override
  String get hsPreviewHint => 'اضغط لفترة طويلة لتبديل عرض حقوقك.';

  @override
  String get hsShowRights => 'أظهر حقوقك.';

  @override
  String get hsHideRights => 'إخفاء حقوقك.';

  @override
  String get hsStartRecord => 'سجل فيديو.';

  @override
  String get hsEndRecord => 'إنهاء التسجيل.';

  @override
  String get hsFlashOff => 'الفلاش معطل. قم بتفعيله لتشغيل الفلاش التلقائي.';

  @override
  String get hsFlashAuto => 'الفلاش تلقائي. قم بتفعيله لتشغيل الفلاش.';

  @override
  String get hsFlashOn => 'الفلاش يعمل. قم بتفعيله لإيقاف تشغيل الفلاش.';

  @override
  String get hsFlashTorch => 'وضع المصباح. قم بتفعيله لإيقاف تشغيل الفلاش.';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => 'لديك الحق في...';

  @override
  String get rvOnFoot => 'سيرا على الأقدام';

  @override
  String get rvWhileDriving => 'أثناء القيادة';

  @override
  String get rvAtHome => 'في البيت';

  @override
  String get rvSharedRemainSilent =>
      'التزم الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rvSharedDocument =>
      'وثّق كل شيء. لديك الحق في التقاط الصور وتسجيل الفيديوهات والتسجيل الصوتي.';

  @override
  String get rvMobilePockets =>
      'ارفض تفتيش جيوبك. يمكن لدائرة الهجرة والجمارك الأمريكية (ICE) إجراء تفتيش جسدي، ولكن ليس تفتيشًا داخليًا.';

  @override
  String get rvMobileQuestion => 'اطرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rvMobileLeave => 'إرحل إذا لم تكن تحت الإعتقال.';

  @override
  String get rvDriveSearch => 'ارفض تفتيش سيارتك.';

  @override
  String get rvDriveID =>
      'ارفض إبراز بطاقة هوية كراكب. السائق فقط هو المطلوب منه إبرازها.';

  @override
  String get rvDriveWarrant =>
      'اسأل إن كان لدى الضباط أمر تفتيش. يحق لك الاطلاع عليه إن وُجد. إذا لم يتم توقيع \"الأمر\" من قبل القاضي، فهو غير صالح.';

  @override
  String get rvHomeWarrant =>
      'أبقِ بابك مغلقًا. إذا كان لديهم أمر تفتيش، فاطلب منهم وضعه تحت الباب أولًا. إذا لم يكن \"الأمر\" موقّعًا من قاضٍ، فهو غير صالح. أبقِ بابك مغلقًا.';

  @override
  String get rvSharedSign => 'ارفض التوقيع على أي شيء.';

  @override
  String get rvSharedFingerprint =>
      'ارفض أن يتم أخذ بصمات أصابعك من قبل دائرة الهجرة والجمارك الأمريكية إلا إذا كنت تحت الاعتقال.';

  @override
  String get rvSharedLawyer =>
      'استشارة محامٍ. إذا تم اعتقالك رسميًا، يحق لك الاستعانة بمحامٍ تعينه المحكمة.';

  @override
  String get ssAutoShare => 'مشاركة الوسائط تلقائيًا';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'المظهر';

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
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA => 'تم تجميع قائمة الحقوق من عدة مصادر عامة، بما في ذلك:';

  @override
  String get faqSettings => 'ما هي وظيفة الإعدادات؟';

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
  String get faqUnavailable => 'الاستغاثة تقول \"الموقع غير متاح\"؟';

  @override
  String get faqReliability =>
      'لتحسين موثوقية الاستغاثة، يرجى تفعيل خيار \"السماح طوال الوقت\" في ';

  @override
  String get faqLocationPermissions => 'أذونات الموقع';

  @override
  String get faqLocationTrust =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث الاستغاثة. لا تقوم InstaSOS ولا Empathetech LLC بتتبع بيانات المستخدم أو تخزينها أو بيعها.';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetic LLC track, store, or sell user data.';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فهذا يعني أن InstaSOS ليس لديه إذن للوصول إلى جهة الاتصال تلك.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that specific contact.';

  @override
  String get faqUpdateContacts => 'يمكنك تحديث أذونات جهات الاتصال في ';

  @override
  String get faqSplitClarity1 =>
      'Giving access to a contact does not make them an emergency contact. Only the numbers listed in the ';

  @override
  String get faqSplitClarity2 => 'will be contacted during an SOS broadcast.';

  @override
  String get faqMissing => 'لماذا بعض ميزات Android مفقودة؟';

  @override
  String get faqRestricted =>
      'الميزات المفقودة تتطلب أتمتة الرسائل القصيرة (SMS)، ولا تسمح Apple للمطورين بأتمتة الرسائل النصية (بدون خدمة مدفوعة).';

  @override
  String get faqShortcuts =>
      'ماذا عن اختصارات iOS؟\nهناك أيضاً قيود على الوصول إلى اختصارات المستخدم، مما قد يؤدي إلى تعطيل ميزات حاسمة. بشكل أساسي: قد يؤدي ذلك إلى مقاطعة تسجيلات الفيديو.';

  @override
  String get faqLanguages => 'لماذا اللغة X غير متوفرة؟';

  @override
  String get faqResponsible =>
      'سيكون من غير المسؤول استخدام الترجمة الآلية لقائمة الحقوق. يرجى التفكير في ';

  @override
  String get faqContributing => 'المساهمة';

  @override
  String get faqExpand => ' للمساعدة في توسيع خيارات اللغة.';

  @override
  String get faqReset => 'إعادة تعيين الشرح التوضيحي';

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
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';

  @override
  String get dsShowBack => 'Show back button?';
}

/// The translations for Arabic, as used in Egypt (`ar_EG`).
class LangArEg extends LangAr {
  LangArEg() : super('ar_EG');

  @override
  String get gOk => 'حسنًا';

  @override
  String get gReminder => 'تذكير';

  @override
  String get gNotAgain => 'لا تظهر مرة أخرى';

  @override
  String get sosLastKnown => 'آخر موقع معروف';

  @override
  String get sosNeedSMS => 'تحتاج خدمة SOS إلى إذن SMS لتعمل بشكل صحيح.';

  @override
  String get sosDisabled => 'لا يمكن الوصول إلى الموقع (معطل)';

  @override
  String get sosDenied => 'لا يمكن الوصول إلى الموقع (مرفوض)';

  @override
  String get sosError => 'لا يمكن الوصول إلى الموقع (خطأ)';

  @override
  String get hsWelcome => 'مرحباً بكم في InstaSOS';

  @override
  String get hsWelcomeFix => 'مرحباً بكم في Insta-SOS';

  @override
  String get hsBroadcastTutorial =>
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsBroadcastTutorialFix =>
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى Insta-SOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsSettingsTutorial =>
      'يمكنك...\n\n- إضافة المزيد من جهات الاتصال في حالات الطوارئ\n- إعداد خدمة SOS تلقائية\n- تغيير لغة التطبيق، و\n- تحديث مظهر التطبيق\n\nفي الإعدادات.\n\nاضغط باستمرار على زر الإعدادات لتقديم ملاحظات حول التطبيق.';

  @override
  String get hsVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، ستتمكن من مشاركته على الفور.\n\nافتراضيًا، إذا تمت مقاطعة التسجيل، فسيتم تنشيط SOS تلقائيًا.\n\nاضغط مطولًا على المعاينة المركزية لإظهار قائمة بحقوقك.';

  @override
  String get hsIOSVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، ستتمكن من مشاركته على الفور.\n\nاضغط لفترة طويلة على المعاينة المركزية لإظهار قائمة بحقوقك.';

  @override
  String get hsStartSOS => 'قم بالتفعيل لبدء بث SOS.';

  @override
  String get hsEndSOS => 'يتم بث SOS. قم بتفعيله لإيقافه.';

  @override
  String get hsSafeCloseHint => 'كل شيء واضح. أغلق التطبيق بدون SOS.';

  @override
  String get hsStop => 'إيقاف';

  @override
  String get hsCameraHint => 'التقط صورة.';

  @override
  String get hsPreviewHint => 'اضغط لفترة طويلة لتبديل عرض حقوقك.';

  @override
  String get hsShowRights => 'أظهر حقوقك.';

  @override
  String get hsHideRights => 'إخفاء حقوقك.';

  @override
  String get hsStartRecord => 'سجل فيديو.';

  @override
  String get hsEndRecord => 'إنهاء التسجيل.';

  @override
  String get hsFlashOff => 'الفلاش معطل. قم بتفعيله لتشغيل الفلاش التلقائي.';

  @override
  String get hsFlashAuto => 'الفلاش تلقائي. قم بتفعيله لتشغيل الفلاش.';

  @override
  String get hsFlashOn => 'الفلاش يعمل. قم بتفعيله لإيقاف تشغيل الفلاش.';

  @override
  String get hsFlashTorch => 'وضع المصباح. قم بتفعيله لإيقاف تشغيل الفلاش.';

  @override
  String get rvSharedHeader => 'لديك الحق في...';

  @override
  String get rvOnFoot => 'سيرا على الأقدام';

  @override
  String get rvWhileDriving => 'أثناء القيادة';

  @override
  String get rvAtHome => 'في البيت';

  @override
  String get rvSharedRemainSilent =>
      'التزم الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rvSharedDocument =>
      'وثّق كل شيء. لديك الحق في التقاط الصور وتسجيل الفيديوهات والتسجيل الصوتي.';

  @override
  String get rvMobilePockets =>
      'ارفض تفتيش جيوبك. يمكن لدائرة الهجرة والجمارك الأمريكية (ICE) إجراء تفتيش جسدي، ولكن ليس تفتيشًا داخليًا.';

  @override
  String get rvMobileQuestion => 'اطرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rvMobileLeave => 'إرحل إذا لم تكن تحت الإعتقال.';

  @override
  String get rvDriveSearch => 'ارفض تفتيش سيارتك.';

  @override
  String get rvDriveID =>
      'ارفض إبراز بطاقة هوية كراكب. السائق فقط هو المطلوب منه إبرازها.';

  @override
  String get rvDriveWarrant =>
      'اسأل إن كان لدى الضباط أمر تفتيش. يحق لك الاطلاع عليه إن وُجد. إذا لم يتم توقيع \"الأمر\" من قبل القاضي، فهو غير صالح.';

  @override
  String get rvHomeWarrant =>
      'أبقِ بابك مغلقًا. إذا كان لديهم أمر تفتيش، فاطلب منهم وضعه تحت الباب أولًا. إذا لم يكن \"الأمر\" موقّعًا من قاضٍ، فهو غير صالح. أبقِ بابك مغلقًا.';

  @override
  String get rvSharedSign => 'ارفض التوقيع على أي شيء.';

  @override
  String get rvSharedFingerprint =>
      'ارفض أن يتم أخذ بصمات أصابعك من قبل دائرة الهجرة والجمارك الأمريكية إلا إذا كنت تحت الاعتقال.';

  @override
  String get rvSharedLawyer =>
      'استشارة محامٍ. إذا تم اعتقالك رسميًا، يحق لك الاستعانة بمحامٍ تعينه المحكمة.';

  @override
  String get ssAutoShare => 'مشاركة الوسائط تلقائيًا';

  @override
  String get ssAppearance => 'المظهر';

  @override
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA => 'تم تجميع قائمة الحقوق من عدة مصادر عامة، بما في ذلك:';

  @override
  String get faqSettings => 'ما هي وظيفة الإعدادات؟';

  @override
  String get faqUnavailable => 'الاستغاثة تقول \"الموقع غير متاح\"؟';

  @override
  String get faqReliability =>
      'لتحسين موثوقية الاستغاثة، يرجى تفعيل خيار \"السماح طوال الوقت\" في ';

  @override
  String get faqLocationPermissions => 'أذونات الموقع';

  @override
  String get faqLocationTrust =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث الاستغاثة. لا تقوم InstaSOS ولا Empathetech LLC بتتبع بيانات المستخدم أو تخزينها أو بيعها.';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فهذا يعني أن InstaSOS ليس لديه إذن للوصول إلى جهة الاتصال تلك.';

  @override
  String get faqUpdateContacts => 'يمكنك تحديث أذونات جهات الاتصال في ';

  @override
  String get faqMissing => 'لماذا بعض ميزات Android مفقودة؟';

  @override
  String get faqRestricted =>
      'الميزات المفقودة تتطلب أتمتة الرسائل القصيرة (SMS)، ولا تسمح Apple للمطورين بأتمتة الرسائل النصية (بدون خدمة مدفوعة).';

  @override
  String get faqShortcuts =>
      'ماذا عن اختصارات iOS؟\nهناك أيضاً قيود على الوصول إلى اختصارات المستخدم، مما قد يؤدي إلى تعطيل ميزات حاسمة. بشكل أساسي: قد يؤدي ذلك إلى مقاطعة تسجيلات الفيديو.';

  @override
  String get faqLanguages => 'لماذا اللغة X غير متوفرة؟';

  @override
  String get faqResponsible =>
      'سيكون من غير المسؤول استخدام الترجمة الآلية لقائمة الحقوق. يرجى التفكير في ';

  @override
  String get faqContributing => 'المساهمة';

  @override
  String get faqExpand => ' للمساعدة في توسيع خيارات اللغة.';

  @override
  String get faqReset => 'إعادة تعيين الشرح التوضيحي';

  @override
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';
}
