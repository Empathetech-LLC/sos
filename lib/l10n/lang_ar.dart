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
  String get hsStartSOS => 'قم بالتفعيل لبدء بث SOS.';

  @override
  String get hsEndSOS => 'يتم بث SOS. قم بتفعيله لإيقافه.';

  @override
  String get hsSafeCloseHint => 'كل شيء واضح. أغلق التطبيق بدون SOS.';

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
  String get hsWelcome => 'مرحباً بكم في InstaSOS';

  @override
  String get hsAppTutorial =>
      'يشارك حالتك مع جهات الاتصال في حالات الطوارئ في أوقات الأزمات.\n\nالرجاء اختيار جهة اتصال في حالات الطوارئ.\nواحدة فقط في الوقت الحالي، ويمكنك إضافة المزيد لاحقًا.';

  @override
  String get hsPermissionsTutorialTitle => 'إذا أردت';

  @override
  String get hsPermissionsTutorial =>
      'يمكن لـ InstaSOS أيضًا جمع الأدلة ومشاركتها.\n\nوسيطلب الوصول إلى الكاميرا والميكروفون والمعرض للقيام بذلك.';

  @override
  String get hsPermissionsAlways =>
      'يرجى تعيين الموقع للسماح به دائمًا.\nسيتم استخدامه فقط أثناء تنشيط SOS.';

  @override
  String get hsBroadcastTutorial =>
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsIOSBroadcastTutorial =>
      'قم بتنشيط SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال الخاصة بك في حالات الطوارئ.\n\n إذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.';

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
  String get hsRightsTutorial =>
      'إذا قمت بتمكين الكاميرا، والتقطت صورة أو سجلت مقطع فيديو، فستتمكن من مشاركته على الفور.\n\nافتراضيًا، إذا تمت مقاطعة التسجيل، فسيتم تنشيط SOS تلقائيًا.\n\nاضغط على المطرقة أو اضغط مطولاً على وسط الشاشة لإظهار قائمة بحقوقك.';

  @override
  String get hsIOSRightsTutorial =>
      'إذا قمت بتمكين الكاميرا، والتقطت صورة أو سجلت مقطع فيديو، فستتمكن من مشاركته على الفور.\n\nاضغط على المطرقة أو اضغط لفترة طويلة على وسط الشاشة لإظهار قائمة بحقوقك.';

  @override
  String get hsNeedContacts =>
      'يحتاج تطبيق InstaSOS إلى الوصول إلى جهات الاتصال الخاصة بك ليعمل بشكل صحيح.';

  @override
  String get hsPartialContacts =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع InstaSOS.\nلمشاركة المزيد من جهات الاتصال، انتقل إلى إعدادات iOS -> التطبيقات -> InstaSOS';

  @override
  String get hsNumError => 'جهة الاتصال خاصة أو ليس لديها رقم هاتف.';

  @override
  String get rsSharedHeader => 'لديك الحق في...';

  @override
  String get rsOnFoot => 'سيرا على الأقدام';

  @override
  String get rsWhileDriving => 'أثناء القيادة';

  @override
  String get rsAtHome => 'في البيت';

  @override
  String get rsSharedRemainSilent =>
      'التزم الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rsSharedDocument =>
      'وثّق كل شيء. لديك الحق في التقاط الصور وتسجيل الفيديوهات والتسجيل الصوتي.';

  @override
  String get rsMobilePockets =>
      'ارفض تفتيش جيوبك. يمكن لدائرة الهجرة والجمارك الأمريكية (ICE) إجراء تفتيش جسدي، ولكن ليس تفتيشًا داخليًا.';

  @override
  String get rsMobileQuestion => 'اطرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rsMobileLeave => 'إرحل إذا لم تكن تحت الإعتقال.';

  @override
  String get rsDriveSearch => 'ارفض تفتيش سيارتك.';

  @override
  String get rsDriveID =>
      'ارفض إبراز بطاقة هوية كراكب. السائق فقط هو المطلوب منه إبرازها.';

  @override
  String get rsDriveWarrant =>
      'اسأل إن كان لدى الضباط أمر تفتيش. يحق لك الاطلاع عليه إن وُجد. إذا لم يتم توقيع \"الأمر\" من قبل القاضي، فهو غير صالح.';

  @override
  String get rsHomeWarrant =>
      'أبقِ بابك مغلقًا. إذا كان لديهم أمر تفتيش، فاطلب منهم وضعه تحت الباب أولًا. إذا لم يكن \"الأمر\" موقّعًا من قاضٍ، فهو غير صالح. أبقِ بابك مغلقًا.';

  @override
  String get rsSharedSign => 'ارفض التوقيع على أي شيء.';

  @override
  String get rsSharedFingerprint =>
      'ارفض أن يتم أخذ بصمات أصابعك من قبل دائرة الهجرة والجمارك الأمريكية إلا إذا كنت تحت الاعتقال.';

  @override
  String get rsSharedLawyer =>
      'استشارة محامٍ. إذا تم اعتقالك رسميًا، يحق لك الاستعانة بمحامٍ تعينه المحكمة.';

  @override
  String get ssSOSOnOpen => 'SOS مفتوح';

  @override
  String get ssSOSOnClose => 'SOS مغلق';

  @override
  String get ssSOSOnCloseHint =>
      'عند تفعيلها، سيظهر زر إغلاق آمن (إشارة إعجاب) على الصفحة الرئيسية، مقابل الإعدادات. إذا فقد InstaSOS تركيزه لأي سبب باستثناء زر إغلاق الأمان (تصغير، أو تشغيل التطبيقات، أو إيقاف تشغيل الشاشة)، فسيبدأ بث استغاثة.';

  @override
  String get ssVideoSOS => 'SOS عند انقطاع التسجيل';

  @override
  String get ssAutoShare => 'مشاركة الوسائط تلقائيًا';

  @override
  String get ssEMC => 'جهات الاتصال في حالات الطوارئ';

  @override
  String get ssRemoveHint => 'إزالة جهة الاتصال';

  @override
  String get ssAddHint => 'إضافة جهة اتصال أخرى';

  @override
  String get ssLinkType => 'نوع الرابط';

  @override
  String get ssAppearance => 'المظهر';

  @override
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA1 =>
      'تم تجميع قائمة الحقوق من عدة مصادر عامة، بما في ذلك:';

  @override
  String get faqListA2 => 'مورد مفيد آخر: ';

  @override
  String get faqSettings => 'ما هي وظيفة الإعدادات؟';

  @override
  String get faqOnOpen =>
      'الاستغاثة عند الفتح: عند التفعيل، سيبدأ بث الاستغاثة فور تشغيل التطبيق. لا يُنصح به لمعظم المستخدمين، حيث قد يؤدي إلى إرسال نداءات عن طريق الخطأ.';

  @override
  String get faqOnInterrupt =>
      'الاستغاثة عند توقف التسجيل: عند التفعيل، إذا كان تسجيل الفيديو نشطاً وفقد InstaSOS التركيز لأي سبب (تم تصغيره، التبديل بين التطبيقات، إغلاق الشاشة)، سيبدأ بث الاستغاثة.\nيُنصح بتفعيل هذا الخيار أو \"الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqAutoShare =>
      'المشاركة التلقائية للوسائط: عند التفعيل، ستظهر خيارات المشاركة الأصلية بمجرد اكتمال الفيديو أو التقاط صورة.';

  @override
  String get faqEMC =>
      'جهات اتصال الطوارئ: الأشخاص الذين سيتم إرسال موقعك إليهم أثناء نشاط بث الاستغاثة.';

  @override
  String get faqLink =>
      'نوع الرابط: كيف سيتم تسليم موقعك إلى جهات الاتصال. \"خرائط Google\" و\"خرائط Apple\" و\"Waze\" سترسل رابطاً قابلاً للنقر للخدمة المقابلة. \"الإحداثيات\" سترسل خطي العرض والطول كنص عادي.';

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
  String get faqPrivateContact => 'جهة الاتصال خاصة أو ليس لديها رقم هاتف؟';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فهذا يعني أن InstaSOS ليس لديه إذن للوصول إلى جهة الاتصال تلك.';

  @override
  String get faqUpdateContacts => 'يمكنك تحديث أذونات جهات الاتصال في ';

  @override
  String get faqOSSettings => 'إعدادات iOS';

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
  String get faqResetSnack =>
      'سيتم إعادة تشغيل الشرح التوضيحي عند الفتح في المرة القادمة.';

  @override
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';
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
  String get hsStartSOS => 'قم بالتفعيل لبدء بث SOS.';

  @override
  String get hsEndSOS => 'يتم بث SOS. قم بتفعيله لإيقافه.';

  @override
  String get hsSafeCloseHint => 'كل شيء واضح. أغلق التطبيق بدون SOS.';

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
  String get hsWelcome => 'مرحباً بكم في InstaSOS';

  @override
  String get hsAppTutorial =>
      'يشارك حالتك مع جهات الاتصال في حالات الطوارئ في أوقات الأزمات.\n\nالرجاء اختيار جهة اتصال في حالات الطوارئ.\nواحدة فقط في الوقت الحالي، ويمكنك إضافة المزيد لاحقًا.';

  @override
  String get hsPermissionsTutorialTitle => 'إذا أردت';

  @override
  String get hsPermissionsTutorial =>
      'يمكن لـ InstaSOS أيضًا جمع الأدلة ومشاركتها.\n\nوسيطلب الوصول إلى الكاميرا والميكروفون والمعرض للقيام بذلك.';

  @override
  String get hsPermissionsAlways =>
      'يرجى تعيين الموقع للسماح به دائمًا.\nسيتم استخدامه فقط أثناء تنشيط SOS.';

  @override
  String get hsBroadcastTutorial =>
      'قم بتفعيل SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال في حالات الطوارئ.\n\nإذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.\n\nستستمر الرسائل النصية حتى عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تنشيط SOS أو إغلاق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsIOSBroadcastTutorial =>
      'قم بتنشيط SOS لإرسال رسائل نصية تلقائيًا إلى جهات الاتصال الخاصة بك في حالات الطوارئ.\n\n إذا كان لدى InstaSOS إمكانية الوصول إلى موقعك، فسيتم تضمينه في الرسائل النصية.';

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
  String get hsRightsTutorial =>
      'إذا قمت بتمكين الكاميرا، والتقطت صورة أو سجلت مقطع فيديو، فستتمكن من مشاركته على الفور.\n\nافتراضيًا، إذا تمت مقاطعة التسجيل، فسيتم تنشيط SOS تلقائيًا.\n\nاضغط على المطرقة أو اضغط مطولاً على وسط الشاشة لإظهار قائمة بحقوقك.';

  @override
  String get hsIOSRightsTutorial =>
      'إذا قمت بتمكين الكاميرا، والتقطت صورة أو سجلت مقطع فيديو، فستتمكن من مشاركته على الفور.\n\nاضغط على المطرقة أو اضغط لفترة طويلة على وسط الشاشة لإظهار قائمة بحقوقك.';

  @override
  String get hsNeedContacts =>
      'يحتاج تطبيق InstaSOS إلى الوصول إلى جهات الاتصال الخاصة بك ليعمل بشكل صحيح.';

  @override
  String get hsPartialContacts =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع InstaSOS.\nلمشاركة المزيد من جهات الاتصال، انتقل إلى إعدادات iOS -> التطبيقات -> InstaSOS';

  @override
  String get hsNumError => 'جهة الاتصال خاصة أو ليس لديها رقم هاتف.';

  @override
  String get rsSharedHeader => 'لديك الحق في...';

  @override
  String get rsOnFoot => 'سيرا على الأقدام';

  @override
  String get rsWhileDriving => 'أثناء القيادة';

  @override
  String get rsAtHome => 'في البيت';

  @override
  String get rsSharedRemainSilent =>
      'التزم الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rsSharedDocument =>
      'وثّق كل شيء. لديك الحق في التقاط الصور وتسجيل الفيديوهات والتسجيل الصوتي.';

  @override
  String get rsMobilePockets =>
      'ارفض تفتيش جيوبك. يمكن لدائرة الهجرة والجمارك الأمريكية (ICE) إجراء تفتيش جسدي، ولكن ليس تفتيشًا داخليًا.';

  @override
  String get rsMobileQuestion => 'اطرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rsMobileLeave => 'إرحل إذا لم تكن تحت الإعتقال.';

  @override
  String get rsDriveSearch => 'ارفض تفتيش سيارتك.';

  @override
  String get rsDriveID =>
      'ارفض إبراز بطاقة هوية كراكب. السائق فقط هو المطلوب منه إبرازها.';

  @override
  String get rsDriveWarrant =>
      'اسأل إن كان لدى الضباط أمر تفتيش. يحق لك الاطلاع عليه إن وُجد. إذا لم يتم توقيع \"الأمر\" من قبل القاضي، فهو غير صالح.';

  @override
  String get rsHomeWarrant =>
      'أبقِ بابك مغلقًا. إذا كان لديهم أمر تفتيش، فاطلب منهم وضعه تحت الباب أولًا. إذا لم يكن \"الأمر\" موقّعًا من قاضٍ، فهو غير صالح. أبقِ بابك مغلقًا.';

  @override
  String get rsSharedSign => 'ارفض التوقيع على أي شيء.';

  @override
  String get rsSharedFingerprint =>
      'ارفض أن يتم أخذ بصمات أصابعك من قبل دائرة الهجرة والجمارك الأمريكية إلا إذا كنت تحت الاعتقال.';

  @override
  String get rsSharedLawyer =>
      'استشارة محامٍ. إذا تم اعتقالك رسميًا، يحق لك الاستعانة بمحامٍ تعينه المحكمة.';

  @override
  String get ssSOSOnOpen => 'SOS مفتوح';

  @override
  String get ssSOSOnClose => 'SOS مغلق';

  @override
  String get ssSOSOnCloseHint =>
      'عند تفعيلها، سيظهر زر إغلاق آمن (إشارة إعجاب) على الصفحة الرئيسية، مقابل الإعدادات. إذا فقد InstaSOS تركيزه لأي سبب باستثناء زر إغلاق الأمان (تصغير، أو تشغيل التطبيقات، أو إيقاف تشغيل الشاشة)، فسيبدأ بث استغاثة.';

  @override
  String get ssVideoSOS => 'SOS عند انقطاع التسجيل';

  @override
  String get ssAutoShare => 'مشاركة الوسائط تلقائيًا';

  @override
  String get ssEMC => 'جهات الاتصال في حالات الطوارئ';

  @override
  String get ssRemoveHint => 'إزالة جهة الاتصال';

  @override
  String get ssAddHint => 'إضافة جهة اتصال أخرى';

  @override
  String get ssLinkType => 'نوع الرابط';

  @override
  String get ssAppearance => 'المظهر';

  @override
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA1 =>
      'تم تجميع قائمة الحقوق من عدة مصادر عامة، بما في ذلك:';

  @override
  String get faqListA2 => 'مورد مفيد آخر: ';

  @override
  String get faqSettings => 'ما هي وظيفة الإعدادات؟';

  @override
  String get faqOnOpen =>
      'الاستغاثة عند الفتح: عند التفعيل، سيبدأ بث الاستغاثة فور تشغيل التطبيق. لا يُنصح به لمعظم المستخدمين، حيث قد يؤدي إلى إرسال نداءات عن طريق الخطأ.';

  @override
  String get faqOnInterrupt =>
      'الاستغاثة عند توقف التسجيل: عند التفعيل، إذا كان تسجيل الفيديو نشطاً وفقد InstaSOS التركيز لأي سبب (تم تصغيره، التبديل بين التطبيقات، إغلاق الشاشة)، سيبدأ بث الاستغاثة.\nيُنصح بتفعيل هذا الخيار أو \"الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqAutoShare =>
      'المشاركة التلقائية للوسائط: عند التفعيل، ستظهر خيارات المشاركة الأصلية بمجرد اكتمال الفيديو أو التقاط صورة.';

  @override
  String get faqEMC =>
      'جهات اتصال الطوارئ: الأشخاص الذين سيتم إرسال موقعك إليهم أثناء نشاط بث الاستغاثة.';

  @override
  String get faqLink =>
      'نوع الرابط: كيف سيتم تسليم موقعك إلى جهات الاتصال. \"خرائط Google\" و\"خرائط Apple\" و\"Waze\" سترسل رابطاً قابلاً للنقر للخدمة المقابلة. \"الإحداثيات\" سترسل خطي العرض والطول كنص عادي.';

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
  String get faqPrivateContact => 'جهة الاتصال خاصة أو ليس لديها رقم هاتف؟';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فهذا يعني أن InstaSOS ليس لديه إذن للوصول إلى جهة الاتصال تلك.';

  @override
  String get faqUpdateContacts => 'يمكنك تحديث أذونات جهات الاتصال في ';

  @override
  String get faqOSSettings => 'إعدادات iOS';

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
  String get faqResetSnack =>
      'سيتم إعادة تشغيل الشرح التوضيحي عند الفتح في المرة القادمة.';

  @override
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';
}
