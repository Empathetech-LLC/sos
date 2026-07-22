// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class LangUk extends Lang {
  LangUk([String locale = 'uk']) : super(locale);

  @override
  String get gOk => 'Ок';

  @override
  String get gDone => 'Готово';

  @override
  String get gReminder => 'Нагадування';

  @override
  String get gSystem => 'Системні налаштування';

  @override
  String get gNotAgain => 'Більше не показувати';

  @override
  String get gOnCloseWarning =>
      '\"SOS при закритті\" увімкнено. Це почне розсилку.';

  @override
  String get sosLastKnown => 'останнє відоме місцезнаходження:';

  @override
  String get sosNeedSMS =>
      'Для SOS потрібен дозвіл на SMS (обмін повідомленнями).';

  @override
  String get sosDisabled => 'Немає доступу до геоданих (вимкнено)';

  @override
  String get sosDenied => 'Немає доступу до геоданих (відхилено)';

  @override
  String get sosError => 'Немає доступу до геоданих (помилка)';

  @override
  String get hsWelcome => 'Ласкаво просимо до InstaSOS';

  @override
  String get hsWelcomeFix => 'Ласкаво просимо до Insta-SOS';

  @override
  String get hsAppIntro =>
      'Для початку, це лише додаток \"Знай свої права\".\nВи можете ввімкнути більше інструментів, надавши їм дозвіл у списку нижче.';

  @override
  String get hsAppIntroAlt =>
      'Останнє оновлення було великим, давайте переконаємося, що все налаштовано нижче.';

  @override
  String get hsYourApp =>
      'Ви можете змінити своє рішення/дозволи в будь-який час.';

  @override
  String get hsHybridTranslation =>
      'Посібник і налаштування перекладено автоматично.\nСписок прав перекладено людиною.';

  @override
  String get hsCamera => 'Камера';

  @override
  String get hsAddRecording => 'Дозволяє записувати відео';

  @override
  String get hsMic => 'Мікрофон';

  @override
  String get hsSilent => 'Без нього відео будуть без звуку';

  @override
  String get hsGallery => 'Галерея';

  @override
  String get hsAddSave => 'Необхідно для збереження ваших записів';

  @override
  String get hsCameraReady => 'Камера готова';

  @override
  String get hsCameraSetupHint =>
      'Активуйте, щоб надати Insta-SOS дозвіл на доступ до камери';

  @override
  String get hsCameraSnack =>
      'Будь ласка, увімкніть камеру в налаштуваннях (вище),\nа потім спробуйте ще раз';

  @override
  String get hsContacts => 'Контакти';

  @override
  String get hsAddContacts => 'Дозволяє надсилати SOS-повідомлення';

  @override
  String get hsAppleContacts =>
      'Цей крок стосується лише дозволів програми.\nВи ще не вибираєте екстрені контакти.\n\nРекомендується дозволити всі, щоб уникнути зайвого клопоту.';

  @override
  String get hsContactsSetupHint =>
      'Активуйте, щоб надати Insta-SOS дозвіл на перегляд ваших контактів.';

  @override
  String get hsSMS =>
      'Android вимагає дозволу на те, кому і як надсилати повідомлення';

  @override
  String get hsTextingSetupHint =>
      'Активуйте, щоб надати Insta-SOS дозвіл на надсилання повідомлень.';

  @override
  String get hsSOSReady => 'SOS готовий';

  @override
  String get hsLocation => 'Місцезнаходження';

  @override
  String get hsAddLocation => 'Додає ваше місцезнаходження до SOS-повідомлень';

  @override
  String get hsAddAlways =>
      'Рекомендується увімкнути \"Завжди\". Натисніть ще раз, щоб відкрити налаштування системи.';

  @override
  String get hsLocationReady => 'Місцезнаходження готове';

  @override
  String get hsLocationSetupHint =>
      'Активуйте, щоб надати Insta-SOS дозвіл на перегляд вашого місцезнаходження.';

  @override
  String get hsUnable => 'Неможливо визначити';

  @override
  String get hsOneOfFour => 'Перше з чотирьох. Продовжити...';

  @override
  String get hsBroadcastTutorial =>
      'Активуйте SOS, щоб автоматично надсилати SMS вашим екстреним контактам.\n\nЯкщо InstaSOS має доступ до ваших геоданих, вони будуть включені в повідомлення.';

  @override
  String get hsBroadcastTutorialFix =>
      'Активуйте SOS, щоб автоматично надсилати SMS вашим екстреним контактам.\n\nЯкщо Insta-SOS має доступ до ваших геоданих, вони будуть включені в повідомлення.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Повідомлення продовжуватимуть надсилатися, коли телефон заблоковано.\n\nЩоб зупинити надсилання, деактивуйте SOS вручну або повністю закрийте додаток.';

  @override
  String get hsTwoOfFour => 'Друге з чотирьох. Продовжити...';

  @override
  String get hsSettingsTutorial =>
      '- Налаштуйте вашу розсилку SOS\n- Змініть зовнішній вигляд додатка\n- Отримайте доступ до додаткових ресурсів та підтримки\n\nв налаштуваннях.';

  @override
  String get hsSettingsTutorialFix =>
      'Ви можете налаштувати розсилку SOS, змінити вигляд додатка та отримати доступ до додаткових ресурсів/підтримки в налаштуваннях.';

  @override
  String get hsThreeOfFour => 'Третє з чотирьох. Продовжити...';

  @override
  String get hsVideoTutorial =>
      'Коли ви робите фото або записуєте відео, ви можете одразу ним поділитися.\n\nЗа замовчуванням, якщо запис перерветься, розсилка SOS почнеться автоматично.\n\nНатисніть і утримуйте попередній перегляд камери, щоб показати/сховати ваші права.';

  @override
  String get hsIOSVideoTutorial =>
      'Коли ви робите фото або записуєте відео, ви можете одразу ним поділитися.\n\nНатисніть і утримуйте попередній перегляд камери, щоб показати/сховати ваші права.';

  @override
  String get hsTutorialComplete => 'Посібник завершено';

  @override
  String get hsAddEMC =>
      'Якщо ви використовуєте сповіщення SOS, будь ласка, перейдіть на сторінку налаштувань і додайте ваші екстрені контакти.';

  @override
  String get hsStartSOS => 'Активуйте, щоб почати розсилку SOS.';

  @override
  String get hsEndSOS => 'Йде розсилка SOS. Активуйте, щоб зупинити.';

  @override
  String get hsSafeCloseHint => 'Все в порядку. Закрити додаток без SOS.';

  @override
  String get hsBroadcasting => 'Йде розсилка';

  @override
  String get hsStop => 'Зупинити';

  @override
  String get hsCameraHint => 'Зробити фото.';

  @override
  String get hsPreviewHint =>
      'Натисніть і утримуйте, щоб показати/сховати ваші права.';

  @override
  String get hsShowRights => 'Показати ваші права.';

  @override
  String get hsHideRights => 'Сховати ваші права.';

  @override
  String get hsStartRecord => 'Записати відео.';

  @override
  String get hsEndRecord => 'Завершити запис.';

  @override
  String get hsFlashOff =>
      'Спалах вимкнено. Активуйте, щоб увімкнути автоматичний спалах.';

  @override
  String get hsFlashAuto =>
      'Автоматичний спалах. Активуйте, щоб увімкнути спалах.';

  @override
  String get hsFlashOn => 'Спалах увімкнено. Активуйте, щоб вимкнути спалах.';

  @override
  String get hsFlashTorch => 'Режим ліхтарика. Активуйте, щоб вимкнути спалах.';

  @override
  String get hsNoFlash => 'Спалах камери не працює';

  @override
  String get rvSharedHeader => 'Ви маєте право...';

  @override
  String get rvOnFoot => 'Пішки';

  @override
  String get rvWhileDriving => 'За кермом';

  @override
  String get rvAtHome => 'Вдома';

  @override
  String get rvSharedRemainSilent =>
      'Зберігати мовчання. Не брешіть, але ви не зобов’язані відповідати на запитання.';

  @override
  String get rvSharedDocument =>
      'Фіксувати все. Ви можете робити фото, записувати відео та аудіо.';

  @override
  String get rvMobilePockets =>
      'Відмовитися від обшуку ваших кишень. ICE може провести поверхневий огляд, але не повний обшук.';

  @override
  String get rvMobileQuestion =>
      'Ставити запитання. Дізнайтеся, чому вас зупинили.';

  @override
  String get rvMobileLeave => 'Піти, якщо вас не затримують.';

  @override
  String get rvDriveSearch => 'Відмовитися від обшуку вашого автомобіля.';

  @override
  String get rvDriveID =>
      'Відмовитися надавати посвідчення особи, якщо ви пасажир. Лише водій зобов’язаний надати ID.';

  @override
  String get rvDriveWarrant =>
      'Запитати, чи мають офіцери ордер. Ви маєте право його побачити. Якщо «ордер» не підписаний суддею, він недійсний.';

  @override
  String get rvHomeWarrant =>
      'Тримати двері зачиненими. Якщо в них є ордер, попросіть просунути його під двері. Якщо «ордер» не підписаний суддею, він недійсний. Тримайте двері зачиненими.';

  @override
  String get rvSharedSign => 'Відмовитися щось підписувати.';

  @override
  String get rvSharedFingerprint =>
      'Відмовитися здавати відбитки пальців для ICE, якщо вас не заарештовано.';

  @override
  String get rvSharedLawyer =>
      'Отримати консультацію адвоката. Якщо вас офіційно заарештовано, вам мають надати адвоката за призначенням суду.';

  @override
  String get ssAutoShare => 'Автоматично ділитися фото/відео';

  @override
  String get ssSOS => 'Налаштування SOS';

  @override
  String get ssAppearance => 'Налаштування вигляду';

  @override
  String get ssPermissions => 'Дозволи';

  @override
  String get ssResources => 'Ресурси';

  @override
  String get ssSupport => 'Підтримка';

  @override
  String get pmOnlyAdd => 'Цей інструмент допомагає лише додавати дозволи.';

  @override
  String get pmRemoveIn => 'Ви можете скасувати дозволи в ';

  @override
  String get pmManualPermission =>
      'Якщо ви скасуєте дозволи в системних налаштуваннях, їх також потрібно буде відновити там.';

  @override
  String get rmCommunity => 'Ресурси спільноти';

  @override
  String get rmGov => 'Урядові ресурси США';

  @override
  String get rmAffiliate => 'Жоден з них не пов\'язаний з YWT';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Як був створений список прав?';

  @override
  String get faqListA =>
      'Список прав було взято з кількох загальнодоступних ресурсів, зокрема:';

  @override
  String get faqSettings => 'Як працюють налаштування?';

  @override
  String get faqAutoShareA =>
      ' використовує вбудовану функцію обміну вашого телефону. Вона не використовує збережені екстрені контакти (якщо такі є). Поширення є необов\'язковим і його завжди можна скасувати.';

  @override
  String get faqLinkA =>
      ' як ваші геодані будуть доставлені вашим екстреним контактам. \"Google Maps\", \"Apple Maps\" та \"Waze\" надішлють активне посилання на відповідний сервіс. \"Coordinates\" надішле вашу широту та довготу у вигляді звичайного тексту.';

  @override
  String get faqOnOpenA =>
      ' розсилка SOS розпочнеться відразу після запуску додатка. Не рекомендується для більшості користувачів, оскільки це може призвести до випадкових розсилок.';

  @override
  String get faqOnInterruptA =>
      ' якщо записується відео, і InstaSOS втрачає фокус, розпочнеться розсилка SOS. Втрата фокусу: згортання додатка, перемикання між додатками та/або блокування екрана. Рекомендується ввімкнути або це, або \"SOS при закритті\" (або обидва).';

  @override
  String get faqOnInterruptAFix =>
      ' якщо записується відео, і Insta-SOS втрачає фокус, розпочнеться розсилка SOS. Втрата фокусу: згортання додатка, перемикання між додатками та/або блокування екрана. Рекомендується ввімкнути або це, або \"SOS при закритті\" (або обидва).';

  @override
  String get faqUnavailable => 'SOS каже \"Геодані недоступні\"?';

  @override
  String get faqReliability =>
      'Щоб підвищити надійність SOS, будь ласка, увімкніть \"Дозволяти завжди\" в ';

  @override
  String get faqLocationPermissions => 'дозволах на геодані';

  @override
  String get faqLocationTrust =>
      'Додаток використовує ваші геодані лише під час активної розсилки SOS. Ані InstaSOS, ані YWT не відстежують, не зберігають і не продають дані користувачів.';

  @override
  String get faqLocationTrustFix =>
      'Додаток використовує ваші геодані лише під час активної розсилки SOS. Ані Insta-SOS, ані YWT не відстежують, не зберігають і не продають дані користувачів.';

  @override
  String get faqContactPermissions =>
      'Якщо ви отримуєте це повідомлення під час додавання екстреного контакту, InstaSOS не має дозволу на доступ до цього конкретного контакту.';

  @override
  String get faqContactPermissionsFix =>
      'Якщо ви отримуєте це повідомлення під час додавання екстреного контакту, Insta-SOS не має дозволу на доступ до цього конкретного контакту.';

  @override
  String get faqUpdateContacts =>
      'Ви можете надати доступ до більшої кількості (або всіх) контактів у ';

  @override
  String get faqSplitClarity1 =>
      'Надання доступу до контакту не робить його екстреним контактом. Лише номери, вказані в ';

  @override
  String get faqSplitClarity2 =>
      ' отримають повідомлення під час розсилки SOS.';

  @override
  String get faqMissing => 'Чому деякі функції Android відсутні?';

  @override
  String get faqRestricted =>
      'Відсутні функції вимагають автоматизації SMS, а Apple не дозволяє розробникам автоматизувати текстові повідомлення (без платного сервісу).';

  @override
  String get faqShortcuts =>
      'А як щодо швидких команд iOS?\nТакож існують обмеження на доступ до швидких команд користувача, що порушило б роботу важливих функцій. Насамперед: це перервало б запис відео.';

  @override
  String get faqLanguages => 'Чому мова X недоступна?';

  @override
  String get faqResponsible =>
      'Було б безвідповідально використовувати машинний переклад для списку прав. Будь ласка, подумайте про те, щоб ';

  @override
  String get faqContributing => 'зробити свій внесок';

  @override
  String get faqExpand => ', щоб допомогти розширити мовні варіанти.';

  @override
  String get faqReset => 'Скинути посібник';

  @override
  String get faqContact => 'Звернутися до служби підтримки';

  @override
  String get faqContactHint => 'Надіслати email YWT';

  @override
  String get bsEMC => 'Екстрені контакти';

  @override
  String get bsAddSomeone => 'Додайте когось, щоб увімкнути SOS';

  @override
  String get bsRemoveHint => 'Видалити контакт';

  @override
  String get bsAddHint => 'Додати ще один контакт';

  @override
  String get bsLinkType => 'Тип посилання на геодані';

  @override
  String get bsSnackRequest => 'Будь ласка, додайте екстрені контакти';

  @override
  String get bsNeedPermission => 'Неможливо додати контакти без дозволу';

  @override
  String get bsPartialContacts =>
      'Apple відображатиме всі контакти, а не лише ті, до яких надано доступ InstaSOS.\nЩоб поділитися більшою кількістю контактів, відкрийте ';

  @override
  String get bsPartialContactsFix =>
      'Apple відображатиме всі контакти, а не лише ті, до яких надано доступ Insta-SOS.\nЩоб поділитися більшою кількістю контактів, відкрийте ';

  @override
  String get bsNumError =>
      'Цей контакт є приватним або не має номера телефону.';

  @override
  String get bsSOSOnOpen => 'SOS при відкритті';

  @override
  String get bsSOSOnClose => 'SOS при закритті';

  @override
  String get bsSOSOnCloseHint =>
      'Кнопка безпечного закриття (великий палець вгору) з\'явиться на головній сторінці навпроти налаштувань.\nЯкщо InstaSOS втрачає фокус з будь-якої причини, крім натискання кнопки безпечного закриття (згорнуто, перемикання між додатками, вимкнення екрана), розпочнеться розсилка SOS.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Кнопка безпечного закриття (великий палець вгору) з\'явиться на головній сторінці навпроти налаштувань.\nЯкщо Insta-SOS втрачає фокус з будь-якої причини, крім натискання кнопки безпечного закриття (згорнуто, перемикання між додатками, вимкнення екрана), розпочнеться розсилка SOS.';

  @override
  String get bsCloseOffWarning =>
      'Додаток автоматично закриється, щоб запобігти випадковим розсилкам.';

  @override
  String get bsSOSOnVideo => 'SOS при перерваному записі';

  @override
  String get dsLadyLiberty =>
      'Зображення Статуї Свободи з попереднім переглядом списку прав.';
}
