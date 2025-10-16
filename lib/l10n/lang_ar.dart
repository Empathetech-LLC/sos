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
      'عند التمكين، سيظهر زر إغلاق آمن مقابل الإعدادات.';

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
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';
}

/// The translations for Arabic, as used in Egypt (`ar_EG`).
class LangArEg extends LangAr {
  LangArEg() : super('ar_EG');

  @override
  String get gOk => 'حسنًا';

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
      'عند التمكين، سيظهر زر إغلاق آمن مقابل الإعدادات.';

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
  String get dsLadyLiberty => 'صورة لتمثال الحرية، مع معاينة لقائمة الحقوق.';
}
