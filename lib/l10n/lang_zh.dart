// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class LangZh extends Lang {
  LangZh([String locale = 'zh']) : super(locale);

  @override
  String get gOk => '确定';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => '提醒';

  @override
  String get gNotAgain => '不再显示';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => '已知最后位置';

  @override
  String get sosNeedSMS => 'SOS功能需要短信权限以正常运行。';

  @override
  String get sosDisabled => '无法访问定位（已关闭）';

  @override
  String get sosDenied => '无法访问定位（权限被拒）';

  @override
  String get sosError => '无法访问定位（出错）';

  @override
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsWelcomeFix => 'Welcome to Insta-SOS';

  @override
  String get hsAppIntro =>
      'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.';

  @override
  String get hsAppIntroAlt =>
      'The latest update was a big one, let\'s make sure everything is ready below.';

  @override
  String get hsYourApp => 'You can change your mind/permissions at any time.';

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
      'Camera permissions setup. Activate to enable.';

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
      'Contacts permission setup. Activate to enable.';

  @override
  String get hsTexting => 'Texting';

  @override
  String get hsAddTexting => 'Part 2 of enabling emergency contact alerts.';

  @override
  String get hsTextingReady => 'Texting is ready';

  @override
  String get hsTextingSetupHint => 'SMS permission setup. Activate to enable.';

  @override
  String get hsLocation => 'Location';

  @override
  String get hsUnable => 'Unable to determine';

  @override
  String get hsAddLocation =>
      'Enables location sharing with emergency contacts.';

  @override
  String get hsAddAlways =>
      'Recommended to enable always. Press again to go to the System Settings.';

  @override
  String get hsLocationReady => 'Location is ready';

  @override
  String get hsLocationSetupHint =>
      'Location permission setup. Activate to enable.';

  @override
  String get hsOneOfFour => 'First of four. Continue...';

  @override
  String get hsBroadcastTutorial =>
      '激活SOS后将自动向您的紧急联系人发送短信。\n\n若已授权定位，短信中将包含您的实时位置。\n\n即使设备锁屏，短信也会持续发送。\n\n停止发送可通过关闭SOS或完全退出应用实现。';

  @override
  String get hsBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsIOSBroadcastTutorial =>
      '激活SOS后将自动向您的紧急联系人发送短信。\n\n若已授权定位，短信中将包含您的实时位置。';

  @override
  String get hsIOSBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      '您可以在设置中：\n\n- 添加更多紧急联系人\n- 设置自动SOS\n- 更改应用语言\n- 自定义界面外观\n\n长按设置按钮还可提交反馈。';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      '拍照或录像后，您可以立即分享内容。\n\n默认情况下，录像若被中断，SOS将自动激活。\n\n长按画面中央可查看权限列表。';

  @override
  String get hsIOSVideoTutorial => '拍照或录像后，您可以立即分享内容。\n\n长按画面中央可查看权限列表。';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => '启动以开始SOS广播。';

  @override
  String get hsEndSOS => 'SOS正在广播，点击以停止。';

  @override
  String get hsSafeCloseHint => '一切安全，可直接关闭应用。';

  @override
  String get hsAutoSOS => '自动SOS';

  @override
  String get hsStop => '停止';

  @override
  String get hsCameraHint => '拍摄照片。';

  @override
  String get hsPreviewHint => '长按可切换权限查看模式。';

  @override
  String get hsShowRights => '显示您的权限。';

  @override
  String get hsHideRights => '隐藏您的权限。';

  @override
  String get hsStartRecord => '开始录像。';

  @override
  String get hsEndRecord => '结束录像。';

  @override
  String get hsFlashOff => '闪光灯关闭。点击开启自动闪光。';

  @override
  String get hsFlashAuto => '自动闪光。点击开启闪光灯。';

  @override
  String get hsFlashOn => '闪光灯开启。点击关闭闪光灯。';

  @override
  String get hsFlashTorch => '手电模式。点击关闭闪光灯。';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => '您有权...';

  @override
  String get rvOnFoot => '步行时';

  @override
  String get rvWhileDriving => '驾车时';

  @override
  String get rvAtHome => '在家中';

  @override
  String get rvSharedRemainSilent => '保持沉默。无需撒谎，但您不必回答任何问题。';

  @override
  String get rvSharedDocument => '记录一切。您有权拍照、录像和录音。';

  @override
  String get rvMobilePockets => '拒绝搜查口袋。移民执法人员可进行简单搜身，但无权搜查。';

  @override
  String get rvMobileQuestion => '提出疑问。了解为何被拦截。';

  @override
  String get rvMobileLeave => '如果您没有被拘留，您有权离开。';

  @override
  String get rvDriveSearch => '拒绝对车辆进行搜查。';

  @override
  String get rvDriveID => '作为乘客可拒绝出示身份证明。只有驾驶员必须出示。';

  @override
  String get rvDriveWarrant => '询问警官是否持有搜查令。如有，您有权查看。未由法官签署的“搜查令”无效。';

  @override
  String get rvHomeWarrant =>
      '保持房门关闭。如对方称持有搜查令，请先让其从门缝递进。未由法官签署的“搜查令”无效。始终保持房门关闭。';

  @override
  String get rvSharedSign => '拒绝签署任何文件。';

  @override
  String get rvSharedFingerprint => '除非被正式逮捕，可拒绝接受移民局采集指纹。';

  @override
  String get rvSharedLawyer => '您有权联系律师。如您已被正式逮捕，则有权请求法院为您指派律师。';

  @override
  String get ssAutoShare => '自动共享媒体';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => '界面外观';

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
  String get pmSystem => 'system settings.';

  @override
  String get pmManualPermission =>
      'If you remove a permission in the system settings, it must be restored there too.';

  @override
  String get rmCommunity => 'Community resources';

  @override
  String get rmGov => 'US government resources';

  @override
  String get rmAffiliate => 'None are affiliated with Empathetech LLC';

  @override
  String get rmAffiliateFix => 'None are affiliated with Empathetic LLC';

  @override
  String get faqName => '常见问题';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA => '权利列表汇编自多个公共来源，包括：';

  @override
  String get faqSettings => '这些设置有什么作用？';

  @override
  String get faqAutoShareQ => 'Auto-share pictures/video:';

  @override
  String get faqAutoShareA =>
      ' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.';

  @override
  String get faqLinkQ => 'Link type:';

  @override
  String get faqLinkA =>
      ' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.';

  @override
  String get faqOnOpenQ => 'SOS on open:';

  @override
  String get faqOnOpenA =>
      ' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.';

  @override
  String get faqOnInterruptQ => 'SOS on interrupted recording:';

  @override
  String get faqOnInterruptA =>
      ' if a video recording is active and InstaSOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video recording is active and Insta-SOS loses focus for any reason (minimized, switched apps, screen off), an SOS broadcast will begin.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqUnavailable => 'SOS 显示“无法获取位置”？';

  @override
  String get faqReliability => '为了提高 SOS 的可靠性，请务必在';

  @override
  String get faqLocationPermissions => '位置权限设置中选择“始终允许”';

  @override
  String get faqLocationTrust =>
      '本应用仅在 SOS 广播激活时使用您的位置。InstaSOS 和 Empathetech LLC 均不会跟踪、存储或出售用户数据。';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetech LLC track, store, or sell user data.';

  @override
  String get faqPrivateContact => '联系人是私密的或没有电话号码？';

  @override
  String get faqContactPermissions =>
      '如果您在添加紧急联系人时收到此消息，说明 InstaSOS 没有权限访问该联系人。';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that contact.';

  @override
  String get faqUpdateContacts => '您可以更新联系人权限，请前往';

  @override
  String get faqOSSettings => 'iOS 设置';

  @override
  String get faqMissing => '为什么缺少某些 Android 功能？';

  @override
  String get faqRestricted => '缺失的功能需要短信自动化，而 Apple 不允许开发者自动发送短信（除非使用付费服务）。';

  @override
  String get faqShortcuts => 'iOS 快捷指令呢？\n访问用户快捷指令也受到限制，这会破坏关键功能。主要是：它会中断视频录制。';

  @override
  String get faqLanguages => '为什么不支持 X 语言？';

  @override
  String get faqResponsible => '对权利列表使用机器翻译是不负责任的。请考虑';

  @override
  String get faqContributing => '贡献翻译';

  @override
  String get faqExpand => '以帮助扩展语言选项。';

  @override
  String get faqReset => '重置教程';

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
      'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, go to iOS Settings -> Apps -> InstaSOS';

  @override
  String get bsPartialContactsFix =>
      'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, go to iOS Settings -> Apps -> Insta-SOS';

  @override
  String get bsNumError =>
      'The contact is private or does not have a phone number.';

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
  String get bsVideoSOS => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty => '自由女神像的图片，附有权利列表的预览。';

  @override
  String get dsShowBack => 'Show back button?';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class LangZhCn extends LangZh {
  LangZhCn() : super('zh_CN');

  @override
  String get gOk => '确定';

  @override
  String get gReminder => '提醒';

  @override
  String get gNotAgain => '不再显示';

  @override
  String get sosLastKnown => '已知最后位置';

  @override
  String get sosNeedSMS => 'SOS功能需要短信权限以正常运行。';

  @override
  String get sosDisabled => '无法访问定位（已关闭）';

  @override
  String get sosDenied => '无法访问定位（权限被拒）';

  @override
  String get sosError => '无法访问定位（出错）';

  @override
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsBroadcastTutorial =>
      '激活SOS后将自动向您的紧急联系人发送短信。\n\n若已授权定位，短信中将包含您的实时位置。\n\n即使设备锁屏，短信也会持续发送。\n\n停止发送可通过关闭SOS或完全退出应用实现。';

  @override
  String get hsIOSBroadcastTutorial =>
      '激活SOS后将自动向您的紧急联系人发送短信。\n\n若已授权定位，短信中将包含您的实时位置。';

  @override
  String get hsSettingsTutorial =>
      '您可以在设置中：\n\n- 添加更多紧急联系人\n- 设置自动SOS\n- 更改应用语言\n- 自定义界面外观\n\n长按设置按钮还可提交反馈。';

  @override
  String get hsVideoTutorial =>
      '拍照或录像后，您可以立即分享内容。\n\n默认情况下，录像若被中断，SOS将自动激活。\n\n长按画面中央可查看权限列表。';

  @override
  String get hsIOSVideoTutorial => '拍照或录像后，您可以立即分享内容。\n\n长按画面中央可查看权限列表。';

  @override
  String get hsStartSOS => '启动以开始SOS广播。';

  @override
  String get hsEndSOS => 'SOS正在广播，点击以停止。';

  @override
  String get hsSafeCloseHint => '一切安全，可直接关闭应用。';

  @override
  String get hsAutoSOS => '自动SOS';

  @override
  String get hsStop => '停止';

  @override
  String get hsCameraHint => '拍摄照片。';

  @override
  String get hsPreviewHint => '长按可切换权限查看模式。';

  @override
  String get hsShowRights => '显示您的权限。';

  @override
  String get hsHideRights => '隐藏您的权限。';

  @override
  String get hsStartRecord => '开始录像。';

  @override
  String get hsEndRecord => '结束录像。';

  @override
  String get hsFlashOff => '闪光灯关闭。点击开启自动闪光。';

  @override
  String get hsFlashAuto => '自动闪光。点击开启闪光灯。';

  @override
  String get hsFlashOn => '闪光灯开启。点击关闭闪光灯。';

  @override
  String get hsFlashTorch => '手电模式。点击关闭闪光灯。';

  @override
  String get rvSharedHeader => '您有权...';

  @override
  String get rvOnFoot => '步行时';

  @override
  String get rvWhileDriving => '驾车时';

  @override
  String get rvAtHome => '在家中';

  @override
  String get rvSharedRemainSilent => '保持沉默。无需撒谎，但您不必回答任何问题。';

  @override
  String get rvSharedDocument => '记录一切。您有权拍照、录像和录音。';

  @override
  String get rvMobilePockets => '拒绝搜查口袋。移民执法人员可进行简单搜身，但无权搜查。';

  @override
  String get rvMobileQuestion => '提出疑问。了解为何被拦截。';

  @override
  String get rvMobileLeave => '如果您没有被拘留，您有权离开。';

  @override
  String get rvDriveSearch => '拒绝对车辆进行搜查。';

  @override
  String get rvDriveID => '作为乘客可拒绝出示身份证明。只有驾驶员必须出示。';

  @override
  String get rvDriveWarrant => '询问警官是否持有搜查令。如有，您有权查看。未由法官签署的“搜查令”无效。';

  @override
  String get rvHomeWarrant =>
      '保持房门关闭。如对方称持有搜查令，请先让其从门缝递进。未由法官签署的“搜查令”无效。始终保持房门关闭。';

  @override
  String get rvSharedSign => '拒绝签署任何文件。';

  @override
  String get rvSharedFingerprint => '除非被正式逮捕，可拒绝接受移民局采集指纹。';

  @override
  String get rvSharedLawyer => '您有权联系律师。如您已被正式逮捕，则有权请求法院为您指派律师。';

  @override
  String get ssAutoShare => '自动共享媒体';

  @override
  String get ssAppearance => '界面外观';

  @override
  String get faqName => '常见问题';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA => '权利列表汇编自多个公共来源，包括：';

  @override
  String get faqSettings => '这些设置有什么作用？';

  @override
  String get faqUnavailable => 'SOS 显示“无法获取位置”？';

  @override
  String get faqReliability => '为了提高 SOS 的可靠性，请务必在';

  @override
  String get faqLocationPermissions => '位置权限设置中选择“始终允许”';

  @override
  String get faqLocationTrust =>
      '本应用仅在 SOS 广播激活时使用您的位置。InstaSOS 和 Empathetech LLC 均不会跟踪、存储或出售用户数据。';

  @override
  String get faqPrivateContact => '联系人是私密的或没有电话号码？';

  @override
  String get faqContactPermissions =>
      '如果您在添加紧急联系人时收到此消息，说明 InstaSOS 没有权限访问该联系人。';

  @override
  String get faqUpdateContacts => '您可以更新联系人权限，请前往';

  @override
  String get faqOSSettings => 'iOS 设置';

  @override
  String get faqMissing => '为什么缺少某些 Android 功能？';

  @override
  String get faqRestricted => '缺失的功能需要短信自动化，而 Apple 不允许开发者自动发送短信（除非使用付费服务）。';

  @override
  String get faqShortcuts => 'iOS 快捷指令呢？\n访问用户快捷指令也受到限制，这会破坏关键功能。主要是：它会中断视频录制。';

  @override
  String get faqLanguages => '为什么不支持 X 语言？';

  @override
  String get faqResponsible => '对权利列表使用机器翻译是不负责任的。请考虑';

  @override
  String get faqContributing => '贡献翻译';

  @override
  String get faqExpand => '以帮助扩展语言选项。';

  @override
  String get faqReset => '重置教程';

  @override
  String get dsLadyLiberty => '自由女神像的图片，附有权利列表的预览。';
}
