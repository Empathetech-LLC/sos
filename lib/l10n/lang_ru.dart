// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LangRu extends Lang {
  LangRu([String locale = 'ru']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Готово';

  @override
  String get gReminder => 'Напоминание';

  @override
  String get gSystem => 'Системные настройки';

  @override
  String get gNotAgain => 'Больше не показывать';

  @override
  String get gOnCloseWarning =>
      '\"SOS при закрытии\" включен. Это запустит трансляцию.';

  @override
  String get sosLastKnown => 'последнее известное местоположение:';

  @override
  String get sosNeedSMS =>
      'Для работы SOS требуется разрешение на отправку SMS.';

  @override
  String get sosDisabled => 'Нет доступа к местоположению (отключено)';

  @override
  String get sosDenied => 'Нет доступа к местоположению (отказано)';

  @override
  String get sosError => 'Нет доступа к местоположению (ошибка)';

  @override
  String get hsWelcome => 'Добро пожаловать в InstaSOS';

  @override
  String get hsWelcomeFix => 'Добро пожаловать в Insta-SOS';

  @override
  String get hsAppIntro =>
      'Для начала, это просто приложение для знания своих прав.\nВы можете включить больше инструментов, предоставив им разрешения в списке ниже.';

  @override
  String get hsAppIntroAlt =>
      'Последнее обновление было крупным, давайте убедимся, что всё готово, ниже.';

  @override
  String get hsYourApp =>
      'Вы можете изменить свое решение/разрешения в любое время.';

  @override
  String get hsHybridTranslation =>
      'Обучение и настройки переведены машинным способом.\nСписок прав переведен человеком.';

  @override
  String get hsCamera => 'Камера';

  @override
  String get hsAddRecording => 'Включает запись видео';

  @override
  String get hsMic => 'Микрофон';

  @override
  String get hsSilent => 'Без него видео будут без звука';

  @override
  String get hsGallery => 'Галерея';

  @override
  String get hsAddSave => 'Требуется для сохранения ваших записей';

  @override
  String get hsCameraReady => 'Камера готова';

  @override
  String get hsCameraSetupHint =>
      'Активируйте, чтобы дать Insta-SOS разрешение на использование камеры';

  @override
  String get hsCameraSnack =>
      'Пожалуйста, включите камеру в настройках (выше)\nзатем попробуйте снова';

  @override
  String get hsContacts => 'Контакты';

  @override
  String get hsAddContacts => 'Включает сообщения SOS';

  @override
  String get hsAppleContacts =>
      'Этот шаг только для разрешений приложения.\nВы пока не выбираете экстренные контакты.\n\nРекомендуется разрешить всё, чтобы избежать лишних проблем.';

  @override
  String get hsContactsSetupHint =>
      'Активируйте, чтобы дать Insta-SOS разрешение на просмотр ваших контактов.';

  @override
  String get hsSMS =>
      'Android требует разрешения на то, кому и как отправлять сообщения';

  @override
  String get hsTextingSetupHint =>
      'Активируйте, чтобы дать Insta-SOS разрешение на отправку сообщений.';

  @override
  String get hsSOSReady => 'SOS готов';

  @override
  String get hsLocation => 'Местоположение';

  @override
  String get hsAddLocation => 'Добавляет ваше местоположение в сообщения SOS';

  @override
  String get hsAddAlways =>
      'Рекомендуется включить параметр «Всегда». Нажмите еще раз, чтобы открыть системные настройки.';

  @override
  String get hsLocationReady => 'Местоположение готово';

  @override
  String get hsLocationSetupHint =>
      'Активируйте, чтобы дать Insta-SOS разрешение на использование вашего местоположения.';

  @override
  String get hsUnable => 'Не удалось определить';

  @override
  String get hsOneOfFour => 'Первый из четырех. Продолжить...';

  @override
  String get hsBroadcastTutorial =>
      'Активируйте SOS для автоматической отправки сообщений вашим экстренным контактам.\n\nЕсли у InstaSOS есть доступ к вашему местоположению, оно будет включено в сообщения.';

  @override
  String get hsBroadcastTutorialFix =>
      'Активируйте SOS для автоматической отправки сообщений вашим экстренным контактам.\n\nЕсли у Insta-SOS есть доступ к вашему местоположению, оно будет включено в сообщения.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Сообщения будут отправляться даже при заблокированном телефоне.\n\nВручную отключите SOS или полностью закройте приложение, чтобы остановить отправку.';

  @override
  String get hsTwoOfFour => 'Второй из четырех. Продолжить...';

  @override
  String get hsSettingsTutorial =>
      '- Настройте трансляцию SOS\n- Измените внешний вид приложения\n- Получите доступ к ресурсам и поддержке\n\nв настройках.';

  @override
  String get hsSettingsTutorialFix =>
      'Вы можете настроить трансляцию SOS, изменить внешний вид приложения и получить доступ к ресурсам/поддержке в настройках.';

  @override
  String get hsThreeOfFour => 'Третий из четырех. Продолжить...';

  @override
  String get hsVideoTutorial =>
      'Когда вы делаете фото или записываете видео, вы можете сразу же им поделиться.\n\nПо умолчанию, если запись прерывается, трансляция SOS начнется автоматически.\n\nДолгое нажатие на экран камеры покажет/скроет список ваших прав.';

  @override
  String get hsIOSVideoTutorial =>
      'Когда вы делаете фото или записываете видео, вы можете сразу же им поделиться.\n\nДолгое нажатие на экран камеры покажет/скроет список ваших прав.';

  @override
  String get hsTutorialComplete => 'Обучение завершено';

  @override
  String get hsAddEMC =>
      'Если вы используете оповещения SOS, перейдите на страницу настроек и добавьте экстренные контакты.';

  @override
  String get hsStartSOS => 'Активируйте для запуска трансляции SOS.';

  @override
  String get hsEndSOS => 'Идет трансляция SOS. Активируйте для остановки.';

  @override
  String get hsSafeCloseHint => 'Всё в порядке. Закрыть приложение без SOS.';

  @override
  String get hsBroadcasting => 'Трансляция';

  @override
  String get hsStop => 'Стоп';

  @override
  String get hsCameraHint => 'Сделать фото.';

  @override
  String get hsPreviewHint =>
      'Долгое нажатие, чтобы показать/скрыть ваши права.';

  @override
  String get hsShowRights => 'Показать ваши права.';

  @override
  String get hsHideRights => 'Скрыть ваши права.';

  @override
  String get hsStartRecord => 'Записать видео.';

  @override
  String get hsEndRecord => 'Завершить запись.';

  @override
  String get hsFlashOff =>
      'Вспышка выключена. Активируйте, чтобы включить автоматическую вспышку.';

  @override
  String get hsFlashAuto =>
      'Автоматическая вспышка. Активируйте, чтобы включить вспышку.';

  @override
  String get hsFlashOn =>
      'Вспышка включена. Активируйте, чтобы выключить вспышку.';

  @override
  String get hsFlashTorch =>
      'Режим фонарика. Активируйте, чтобы выключить вспышку.';

  @override
  String get hsNoFlash => 'Вспышка камеры не работает';

  @override
  String get rvSharedHeader => 'У вас есть право...';

  @override
  String get rvOnFoot => 'Пешком';

  @override
  String get rvWhileDriving => 'За рулём';

  @override
  String get rvAtHome => 'Дома';

  @override
  String get rvSharedRemainSilent =>
      'Хранить молчание. Не лгите, но вы не обязаны отвечать на вопросы.';

  @override
  String get rvSharedDocument =>
      'Документировать всё. Вы имеете право фотографировать, снимать видео и записывать аудио.';

  @override
  String get rvMobilePockets =>
      'Отказаться от обыска ваших карманов. ICE может провести поверхностный досмотр, но не обыск.';

  @override
  String get rvMobileQuestion =>
      'Задавать вопросы. Узнайте, почему вас остановили.';

  @override
  String get rvMobileLeave => 'Уйти, если вы не задержаны.';

  @override
  String get rvDriveSearch => 'Отказаться от обыска вашего автомобиля.';

  @override
  String get rvDriveID =>
      'Отказаться предоставлять удостоверение личности как пассажир. Только водитель обязан предоставить ID.';

  @override
  String get rvDriveWarrant =>
      'Спросить, есть ли у офицеров ордер. Вы имеете право его увидеть. Если «ордер» не подписан судьёй, он недействителен.';

  @override
  String get rvHomeWarrant =>
      'Держать дверь закрытой. Если у них есть ордер, попросите просунуть его под дверь. Если «ордер» не подписан судьёй, он недействителен. Держите дверь закрытой.';

  @override
  String get rvSharedSign => 'Отказаться что-либо подписывать.';

  @override
  String get rvSharedFingerprint =>
      'Отказаться сдавать отпечатки пальцев ICE, если вы не арестованы.';

  @override
  String get rvSharedLawyer =>
      'На консультацию с адвокатом. Если вы официально арестованы, вам положен назначенный судом адвокат.';

  @override
  String get ssAutoShare => 'Авто-отправка фото/видео';

  @override
  String get ssSOS => 'Настройки SOS';

  @override
  String get ssAppearance => 'Настройки внешнего вида';

  @override
  String get ssPermissions => 'Разрешения';

  @override
  String get ssResources => 'Ресурсы';

  @override
  String get ssSupport => 'Поддержка';

  @override
  String get pmOnlyAdd =>
      'Этот инструмент помогает только добавлять разрешения.';

  @override
  String get pmRemoveIn => 'Вы можете удалить разрешения в ';

  @override
  String get pmManualPermission =>
      'Если вы удалите разрешения в системных настройках, их нужно будет восстанавливать там же.';

  @override
  String get rmCommunity => 'Ресурсы сообщества';

  @override
  String get rmGov => 'Государственные ресурсы США';

  @override
  String get rmAffiliate => 'Ни один из них не связан с YWT';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Как был составлен список прав?';

  @override
  String get faqListA =>
      'Список прав был взят из нескольких общедоступных ресурсов, включая:';

  @override
  String get faqSettings => 'Как работают настройки?';

  @override
  String get faqAutoShareA =>
      ' использует встроенную функцию поделиться в вашем телефоне. Не использует сохраненные экстренные контакты (если они есть). Отправка необязательна и её всегда можно отменить.';

  @override
  String get faqLinkA =>
      ' как ваше местоположение будет доставлено экстренным контактам. «Google Карты», «Apple Карты» и «Waze» отправят кликабельную ссылку на соответствующий сервис. «Координаты» отправят вашу широту и долготу в виде простого текста.';

  @override
  String get faqOnOpenA =>
      ' трансляция SOS начнется сразу при запуске приложения. Не рекомендуется для большинства пользователей, так как это может привести к случайным трансляциям.';

  @override
  String get faqOnInterruptA =>
      ' если идет запись видео и InstaSOS теряет фокус, начнется трансляция SOS. Потеря фокуса — это: сворачивание приложения, переключение на другое приложение и/или блокировка экрана. Рекомендуется включить это или «SOS при закрытии» (или и то, и другое).';

  @override
  String get faqOnInterruptAFix =>
      ' если идет запись видео и Insta-SOS теряет фокус, начнется трансляция SOS. Потеря фокуса — это: сворачивание приложения, переключение на другое приложение и/или блокировка экрана. Рекомендуется включить это или «SOS при закрытии» (или и то, и другое).';

  @override
  String get faqUnavailable => 'SOS говорит «Местоположение недоступно»?';

  @override
  String get faqReliability =>
      'Чтобы повысить надежность SOS, пожалуйста, включите «Разрешать всегда» в ';

  @override
  String get faqLocationPermissions => 'разрешениях на местоположение';

  @override
  String get faqLocationTrust =>
      'Приложение использует ваше местоположение только во время активной трансляции SOS. Ни InstaSOS, ни YWT не отслеживают, не хранят и не продают пользовательские данные.';

  @override
  String get faqLocationTrustFix =>
      'Приложение использует ваше местоположение только во время активной трансляции SOS. Ни Insta-SOS, ни YWT не отслеживают, не хранят и не продают пользовательские данные.';

  @override
  String get faqContactPermissions =>
      'Если вы получаете это сообщение при добавлении экстренного контакта, у InstaSOS нет разрешения на доступ к этому конкретному контакту.';

  @override
  String get faqContactPermissionsFix =>
      'Если вы получаете это сообщение при добавлении экстренного контакта, у Insta-SOS нет разрешения на доступ к этому конкретному контакту.';

  @override
  String get faqUpdateContacts =>
      'Вы можете дать доступ к большему количеству (или всем) контактам в ';

  @override
  String get faqSplitClarity1 =>
      'Предоставление доступа к контакту не делает его экстренным. Только номера, указанные в ';

  @override
  String get faqSplitClarity2 => ' получат сообщение во время трансляции SOS.';

  @override
  String get faqMissing => 'Почему отсутствуют некоторые функции Android?';

  @override
  String get faqRestricted =>
      'Недостающие функции требуют автоматизации SMS, а Apple не позволяет разработчикам автоматизировать текстовые сообщения (без платного сервиса).';

  @override
  String get faqShortcuts =>
      'Как насчет команд (shortcuts) iOS?\nСуществуют также ограничения на доступ к командам пользователя, что нарушило бы работу важных функций. В первую очередь: это бы прерывало запись видео.';

  @override
  String get faqLanguages => 'Почему язык X недоступен?';

  @override
  String get faqResponsible =>
      'Было бы безответственно использовать машинный перевод для списка прав. Пожалуйста, рассмотрите возможность ';

  @override
  String get faqContributing => 'сделать свой вклад';

  @override
  String get faqExpand => ' , чтобы помочь расширить доступные языки.';

  @override
  String get faqReset => 'Сбросить обучение';

  @override
  String get faqContact => 'Связаться с поддержкой';

  @override
  String get faqContactHint => 'Написать в YWT';

  @override
  String get bsEMC => 'Экстренные контакты';

  @override
  String get bsAddSomeone => 'Добавьте кого-нибудь, чтобы включить SOS';

  @override
  String get bsRemoveHint => 'Удалить контакт';

  @override
  String get bsAddHint => 'Добавить еще один контакт';

  @override
  String get bsLinkType => 'Тип ссылки на местоположение';

  @override
  String get bsSnackRequest => 'Пожалуйста, добавьте экстренные контакты';

  @override
  String get bsNeedPermission => 'Невозможно добавить контакты без разрешения';

  @override
  String get bsPartialContacts =>
      'Apple отобразит все контакты, а не только те, которыми вы поделились с InstaSOS.\nЧтобы поделиться большим количеством контактов, откройте ';

  @override
  String get bsPartialContactsFix =>
      'Apple отобразит все контакты, а не только те, которыми вы поделились с Insta-SOS.\nЧтобы поделиться большим количеством контактов, откройте ';

  @override
  String get bsNumError => 'Этот контакт скрыт или не имеет номера телефона.';

  @override
  String get bsSOSOnOpen => 'SOS при открытии';

  @override
  String get bsSOSOnClose => 'SOS при закрытии';

  @override
  String get bsSOSOnCloseHint =>
      'Кнопка безопасного закрытия (большой палец вверх) появится на главной странице напротив настроек.\nЕсли InstaSOS потеряет фокус по любой причине, кроме нажатия кнопки безопасного закрытия (свернуто, переключение приложений, выключение экрана), начнется трансляция SOS.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Кнопка безопасного закрытия (большой палец вверх) появится на главной странице напротив настроек.\nЕсли Insta-SOS потеряет фокус по любой причине, кроме нажатия кнопки безопасного закрытия (свернуто, переключение приложений, выключение экрана), начнется трансляция SOS.';

  @override
  String get bsCloseOffWarning =>
      'Приложение закроется автоматически, чтобы предотвратить случайные трансляции.';

  @override
  String get bsSOSOnVideo => 'SOS при прерывании записи';

  @override
  String get dsLadyLiberty =>
      'Изображение Статуи Свободы с предварительным просмотром списка прав.';
}
