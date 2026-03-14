// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class LangAr extends Lang {
  LangAr([String locale = 'ar']) : super(locale);

  @override
  String get gOk => 'حسناً';

  @override
  String get gDone => 'تم';

  @override
  String get gReminder => 'تذكير';

  @override
  String get gSystem => 'إعدادات النظام';

  @override
  String get gNotAgain => 'لا تظهر مرة أخرى';

  @override
  String get gOnCloseWarning =>
      '\"طلب الاستغاثة عند الإغلاق\" مفعل. سيبدأ هذا بثاً.';

  @override
  String get sosLastKnown => 'آخر موقع معروف:';

  @override
  String get sosNeedSMS => 'طلب الاستغاثة (SOS) يحتاج إلى إذن الرسائل القصيرة.';

  @override
  String get sosDisabled => 'لا يمكن الوصول إلى الموقع (معطل)';

  @override
  String get sosDenied => 'لا يمكن الوصول إلى الموقع (مرفوض)';

  @override
  String get sosError => 'لا يمكن الوصول إلى الموقع (خطأ)';

  @override
  String get hsWelcome => 'مرحباً بك في InstaSOS';

  @override
  String get hsWelcomeFix => 'مرحباً بك في Insta-SOS';

  @override
  String get hsAppIntro =>
      'للبدء، هذا مجرد تطبيق لمعرفة حقوقك.\nيمكنك تفعيل المزيد من الأدوات من خلال منحها الإذن في القائمة أدناه.';

  @override
  String get hsAppIntroAlt =>
      'التحديث الأخير كان كبيراً، لنتأكد من أن كل شيء جاهز أدناه.';

  @override
  String get hsYourApp => 'يمكنك تغيير رأيك/أذوناتك في أي وقت.';

  @override
  String get hsHybridTranslation =>
      'تمت ترجمة البرنامج التعليمي والإعدادات آلياً.\nقائمة الحقوق تمت ترجمتها بشرياً.';

  @override
  String get hsCamMic => 'الكاميرا والميكروفون';

  @override
  String get hsAddRecording => 'يفعّل تسجيل الفيديو.';

  @override
  String get hsGallery => 'المعرض';

  @override
  String get hsAddSave => 'مطلوب لحفظ تسجيلاتك.';

  @override
  String get hsCameraReady => 'الكاميرا جاهزة';

  @override
  String get hsCameraSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن الوصول إلى الكاميرا.';

  @override
  String get hsContacts => 'جهات الاتصال';

  @override
  String get hsAddContacts => 'الجزء 1 من تفعيل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsAddContactsIOS => 'يفعّل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsContactsReady => 'جهات الاتصال جاهزة';

  @override
  String get hsContactsSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن عرض جهات الاتصال الخاصة بك.';

  @override
  String get hsTexting => 'المراسلة النصية';

  @override
  String get hsAddTexting => 'الجزء 2 من تفعيل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsTextingReady => 'المراسلة النصية جاهزة';

  @override
  String get hsTextingSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن إرسال الرسائل.';

  @override
  String get hsLocation => 'الموقع';

  @override
  String get hsUnable => 'غير قادر على التحديد';

  @override
  String get hsAddLocation => 'يفعّل مشاركة الموقع مع جهات اتصال الطوارئ.';

  @override
  String get hsAddAlways =>
      'يوصى بتفعيله دائماً. اضغط مرة أخرى لفتح إعدادات النظام.';

  @override
  String get hsLocationReady => 'الموقع جاهز';

  @override
  String get hsLocationSetupHint => 'قم بالتفعيل لمنح Insta-SOS إذن عرض موقعك.';

  @override
  String get hsOneOfFour => 'الأول من أربعة. متابعة...';

  @override
  String get hsBroadcastTutorial =>
      'قم بتفعيل طلب الاستغاثة (SOS) لمراسلة جهات اتصال الطوارئ تلقائياً.\n\nعندما يتمكن InstaSOS من الوصول إلى موقعك، سيتم تضمينه في الرسائل النصية.';

  @override
  String get hsBroadcastTutorialFix =>
      'قم بتفعيل طلب الاستغاثة (SOS) لمراسلة جهات اتصال الطوارئ تلقائياً.\n\nعندما يتمكن Insta-SOS من الوصول إلى موقعك، سيتم تضمينه في الرسائل النصية.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'ستستمر الرسائل النصية عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تفعيل طلب الاستغاثة (SOS) يدوياً أو أغلق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsTwoOfFour => 'الثاني من أربعة. متابعة...';

  @override
  String get hsSettingsTutorial =>
      '- قم بإعداد بث طلب الاستغاثة (SOS) الخاص بك\n- خصص مظهر التطبيق\n- الوصول إلى المزيد من الموارد والدعم\n\nفي الإعدادات.';

  @override
  String get hsSettingsTutorialFix =>
      'يمكنك إعداد بث طلب الاستغاثة (SOS) الخاص بك، وتخصيص مظهر التطبيق، والوصول إلى المزيد من الموارد/الدعم في الإعدادات.';

  @override
  String get hsThreeOfFour => 'الثالث من أربعة. متابعة...';

  @override
  String get hsVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، يمكنك مشاركته على الفور.\n\nافتراضياً، إذا تمت مقاطعة التسجيل، سيبدأ بث طلب الاستغاثة (SOS) تلقائياً.\n\nاضغط مطولاً على معاينة الكاميرا لإظهار/إخفاء حقوقك.';

  @override
  String get hsIOSVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، يمكنك مشاركته على الفور.\n\nاضغط مطولاً على معاينة الكاميرا لإظهار/إخفاء حقوقك.';

  @override
  String get hsTutorialComplete => 'اكتمل البرنامج التعليمي';

  @override
  String get hsAddEMC =>
      'إذا كنت تستخدم تنبيهات طلب الاستغاثة (SOS)، يرجى التوجه إلى صفحة الإعدادات وإضافة جهات اتصال الطوارئ الخاصة بك.';

  @override
  String get hsStartSOS => 'قم بالتفعيل لبدء بث طلب الاستغاثة (SOS).';

  @override
  String get hsEndSOS => 'طلب الاستغاثة (SOS) قيد البث. قم بالتفعيل للإيقاف.';

  @override
  String get hsSafeCloseHint =>
      'الوضع آمن. أغلق التطبيق بدون طلب الاستغاثة (SOS).';

  @override
  String get hsBroadcasting => 'جاري البث';

  @override
  String get hsStop => 'إيقاف';

  @override
  String get hsCameraHint => 'التقط صورة.';

  @override
  String get hsPreviewHint => 'اضغط مطولاً لإظهار/إخفاء حقوقك.';

  @override
  String get hsShowRights => 'إظهار حقوقك.';

  @override
  String get hsHideRights => 'إخفاء حقوقك.';

  @override
  String get hsStartRecord => 'تسجيل مقطع فيديو.';

  @override
  String get hsEndRecord => 'إنهاء التسجيل.';

  @override
  String get hsFlashOff => 'الفلاش مطفأ. قم بالتفعيل لتشغيل الفلاش التلقائي.';

  @override
  String get hsFlashAuto => 'فلاش تلقائي. قم بالتفعيل لتشغيل الفلاش.';

  @override
  String get hsFlashOn =>
      'الفلاش قيد التشغيل. قم بالتفعيل لإيقاف تشغيل الفلاش.';

  @override
  String get hsFlashTorch => 'وضع المصباح. قم بالتفعيل لإيقاف تشغيل الفلاش.';

  @override
  String get hsNoFlash => 'فلاش الكاميرا لا يعمل';

  @override
  String get rvSharedHeader => 'لديك الحق في...';

  @override
  String get rvOnFoot => 'سيراً على الأقدام';

  @override
  String get rvWhileDriving => 'أثناء القيادة';

  @override
  String get rvAtHome => 'في المنزل';

  @override
  String get rvSharedRemainSilent =>
      'التزام الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rvSharedDocument =>
      'توثيق كل شيء. لديك الحق في التقاط الصور وتسجيل مقاطع الفيديو وتسجيل الصوت.';

  @override
  String get rvMobilePockets =>
      'رفض تفتيش جيوبك. يمكن لشرطة الهجرة والجمارك (ICE) إجراء تفتيش جسدي سطحي، ولكن ليس تفتيشاً دقيقاً.';

  @override
  String get rvMobileQuestion => 'طرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rvMobileLeave => 'المغادرة إذا لم يتم احتجازك.';

  @override
  String get rvDriveSearch => 'رفض تفتيش سيارتك.';

  @override
  String get rvDriveID =>
      'رفض تقديم الهوية كراكب. السائق فقط ملزم بتقديم الهوية.';

  @override
  String get rvDriveWarrant =>
      'السؤال عما إذا كان الضباط يحملون مذكرة تفتيش. يحق لك رؤيتها إذا كانوا يحملونها. إذا لم تكن \"المذكرة\" موقعة من قبل قاضٍ، فهي غير صالحة.';

  @override
  String get rvHomeWarrant =>
      'إبقاء بابك مغلقاً. إذا كان لديهم مذكرة، اطلب منهم تمريرها من تحت الباب أولاً. إذا لم تكن \"المذكرة\" موقعة من قبل قاضٍ، فهي غير صالحة. أبقِ بابك مغلقاً.';

  @override
  String get rvSharedSign => 'رفض التوقيع على أي شيء.';

  @override
  String get rvSharedFingerprint =>
      'رفض أخذ بصمات أصابعك من قبل شرطة الهجرة والجمارك (ICE) إلا إذا كنت قيد الاعتقال.';

  @override
  String get rvSharedLawyer =>
      'استشارة محامٍ. إذا تم القبض عليك رسمياً، فيحق لك الحصول على محامٍ تعينه المحكمة.';

  @override
  String get ssAutoShare => 'مشاركة الصور/مقاطع الفيديو تلقائياً';

  @override
  String get ssSOS => 'إعدادات طلب الاستغاثة (SOS)';

  @override
  String get ssAppearance => 'إعدادات المظهر';

  @override
  String get ssPermissions => 'الأذونات';

  @override
  String get ssResources => 'الموارد';

  @override
  String get ssSupport => 'الدعم';

  @override
  String get pmOnlyAdd => 'هذه الأداة تساعد فقط في إضافة الأذونات.';

  @override
  String get pmRemoveIn => 'يمكنك إزالة الأذونات في ';

  @override
  String get pmManualPermission =>
      'إذا قمت بإزالة الأذونات في إعدادات النظام، يجب استعادتها هناك أيضاً.';

  @override
  String get rmCommunity => 'موارد المجتمع';

  @override
  String get rmGov => 'الموارد الحكومية الأمريكية';

  @override
  String get rmAffiliate => 'لا يتبع أي منها لشركة Empathetech LLC';

  @override
  String get rmAffiliateFix => 'لا يتبع أي منها لشركة Empathetic LLC';

  @override
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA => 'تم أخذ قائمة الحقوق من عدة موارد عامة، بما في ذلك:';

  @override
  String get faqSettings => 'كيف تعمل الإعدادات؟';

  @override
  String get faqAutoShareA =>
      ' يستخدم ميزة المشاركة المدمجة في هاتفك. لا يستخدم جهات اتصال الطوارئ المحفوظة (إن وجدت). المشاركة اختيارية ويمكن إلغاؤها دائماً.';

  @override
  String get faqLinkA =>
      ' كيف سيتم إرسال موقعك إلى جهات اتصال الطوارئ الخاصة بك. سيرسل \"خرائط جوجل\" و \"خرائط أبل\" و \"Waze\" رابطاً قابلاً للنقر للخدمة المقابلة. سترسل \"الإحداثيات\" خطوط العرض والطول كنص عادي.';

  @override
  String get faqOnOpenA =>
      ' سيبدأ بث طلب الاستغاثة (SOS) فوراً عند تشغيل التطبيق. لا يوصى به لمعظم المستخدمين، حيث قد يؤدي إلى عمليات بث غير مقصودة.';

  @override
  String get faqOnInterruptA =>
      ' إذا كان هناك فيديو قيد التسجيل وفقد InstaSOS التركيز، سيبدأ بث طلب الاستغاثة (SOS). فقدان التركيز يعني: تصغير التطبيق، أو التبديل بين التطبيقات، و/أو قفل الشاشة. يوصى بتفعيل هذا الخيار أو \"طلب الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqOnInterruptAFix =>
      ' إذا كان هناك فيديو قيد التسجيل وفقد Insta-SOS التركيز، سيبدأ بث طلب الاستغاثة (SOS). فقدان التركيز يعني: تصغير التطبيق، أو التبديل بين التطبيقات، و/أو قفل الشاشة. يوصى بتفعيل هذا الخيار أو \"طلب الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqUnavailable => 'يقول طلب الاستغاثة (SOS) \"الموقع غير متوفر\"؟';

  @override
  String get faqReliability =>
      'لتحسين موثوقية طلب الاستغاثة (SOS)، يرجى تفعيل \"السماح طوال الوقت\" في ';

  @override
  String get faqLocationPermissions => 'أذونات الموقع';

  @override
  String get faqLocationTrust =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث طلب الاستغاثة (SOS). لا تقوم InstaSOS أو Empathetech LLC بتتبع أو تخزين أو بيع بيانات المستخدم.';

  @override
  String get faqLocationTrustFix =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث طلب الاستغاثة (SOS). لا تقوم Insta-SOS أو Empathetic LLC بتتبع أو تخزين أو بيع بيانات المستخدم.';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فإن InstaSOS ليس لديه إذن بالوصول إلى جهة الاتصال المحددة هذه.';

  @override
  String get faqContactPermissionsFix =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فإن Insta-SOS ليس لديه إذن بالوصول إلى جهة الاتصال المحددة هذه.';

  @override
  String get faqUpdateContacts =>
      'يمكنك منح الوصول إلى المزيد (أو جميع) جهات الاتصال في ';

  @override
  String get faqSplitClarity1 =>
      'منح الوصول إلى جهة اتصال لا يجعلها جهة اتصال للطوارئ. سيتم فقط الاتصال بالأرقام المدرجة في ';

  @override
  String get faqSplitClarity2 => ' أثناء بث طلب الاستغاثة (SOS).';

  @override
  String get faqMissing => 'لماذا بعض ميزات Android مفقودة؟';

  @override
  String get faqRestricted =>
      'تتطلب الميزات المفقودة أتمتة الرسائل القصيرة (SMS)، ولا تسمح Apple للمطورين بأتمتة الرسائل النصية (بدون خدمة مدفوعة).';

  @override
  String get faqShortcuts =>
      'ماذا عن اختصارات iOS؟\nهناك أيضاً قيود على الوصول إلى اختصارات المستخدم، مما قد يؤدي إلى تعطيل ميزات حاسمة. بشكل أساسي: سيؤدي إلى مقاطعة تسجيلات الفيديو.';

  @override
  String get faqLanguages => 'لماذا لغة X غير متوفرة؟';

  @override
  String get faqResponsible =>
      'سيكون من غير المسؤول استخدام الترجمة الآلية لقائمة الحقوق. يرجى التفكير في ';

  @override
  String get faqContributing => 'المساهمة';

  @override
  String get faqExpand => ' للمساعدة في توسيع خيارات اللغة.';

  @override
  String get faqReset => 'إعادة ضبط البرنامج التعليمي';

  @override
  String get faqContact => 'الاتصال بالدعم';

  @override
  String get faqContactHint => 'أرسل بريداً إلكترونياً إلى Empathetic LLC';

  @override
  String get bsEMC => 'جهات اتصال الطوارئ';

  @override
  String get bsAddSomeone => 'أضف شخصاً لتفعيل طلب الاستغاثة (SOS)';

  @override
  String get bsRemoveHint => 'إزالة جهة الاتصال';

  @override
  String get bsAddHint => 'إضافة جهة اتصال أخرى';

  @override
  String get bsLinkType => 'نوع رابط الموقع';

  @override
  String get bsSnackRequest => 'يرجى إضافة جهات اتصال الطوارئ';

  @override
  String get bsNeedPermission => 'لا يمكن إضافة جهات اتصال بدون إذن';

  @override
  String get bsPartialContacts =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع InstaSOS.\nلمشاركة المزيد من جهات الاتصال، افتح ';

  @override
  String get bsPartialContactsFix =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع Insta-SOS.\nلمشاركة المزيد من جهات الاتصال، افتح ';

  @override
  String get bsNumError => 'جهة الاتصال هذه خاصة أو ليس لديها رقم هاتف.';

  @override
  String get bsSOSOnOpen => 'طلب الاستغاثة عند الفتح';

  @override
  String get bsSOSOnClose => 'طلب الاستغاثة عند الإغلاق';

  @override
  String get bsSOSOnCloseHint =>
      'سيظهر زر إغلاق آمن (علامة الإعجاب) على الصفحة الرئيسية، مقابل الإعدادات.\nإذا فقد InstaSOS التركيز لأي سبب باستثناء زر الإغلاق الآمن (تصغير التطبيق، التبديل بين التطبيقات، إيقاف الشاشة)، سيبدأ بث طلب الاستغاثة (SOS).';

  @override
  String get bsSOSOnCloseHintFix =>
      'سيظهر زر إغلاق آمن (علامة الإعجاب) على الصفحة الرئيسية، مقابل الإعدادات.\nإذا فقد Insta-SOS التركيز لأي سبب باستثناء زر الإغلاق الآمن (تصغير التطبيق، التبديل بين التطبيقات، إيقاف الشاشة)، سيبدأ بث طلب الاستغاثة (SOS).';

  @override
  String get bsCloseOffWarning =>
      'سيتم إغلاق التطبيق تلقائياً لمنع عمليات البث غير المقصودة.';

  @override
  String get bsSOSOnVideo => 'طلب الاستغاثة عند مقاطعة التسجيل';

  @override
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';

  @override
  String get dsShowBack => 'إظهار زر الرجوع؟';
}

/// The translations for Arabic, as used in Egypt (`ar_EG`).
class LangArEg extends LangAr {
  LangArEg() : super('ar_EG');

  @override
  String get gOk => 'حسناً';

  @override
  String get gDone => 'تم';

  @override
  String get gReminder => 'تذكير';

  @override
  String get gSystem => 'إعدادات النظام';

  @override
  String get gNotAgain => 'لا تظهر مرة أخرى';

  @override
  String get gOnCloseWarning =>
      '\"طلب الاستغاثة عند الإغلاق\" مفعل. سيبدأ هذا بثاً.';

  @override
  String get sosLastKnown => 'آخر موقع معروف:';

  @override
  String get sosNeedSMS => 'طلب الاستغاثة (SOS) يحتاج إلى إذن الرسائل القصيرة.';

  @override
  String get sosDisabled => 'لا يمكن الوصول إلى الموقع (معطل)';

  @override
  String get sosDenied => 'لا يمكن الوصول إلى الموقع (مرفوض)';

  @override
  String get sosError => 'لا يمكن الوصول إلى الموقع (خطأ)';

  @override
  String get hsWelcome => 'مرحباً بك في InstaSOS';

  @override
  String get hsWelcomeFix => 'مرحباً بك في Insta-SOS';

  @override
  String get hsAppIntro =>
      'للبدء، هذا مجرد تطبيق لمعرفة حقوقك.\nيمكنك تفعيل المزيد من الأدوات من خلال منحها الإذن في القائمة أدناه.';

  @override
  String get hsAppIntroAlt =>
      'التحديث الأخير كان كبيراً، لنتأكد من أن كل شيء جاهز أدناه.';

  @override
  String get hsYourApp => 'يمكنك تغيير رأيك/أذوناتك في أي وقت.';

  @override
  String get hsHybridTranslation =>
      'تمت ترجمة البرنامج التعليمي والإعدادات آلياً.\nقائمة الحقوق تمت ترجمتها بشرياً.';

  @override
  String get hsCamMic => 'الكاميرا والميكروفون';

  @override
  String get hsAddRecording => 'يفعّل تسجيل الفيديو.';

  @override
  String get hsGallery => 'المعرض';

  @override
  String get hsAddSave => 'مطلوب لحفظ تسجيلاتك.';

  @override
  String get hsCameraReady => 'الكاميرا جاهزة';

  @override
  String get hsCameraSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن الوصول إلى الكاميرا.';

  @override
  String get hsContacts => 'جهات الاتصال';

  @override
  String get hsAddContacts => 'الجزء 1 من تفعيل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsAddContactsIOS => 'يفعّل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsContactsReady => 'جهات الاتصال جاهزة';

  @override
  String get hsContactsSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن عرض جهات الاتصال الخاصة بك.';

  @override
  String get hsTexting => 'المراسلة النصية';

  @override
  String get hsAddTexting => 'الجزء 2 من تفعيل تنبيهات جهات اتصال الطوارئ.';

  @override
  String get hsTextingReady => 'المراسلة النصية جاهزة';

  @override
  String get hsTextingSetupHint =>
      'قم بالتفعيل لمنح Insta-SOS إذن إرسال الرسائل.';

  @override
  String get hsLocation => 'الموقع';

  @override
  String get hsUnable => 'غير قادر على التحديد';

  @override
  String get hsAddLocation => 'يفعّل مشاركة الموقع مع جهات اتصال الطوارئ.';

  @override
  String get hsAddAlways =>
      'يوصى بتفعيله دائماً. اضغط مرة أخرى لفتح إعدادات النظام.';

  @override
  String get hsLocationReady => 'الموقع جاهز';

  @override
  String get hsLocationSetupHint => 'قم بالتفعيل لمنح Insta-SOS إذن عرض موقعك.';

  @override
  String get hsOneOfFour => 'الأول من أربعة. متابعة...';

  @override
  String get hsBroadcastTutorial =>
      'قم بتفعيل طلب الاستغاثة (SOS) لمراسلة جهات اتصال الطوارئ تلقائياً.\n\nعندما يتمكن InstaSOS من الوصول إلى موقعك، سيتم تضمينه في الرسائل النصية.';

  @override
  String get hsBroadcastTutorialFix =>
      'قم بتفعيل طلب الاستغاثة (SOS) لمراسلة جهات اتصال الطوارئ تلقائياً.\n\nعندما يتمكن Insta-SOS من الوصول إلى موقعك، سيتم تضمينه في الرسائل النصية.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'ستستمر الرسائل النصية عندما يكون الهاتف مقفلاً.\n\nقم بإلغاء تفعيل طلب الاستغاثة (SOS) يدوياً أو أغلق التطبيق بالكامل لإيقاف الرسائل النصية.';

  @override
  String get hsTwoOfFour => 'الثاني من أربعة. متابعة...';

  @override
  String get hsSettingsTutorial =>
      '- قم بإعداد بث طلب الاستغاثة (SOS) الخاص بك\n- خصص مظهر التطبيق\n- الوصول إلى المزيد من الموارد والدعم\n\nفي الإعدادات.';

  @override
  String get hsSettingsTutorialFix =>
      'يمكنك إعداد بث طلب الاستغاثة (SOS) الخاص بك، وتخصيص مظهر التطبيق، والوصول إلى المزيد من الموارد/الدعم في الإعدادات.';

  @override
  String get hsThreeOfFour => 'الثالث من أربعة. متابعة...';

  @override
  String get hsVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، يمكنك مشاركته على الفور.\n\nافتراضياً، إذا تمت مقاطعة التسجيل، سيبدأ بث طلب الاستغاثة (SOS) تلقائياً.\n\nاضغط مطولاً على معاينة الكاميرا لإظهار/إخفاء حقوقك.';

  @override
  String get hsIOSVideoTutorial =>
      'عندما تلتقط صورة أو تسجل مقطع فيديو، يمكنك مشاركته على الفور.\n\nاضغط مطولاً على معاينة الكاميرا لإظهار/إخفاء حقوقك.';

  @override
  String get hsTutorialComplete => 'اكتمل البرنامج التعليمي';

  @override
  String get hsAddEMC =>
      'إذا كنت تستخدم تنبيهات طلب الاستغاثة (SOS)، يرجى التوجه إلى صفحة الإعدادات وإضافة جهات اتصال الطوارئ الخاصة بك.';

  @override
  String get hsStartSOS => 'قم بالتفعيل لبدء بث طلب الاستغاثة (SOS).';

  @override
  String get hsEndSOS => 'طلب الاستغاثة (SOS) قيد البث. قم بالتفعيل للإيقاف.';

  @override
  String get hsSafeCloseHint =>
      'الوضع آمن. أغلق التطبيق بدون طلب الاستغاثة (SOS).';

  @override
  String get hsBroadcasting => 'جاري البث';

  @override
  String get hsStop => 'إيقاف';

  @override
  String get hsCameraHint => 'التقط صورة.';

  @override
  String get hsPreviewHint => 'اضغط مطولاً لإظهار/إخفاء حقوقك.';

  @override
  String get hsShowRights => 'إظهار حقوقك.';

  @override
  String get hsHideRights => 'إخفاء حقوقك.';

  @override
  String get hsStartRecord => 'تسجيل مقطع فيديو.';

  @override
  String get hsEndRecord => 'إنهاء التسجيل.';

  @override
  String get hsFlashOff => 'الفلاش مطفأ. قم بالتفعيل لتشغيل الفلاش التلقائي.';

  @override
  String get hsFlashAuto => 'فلاش تلقائي. قم بالتفعيل لتشغيل الفلاش.';

  @override
  String get hsFlashOn =>
      'الفلاش قيد التشغيل. قم بالتفعيل لإيقاف تشغيل الفلاش.';

  @override
  String get hsFlashTorch => 'وضع المصباح. قم بالتفعيل لإيقاف تشغيل الفلاش.';

  @override
  String get hsNoFlash => 'فلاش الكاميرا لا يعمل';

  @override
  String get rvSharedHeader => 'لديك الحق في...';

  @override
  String get rvOnFoot => 'سيراً على الأقدام';

  @override
  String get rvWhileDriving => 'أثناء القيادة';

  @override
  String get rvAtHome => 'في المنزل';

  @override
  String get rvSharedRemainSilent =>
      'التزام الصمت. لا تكذب، ولكن ليس عليك الإجابة على الأسئلة.';

  @override
  String get rvSharedDocument =>
      'توثيق كل شيء. لديك الحق في التقاط الصور وتسجيل مقاطع الفيديو وتسجيل الصوت.';

  @override
  String get rvMobilePockets =>
      'رفض تفتيش جيوبك. يمكن لشرطة الهجرة والجمارك (ICE) إجراء تفتيش جسدي سطحي، ولكن ليس تفتيشاً دقيقاً.';

  @override
  String get rvMobileQuestion => 'طرح الأسئلة. اكتشف سبب إيقافك.';

  @override
  String get rvMobileLeave => 'المغادرة إذا لم يتم احتجازك.';

  @override
  String get rvDriveSearch => 'رفض تفتيش سيارتك.';

  @override
  String get rvDriveID =>
      'رفض تقديم الهوية كراكب. السائق فقط ملزم بتقديم الهوية.';

  @override
  String get rvDriveWarrant =>
      'السؤال عما إذا كان الضباط يحملون مذكرة تفتيش. يحق لك رؤيتها إذا كانوا يحملونها. إذا لم تكن \"المذكرة\" موقعة من قبل قاضٍ، فهي غير صالحة.';

  @override
  String get rvHomeWarrant =>
      'إبقاء بابك مغلقاً. إذا كان لديهم مذكرة، اطلب منهم تمريرها من تحت الباب أولاً. إذا لم تكن \"المذكرة\" موقعة من قبل قاضٍ، فهي غير صالحة. أبقِ بابك مغلقاً.';

  @override
  String get rvSharedSign => 'رفض التوقيع على أي شيء.';

  @override
  String get rvSharedFingerprint =>
      'رفض أخذ بصمات أصابعك من قبل شرطة الهجرة والجمارك (ICE) إلا إذا كنت قيد الاعتقال.';

  @override
  String get rvSharedLawyer =>
      'استشارة محامٍ. إذا تم القبض عليك رسمياً، فيحق لك الحصول على محامٍ تعينه المحكمة.';

  @override
  String get ssAutoShare => 'مشاركة الصور/مقاطع الفيديو تلقائياً';

  @override
  String get ssSOS => 'إعدادات طلب الاستغاثة (SOS)';

  @override
  String get ssAppearance => 'إعدادات المظهر';

  @override
  String get ssPermissions => 'الأذونات';

  @override
  String get ssResources => 'الموارد';

  @override
  String get ssSupport => 'الدعم';

  @override
  String get pmOnlyAdd => 'هذه الأداة تساعد فقط في إضافة الأذونات.';

  @override
  String get pmRemoveIn => 'يمكنك إزالة الأذونات في ';

  @override
  String get pmManualPermission =>
      'إذا قمت بإزالة الأذونات في إعدادات النظام، يجب استعادتها هناك أيضاً.';

  @override
  String get rmCommunity => 'موارد المجتمع';

  @override
  String get rmGov => 'الموارد الحكومية الأمريكية';

  @override
  String get rmAffiliate => 'لا يتبع أي منها لشركة Empathetech LLC';

  @override
  String get rmAffiliateFix => 'لا يتبع أي منها لشركة Empathetic LLC';

  @override
  String get faqName => 'الأسئلة الشائعة';

  @override
  String get faqListQ => 'كيف تم إعداد قائمة الحقوق؟';

  @override
  String get faqListA => 'تم أخذ قائمة الحقوق من عدة موارد عامة، بما في ذلك:';

  @override
  String get faqSettings => 'كيف تعمل الإعدادات؟';

  @override
  String get faqAutoShareA =>
      ' يستخدم ميزة المشاركة المدمجة في هاتفك. لا يستخدم جهات اتصال الطوارئ المحفوظة (إن وجدت). المشاركة اختيارية ويمكن إلغاؤها دائماً.';

  @override
  String get faqLinkA =>
      ' كيف سيتم إرسال موقعك إلى جهات اتصال الطوارئ الخاصة بك. سيرسل \"خرائط جوجل\" و \"خرائط أبل\" و \"Waze\" رابطاً قابلاً للنقر للخدمة المقابلة. سترسل \"الإحداثيات\" خطوط العرض والطول كنص عادي.';

  @override
  String get faqOnOpenA =>
      ' سيبدأ بث طلب الاستغاثة (SOS) فوراً عند تشغيل التطبيق. لا يوصى به لمعظم المستخدمين، حيث قد يؤدي إلى عمليات بث غير مقصودة.';

  @override
  String get faqOnInterruptA =>
      ' إذا كان هناك فيديو قيد التسجيل وفقد InstaSOS التركيز، سيبدأ بث طلب الاستغاثة (SOS). فقدان التركيز يعني: تصغير التطبيق، أو التبديل بين التطبيقات، و/أو قفل الشاشة. يوصى بتفعيل هذا الخيار أو \"طلب الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqOnInterruptAFix =>
      ' إذا كان هناك فيديو قيد التسجيل وفقد Insta-SOS التركيز، سيبدأ بث طلب الاستغاثة (SOS). فقدان التركيز يعني: تصغير التطبيق، أو التبديل بين التطبيقات، و/أو قفل الشاشة. يوصى بتفعيل هذا الخيار أو \"طلب الاستغاثة عند الإغلاق\" (أو كليهما).';

  @override
  String get faqUnavailable => 'يقول طلب الاستغاثة (SOS) \"الموقع غير متوفر\"؟';

  @override
  String get faqReliability =>
      'لتحسين موثوقية طلب الاستغاثة (SOS)، يرجى تفعيل \"السماح طوال الوقت\" في ';

  @override
  String get faqLocationPermissions => 'أذونات الموقع';

  @override
  String get faqLocationTrust =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث طلب الاستغاثة (SOS). لا تقوم InstaSOS أو Empathetech LLC بتتبع أو تخزين أو بيع بيانات المستخدم.';

  @override
  String get faqLocationTrustFix =>
      'يستخدم التطبيق موقعك فقط أثناء نشاط بث طلب الاستغاثة (SOS). لا تقوم Insta-SOS أو Empathetic LLC بتتبع أو تخزين أو بيع بيانات المستخدم.';

  @override
  String get faqContactPermissions =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فإن InstaSOS ليس لديه إذن بالوصول إلى جهة الاتصال المحددة هذه.';

  @override
  String get faqContactPermissionsFix =>
      'إذا ظهرت لك هذه الرسالة عند إضافة جهة اتصال للطوارئ، فإن Insta-SOS ليس لديه إذن بالوصول إلى جهة الاتصال المحددة هذه.';

  @override
  String get faqUpdateContacts =>
      'يمكنك منح الوصول إلى المزيد (أو جميع) جهات الاتصال في ';

  @override
  String get faqSplitClarity1 =>
      'منح الوصول إلى جهة اتصال لا يجعلها جهة اتصال للطوارئ. سيتم فقط الاتصال بالأرقام المدرجة في ';

  @override
  String get faqSplitClarity2 => ' أثناء بث طلب الاستغاثة (SOS).';

  @override
  String get faqMissing => 'لماذا بعض ميزات Android مفقودة؟';

  @override
  String get faqRestricted =>
      'تتطلب الميزات المفقودة أتمتة الرسائل القصيرة (SMS)، ولا تسمح Apple للمطورين بأتمتة الرسائل النصية (بدون خدمة مدفوعة).';

  @override
  String get faqShortcuts =>
      'ماذا عن اختصارات iOS؟\nهناك أيضاً قيود على الوصول إلى اختصارات المستخدم، مما قد يؤدي إلى تعطيل ميزات حاسمة. بشكل أساسي: سيؤدي إلى مقاطعة تسجيلات الفيديو.';

  @override
  String get faqLanguages => 'لماذا لغة X غير متوفرة؟';

  @override
  String get faqResponsible =>
      'سيكون من غير المسؤول استخدام الترجمة الآلية لقائمة الحقوق. يرجى التفكير في ';

  @override
  String get faqContributing => 'المساهمة';

  @override
  String get faqExpand => ' للمساعدة في توسيع خيارات اللغة.';

  @override
  String get faqReset => 'إعادة ضبط البرنامج التعليمي';

  @override
  String get faqContact => 'الاتصال بالدعم';

  @override
  String get faqContactHint => 'أرسل بريداً إلكترونياً إلى Empathetic LLC';

  @override
  String get bsEMC => 'جهات اتصال الطوارئ';

  @override
  String get bsAddSomeone => 'أضف شخصاً لتفعيل طلب الاستغاثة (SOS)';

  @override
  String get bsRemoveHint => 'إزالة جهة الاتصال';

  @override
  String get bsAddHint => 'إضافة جهة اتصال أخرى';

  @override
  String get bsLinkType => 'نوع رابط الموقع';

  @override
  String get bsSnackRequest => 'يرجى إضافة جهات اتصال الطوارئ';

  @override
  String get bsNeedPermission => 'لا يمكن إضافة جهات اتصال بدون إذن';

  @override
  String get bsPartialContacts =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع InstaSOS.\nلمشاركة المزيد من جهات الاتصال، افتح ';

  @override
  String get bsPartialContactsFix =>
      'ستعرض Apple جميع جهات الاتصال، وليس فقط تلك التي تمت مشاركتها مع Insta-SOS.\nلمشاركة المزيد من جهات الاتصال، افتح ';

  @override
  String get bsNumError => 'جهة الاتصال هذه خاصة أو ليس لديها رقم هاتف.';

  @override
  String get bsSOSOnOpen => 'طلب الاستغاثة عند الفتح';

  @override
  String get bsSOSOnClose => 'طلب الاستغاثة عند الإغلاق';

  @override
  String get bsSOSOnCloseHint =>
      'سيظهر زر إغلاق آمن (علامة الإعجاب) على الصفحة الرئيسية، مقابل الإعدادات.\nإذا فقد InstaSOS التركيز لأي سبب باستثناء زر الإغلاق الآمن (تصغير التطبيق، التبديل بين التطبيقات، إيقاف الشاشة)، سيبدأ بث طلب الاستغاثة (SOS).';

  @override
  String get bsSOSOnCloseHintFix =>
      'سيظهر زر إغلاق آمن (علامة الإعجاب) على الصفحة الرئيسية، مقابل الإعدادات.\nإذا فقد Insta-SOS التركيز لأي سبب باستثناء زر الإغلاق الآمن (تصغير التطبيق، التبديل بين التطبيقات، إيقاف الشاشة)، سيبدأ بث طلب الاستغاثة (SOS).';

  @override
  String get bsCloseOffWarning =>
      'سيتم إغلاق التطبيق تلقائياً لمنع عمليات البث غير المقصودة.';

  @override
  String get bsSOSOnVideo => 'طلب الاستغاثة عند مقاطعة التسجيل';

  @override
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';

  @override
  String get dsShowBack => 'إظهار زر الرجوع؟';
}
