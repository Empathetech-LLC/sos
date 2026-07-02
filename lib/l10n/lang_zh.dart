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
  String get gDone => '完成';

  @override
  String get gReminder => '提醒';

  @override
  String get gSystem => '系统设置';

  @override
  String get gNotAgain => '不再显示';

  @override
  String get gOnCloseWarning => '已启用“关闭时发送 SOS”。这将触发 SOS 广播。';

  @override
  String get sosLastKnown => '最后已知位置：';

  @override
  String get sosNeedSMS => 'SOS 需要短信（发送信息）权限。';

  @override
  String get sosDisabled => '无法获取位置（已禁用）';

  @override
  String get sosDenied => '无法获取位置（被拒绝）';

  @override
  String get sosError => '无法获取位置（发生错误）';

  @override
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsWelcomeFix => '欢迎使用 Insta-SOS';

  @override
  String get hsAppIntro =>
      '首先，这只是一个“了解你的权利 (Know Your Rights)”应用。\n您可以通过在下方的列表中授予权限来启用更多工具。';

  @override
  String get hsAppIntroAlt => '最新版本进行了重大更新，请在下方确保一切准备就绪。';

  @override
  String get hsYourApp => '您可以随时改变主意或更改权限。';

  @override
  String get hsHybridTranslation => '教程和设置是机器翻译的。\n权利列表是人工翻译的。';

  @override
  String get hsCamera => '相机';

  @override
  String get hsAddRecording => '启用视频录制';

  @override
  String get hsMic => '麦克风';

  @override
  String get hsSilent => '未开启此权限，视频将静音';

  @override
  String get hsGallery => '相册';

  @override
  String get hsAddSave => '保存您的录像所需';

  @override
  String get hsCameraReady => '相机已准备就绪';

  @override
  String get hsCameraSetupHint => '激活以授予 Insta-SOS 相机权限';

  @override
  String get hsCameraSnack => '请在设置中（上方）启用相机\n然后重试';

  @override
  String get hsContacts => '联系人';

  @override
  String get hsAddContacts => '启用 SOS 消息';

  @override
  String get hsAppleContacts => '此步骤仅用于应用权限。\n您还未选择紧急联系人。\n\n建议允许全部以减少麻烦。';

  @override
  String get hsContactsSetupHint => '激活以授予 Insta-SOS 查看联系人的权限。';

  @override
  String get hsSMS => 'Android 系统需要发短信给谁以及如何发送的权限';

  @override
  String get hsTextingSetupHint => '激活以授予 Insta-SOS 发送消息的权限。';

  @override
  String get hsSOSReady => 'SOS 已准备就绪';

  @override
  String get hsLocation => '位置';

  @override
  String get hsAddLocation => '在 SOS 消息中添加您的位置信息';

  @override
  String get hsAddAlways => '建议设为始终允许。再次点击以打开系统设置。';

  @override
  String get hsLocationReady => '位置信息已准备就绪';

  @override
  String get hsLocationSetupHint => '激活以授予 Insta-SOS 查看您的位置的权限。';

  @override
  String get hsUnable => '无法确定';

  @override
  String get hsOneOfFour => '四分之一。继续...';

  @override
  String get hsBroadcastTutorial =>
      '激活 SOS 以自动向您的紧急联系人发送短信。\n\n当 InstaSOS 有权访问您的位置时，它将包含在短信中。';

  @override
  String get hsBroadcastTutorialFix =>
      '激活 SOS 以自动向您的紧急联系人发送短信。\n\n当 Insta-SOS 有权访问您的位置时，它将包含在短信中。';

  @override
  String get hsBroadcastTutorialAndroid =>
      '当手机锁屏时，短信将继续发送。\n\n手动停用 SOS 或完全关闭应用程序以停止发送短信。';

  @override
  String get hsTwoOfFour => '四分之二。继续...';

  @override
  String get hsSettingsTutorial =>
      '在设置中：\n- 配置您的 SOS 广播\n- 自定义应用的外观\n- 获取更多资源和支持';

  @override
  String get hsSettingsTutorialFix => '您可以在设置中配置您的 SOS 广播、自定义应用外观以及获取更多资源和支持。';

  @override
  String get hsThreeOfFour => '四分之三。继续...';

  @override
  String get hsVideoTutorial =>
      '拍照或录制视频后，您可以立即分享。\n\n默认情况下，如果录制被中断，将自动开始 SOS 广播。\n\n长按相机预览以显示/隐藏您的权利。';

  @override
  String get hsIOSVideoTutorial => '拍照或录制视频后，您可以立即分享。\n\n长按相机预览以显示/隐藏您的权利。';

  @override
  String get hsTutorialComplete => '教程完成';

  @override
  String get hsAddEMC => '如果您使用 SOS 警报，请前往设置页面并添加您的紧急联系人。';

  @override
  String get hsStartSOS => '激活以开始 SOS 广播。';

  @override
  String get hsEndSOS => 'SOS 正在广播。激活以停止。';

  @override
  String get hsSafeCloseHint => '一切安全。在不触发 SOS 的情况下关闭应用。';

  @override
  String get hsBroadcasting => '正在广播';

  @override
  String get hsStop => '停止';

  @override
  String get hsCameraHint => '拍张照片。';

  @override
  String get hsPreviewHint => '长按以显示/隐藏您的权利。';

  @override
  String get hsShowRights => '显示您的权利。';

  @override
  String get hsHideRights => '隐藏您的权利。';

  @override
  String get hsStartRecord => '录制视频。';

  @override
  String get hsEndRecord => '结束录制。';

  @override
  String get hsFlashOff => '闪光灯已关。激活以开启自动闪光灯。';

  @override
  String get hsFlashAuto => '自动闪光灯。激活以开启闪光灯。';

  @override
  String get hsFlashOn => '闪光灯已开。激活以关闭闪光灯。';

  @override
  String get hsFlashTorch => '手电筒模式。激活以关闭闪光灯。';

  @override
  String get hsNoFlash => '相机闪光灯无法使用';

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
  String get ssAutoShare => '自动分享照片/视频';

  @override
  String get ssSOS => 'SOS 设置';

  @override
  String get ssAppearance => '外观设置';

  @override
  String get ssPermissions => '权限';

  @override
  String get ssResources => '资源';

  @override
  String get ssSupport => '支持';

  @override
  String get pmOnlyAdd => '此工具仅用于添加权限。';

  @override
  String get pmRemoveIn => '您可以在以下位置移除权限：';

  @override
  String get pmManualPermission => '如果您在系统设置中移除了权限，也必须在那里恢复它们。';

  @override
  String get rmCommunity => '社区资源';

  @override
  String get rmGov => '美国政府资源';

  @override
  String get rmAffiliate => '均不隶属于 Empathetech LLC';

  @override
  String get rmAffiliateFix => '均不隶属于 Empathetic LLC';

  @override
  String get faqName => '常见问题 (FAQ)';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA => '权利列表取自多个公共资源，包括：';

  @override
  String get faqSettings => '设置是如何工作的？';

  @override
  String get faqAutoShareA =>
      ' 使用您手机的内置分享功能。它不使用您保存的紧急联系人（如果有）。分享是可选的，并且可以随时取消。';

  @override
  String get faqLinkA =>
      ' 您的位置信息将如何发送给您的紧急联系人。“Google 地图”、“Apple 地图”和“Waze”将发送相应服务的可点击链接。“坐标”将以纯文本格式发送您的经纬度。';

  @override
  String get faqOnOpenA => ' 在应用启动时将立即开始 SOS 广播。不推荐大多数用户使用，因为这可能导致意外广播。';

  @override
  String get faqOnInterruptA =>
      ' 如果正在录制视频且 InstaSOS 失去焦点，将开始 SOS 广播。失去焦点包括：最小化应用、切换应用和/或锁屏。建议启用此项或“关闭时发送 SOS”（或两者同时启用）。';

  @override
  String get faqOnInterruptAFix =>
      ' 如果正在录制视频且 Insta-SOS 失去焦点，将开始 SOS 广播。失去焦点包括：最小化应用、切换应用和/或锁屏。建议启用此项或“关闭时发送 SOS”（或两者同时启用）。';

  @override
  String get faqUnavailable => 'SOS 显示“位置不可用”？';

  @override
  String get faqReliability => '为了提高 SOS 的可靠性，请在以下位置启用“始终允许”：';

  @override
  String get faqLocationPermissions => '位置权限';

  @override
  String get faqLocationTrust =>
      '该应用仅在激活 SOS 广播时使用您的位置。InstaSOS 和 Empathetech LLC 均不追踪、存储或出售用户数据。';

  @override
  String get faqLocationTrustFix =>
      '该应用仅在激活 SOS 广播时使用您的位置。Insta-SOS 和 Empathetic LLC 均不追踪、存储或出售用户数据。';

  @override
  String get faqContactPermissions =>
      '如果在添加紧急联系人时收到此消息，则表明 InstaSOS 没有访问该特定联系人的权限。';

  @override
  String get faqContactPermissionsFix =>
      '如果在添加紧急联系人时收到此消息，则表明 Insta-SOS 没有访问该特定联系人的权限。';

  @override
  String get faqUpdateContacts => '您可以在以下位置授予对更多（或所有）联系人的访问权限：';

  @override
  String get faqSplitClarity1 => '授予对某位联系人的访问权限并不会使其成为紧急联系人。只有列在';

  @override
  String get faqSplitClarity2 => ' 中的号码才会在 SOS 广播期间收到联系。';

  @override
  String get faqMissing => '为什么缺少某些 Android 上的功能？';

  @override
  String get faqRestricted =>
      '缺少的功能需要短信自动化，而苹果 (Apple) 不允许开发者自动发送短信（除非使用付费服务）。';

  @override
  String get faqShortcuts =>
      '那 iOS 快捷指令呢？\n对访问用户快捷指令也存在限制，这会破坏关键功能。主要是：它会中断视频录制。';

  @override
  String get faqLanguages => '为什么没有 X 语言？';

  @override
  String get faqResponsible => '使用机器翻译权利列表是不负责任的。请考虑';

  @override
  String get faqContributing => '做出贡献';

  @override
  String get faqExpand => ' 以帮助扩展语言选项。';

  @override
  String get faqReset => '重置教程';

  @override
  String get faqContact => '联系支持';

  @override
  String get faqContactHint => '给 Empathetic LLC 发送邮件';

  @override
  String get bsEMC => '紧急联系人';

  @override
  String get bsAddSomeone => '添加联系人以启用 SOS';

  @override
  String get bsRemoveHint => '移除联系人';

  @override
  String get bsAddHint => '添加其他联系人';

  @override
  String get bsLinkType => '位置链接类型';

  @override
  String get bsSnackRequest => '请添加紧急联系人';

  @override
  String get bsNeedPermission => '没有权限无法添加联系人';

  @override
  String get bsPartialContacts =>
      'Apple 将显示所有联系人，而不仅仅是与 InstaSOS 共享的联系人。\n要共享更多联系人，请打开';

  @override
  String get bsPartialContactsFix =>
      'Apple 将显示所有联系人，而不仅仅是与 Insta-SOS 共享的联系人。\n要共享更多联系人，请打开';

  @override
  String get bsNumError => '此联系人是私密的或没有电话号码。';

  @override
  String get bsSOSOnOpen => '打开时发送 SOS';

  @override
  String get bsSOSOnClose => '关闭时发送 SOS';

  @override
  String get bsSOSOnCloseHint =>
      '首页上与设置相对的位置将出现一个安全关闭（大拇指向上）按钮。\n如果 InstaSOS 因除了安全关闭按钮以外的任何原因（最小化、切换应用、息屏）失去焦点，将开始 SOS 广播。';

  @override
  String get bsSOSOnCloseHintFix =>
      '首页上与设置相对的位置将出现一个安全关闭（大拇指向上）按钮。\n如果 Insta-SOS 因除了安全关闭按钮以外的任何原因（最小化、切换应用、息屏）失去焦点，将开始 SOS 广播。';

  @override
  String get bsCloseOffWarning => '应用将自动关闭以防止意外广播。';

  @override
  String get bsSOSOnVideo => '录制中断时发送 SOS';

  @override
  String get dsLadyLiberty => '自由女神像的照片，带有权利列表的预览。';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class LangZhCn extends LangZh {
  LangZhCn() : super('zh_CN');

  @override
  String get gOk => '确定';

  @override
  String get gDone => '完成';

  @override
  String get gReminder => '提醒';

  @override
  String get gSystem => '系统设置';

  @override
  String get gNotAgain => '不再显示';

  @override
  String get gOnCloseWarning => '已启用“关闭时发送 SOS”。这将触发 SOS 广播。';

  @override
  String get sosLastKnown => '最后已知位置：';

  @override
  String get sosNeedSMS => 'SOS 需要短信（发送信息）权限。';

  @override
  String get sosDisabled => '无法获取位置（已禁用）';

  @override
  String get sosDenied => '无法获取位置（被拒绝）';

  @override
  String get sosError => '无法获取位置（发生错误）';

  @override
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsWelcomeFix => '欢迎使用 Insta-SOS';

  @override
  String get hsAppIntro =>
      '首先，这只是一个“了解你的权利 (Know Your Rights)”应用。\n您可以通过在下方的列表中授予权限来启用更多工具。';

  @override
  String get hsAppIntroAlt => '最新版本进行了重大更新，请在下方确保一切准备就绪。';

  @override
  String get hsYourApp => '您可以随时改变主意或更改权限。';

  @override
  String get hsHybridTranslation => '教程和设置是机器翻译的。\n权利列表是人工翻译的。';

  @override
  String get hsCamera => '相机';

  @override
  String get hsAddRecording => '启用视频录制';

  @override
  String get hsMic => '麦克风';

  @override
  String get hsSilent => '未开启此权限，视频将静音';

  @override
  String get hsGallery => '相册';

  @override
  String get hsAddSave => '保存您的录像所需';

  @override
  String get hsCameraReady => '相机已准备就绪';

  @override
  String get hsCameraSetupHint => '激活以授予 Insta-SOS 相机权限';

  @override
  String get hsCameraSnack => '请在设置中（上方）启用相机\n然后重试';

  @override
  String get hsContacts => '联系人';

  @override
  String get hsAddContacts => '启用 SOS 消息';

  @override
  String get hsAppleContacts => '此步骤仅用于应用权限。\n您还未选择紧急联系人。\n\n建议允许全部以减少麻烦。';

  @override
  String get hsContactsSetupHint => '激活以授予 Insta-SOS 查看联系人的权限。';

  @override
  String get hsSMS => 'Android 系统需要发短信给谁以及如何发送的权限';

  @override
  String get hsTextingSetupHint => '激活以授予 Insta-SOS 发送消息的权限。';

  @override
  String get hsSOSReady => 'SOS 已准备就绪';

  @override
  String get hsLocation => '位置';

  @override
  String get hsAddLocation => '在 SOS 消息中添加您的位置信息';

  @override
  String get hsAddAlways => '建议设为始终允许。再次点击以打开系统设置。';

  @override
  String get hsLocationReady => '位置信息已准备就绪';

  @override
  String get hsLocationSetupHint => '激活以授予 Insta-SOS 查看您的位置的权限。';

  @override
  String get hsUnable => '无法确定';

  @override
  String get hsOneOfFour => '四分之一。继续...';

  @override
  String get hsBroadcastTutorial =>
      '激活 SOS 以自动向您的紧急联系人发送短信。\n\n当 InstaSOS 有权访问您的位置时，它将包含在短信中。';

  @override
  String get hsBroadcastTutorialFix =>
      '激活 SOS 以自动向您的紧急联系人发送短信。\n\n当 Insta-SOS 有权访问您的位置时，它将包含在短信中。';

  @override
  String get hsBroadcastTutorialAndroid =>
      '当手机锁屏时，短信将继续发送。\n\n手动停用 SOS 或完全关闭应用程序以停止发送短信。';

  @override
  String get hsTwoOfFour => '四分之二。继续...';

  @override
  String get hsSettingsTutorial =>
      '在设置中：\n- 配置您的 SOS 广播\n- 自定义应用的外观\n- 获取更多资源和支持';

  @override
  String get hsSettingsTutorialFix => '您可以在设置中配置您的 SOS 广播、自定义应用外观以及获取更多资源和支持。';

  @override
  String get hsThreeOfFour => '四分之三。继续...';

  @override
  String get hsVideoTutorial =>
      '拍照或录制视频后，您可以立即分享。\n\n默认情况下，如果录制被中断，将自动开始 SOS 广播。\n\n长按相机预览以显示/隐藏您的权利。';

  @override
  String get hsIOSVideoTutorial => '拍照或录制视频后，您可以立即分享。\n\n长按相机预览以显示/隐藏您的权利。';

  @override
  String get hsTutorialComplete => '教程完成';

  @override
  String get hsAddEMC => '如果您使用 SOS 警报，请前往设置页面并添加您的紧急联系人。';

  @override
  String get hsStartSOS => '激活以开始 SOS 广播。';

  @override
  String get hsEndSOS => 'SOS 正在广播。激活以停止。';

  @override
  String get hsSafeCloseHint => '一切安全。在不触发 SOS 的情况下关闭应用。';

  @override
  String get hsBroadcasting => '正在广播';

  @override
  String get hsStop => '停止';

  @override
  String get hsCameraHint => '拍张照片。';

  @override
  String get hsPreviewHint => '长按以显示/隐藏您的权利。';

  @override
  String get hsShowRights => '显示您的权利。';

  @override
  String get hsHideRights => '隐藏您的权利。';

  @override
  String get hsStartRecord => '录制视频。';

  @override
  String get hsEndRecord => '结束录制。';

  @override
  String get hsFlashOff => '闪光灯已关。激活以开启自动闪光灯。';

  @override
  String get hsFlashAuto => '自动闪光灯。激活以开启闪光灯。';

  @override
  String get hsFlashOn => '闪光灯已开。激活以关闭闪光灯。';

  @override
  String get hsFlashTorch => '手电筒模式。激活以关闭闪光灯。';

  @override
  String get hsNoFlash => '相机闪光灯无法使用';

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
  String get ssAutoShare => '自动分享照片/视频';

  @override
  String get ssSOS => 'SOS 设置';

  @override
  String get ssAppearance => '外观设置';

  @override
  String get ssPermissions => '权限';

  @override
  String get ssResources => '资源';

  @override
  String get ssSupport => '支持';

  @override
  String get pmOnlyAdd => '此工具仅用于添加权限。';

  @override
  String get pmRemoveIn => '您可以在以下位置移除权限：';

  @override
  String get pmManualPermission => '如果您在系统设置中移除了权限，也必须在那里恢复它们。';

  @override
  String get rmCommunity => '社区资源';

  @override
  String get rmGov => '美国政府资源';

  @override
  String get rmAffiliate => '均不隶属于 Empathetech LLC';

  @override
  String get rmAffiliateFix => '均不隶属于 Empathetic LLC';

  @override
  String get faqName => '常见问题 (FAQ)';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA => '权利列表取自多个公共资源，包括：';

  @override
  String get faqSettings => '设置是如何工作的？';

  @override
  String get faqAutoShareA =>
      ' 使用您手机的内置分享功能。它不使用您保存的紧急联系人（如果有）。分享是可选的，并且可以随时取消。';

  @override
  String get faqLinkA =>
      ' 您的位置信息将如何发送给您的紧急联系人。“Google 地图”、“Apple 地图”和“Waze”将发送相应服务的可点击链接。“坐标”将以纯文本格式发送您的经纬度。';

  @override
  String get faqOnOpenA => ' 在应用启动时将立即开始 SOS 广播。不推荐大多数用户使用，因为这可能导致意外广播。';

  @override
  String get faqOnInterruptA =>
      ' 如果正在录制视频且 InstaSOS 失去焦点，将开始 SOS 广播。失去焦点包括：最小化应用、切换应用和/或锁屏。建议启用此项或“关闭时发送 SOS”（或两者同时启用）。';

  @override
  String get faqOnInterruptAFix =>
      ' 如果正在录制视频且 Insta-SOS 失去焦点，将开始 SOS 广播。失去焦点包括：最小化应用、切换应用和/或锁屏。建议启用此项或“关闭时发送 SOS”（或两者同时启用）。';

  @override
  String get faqUnavailable => 'SOS 显示“位置不可用”？';

  @override
  String get faqReliability => '为了提高 SOS 的可靠性，请在以下位置启用“始终允许”：';

  @override
  String get faqLocationPermissions => '位置权限';

  @override
  String get faqLocationTrust =>
      '该应用仅在激活 SOS 广播时使用您的位置。InstaSOS 和 Empathetech LLC 均不追踪、存储或出售用户数据。';

  @override
  String get faqLocationTrustFix =>
      '该应用仅在激活 SOS 广播时使用您的位置。Insta-SOS 和 Empathetic LLC 均不追踪、存储或出售用户数据。';

  @override
  String get faqContactPermissions =>
      '如果在添加紧急联系人时收到此消息，则表明 InstaSOS 没有访问该特定联系人的权限。';

  @override
  String get faqContactPermissionsFix =>
      '如果在添加紧急联系人时收到此消息，则表明 Insta-SOS 没有访问该特定联系人的权限。';

  @override
  String get faqUpdateContacts => '您可以在以下位置授予对更多（或所有）联系人的访问权限：';

  @override
  String get faqSplitClarity1 => '授予对某位联系人的访问权限并不会使其成为紧急联系人。只有列在';

  @override
  String get faqSplitClarity2 => ' 中的号码才会在 SOS 广播期间收到联系。';

  @override
  String get faqMissing => '为什么缺少某些 Android 上的功能？';

  @override
  String get faqRestricted =>
      '缺少的功能需要短信自动化，而苹果 (Apple) 不允许开发者自动发送短信（除非使用付费服务）。';

  @override
  String get faqShortcuts =>
      '那 iOS 快捷指令呢？\n对访问用户快捷指令也存在限制，这会破坏关键功能。主要是：它会中断视频录制。';

  @override
  String get faqLanguages => '为什么没有 X 语言？';

  @override
  String get faqResponsible => '使用机器翻译权利列表是不负责任的。请考虑';

  @override
  String get faqContributing => '做出贡献';

  @override
  String get faqExpand => ' 以帮助扩展语言选项。';

  @override
  String get faqReset => '重置教程';

  @override
  String get faqContact => '联系支持';

  @override
  String get faqContactHint => '给 Empathetic LLC 发送邮件';

  @override
  String get bsEMC => '紧急联系人';

  @override
  String get bsAddSomeone => '添加联系人以启用 SOS';

  @override
  String get bsRemoveHint => '移除联系人';

  @override
  String get bsAddHint => '添加其他联系人';

  @override
  String get bsLinkType => '位置链接类型';

  @override
  String get bsSnackRequest => '请添加紧急联系人';

  @override
  String get bsNeedPermission => '没有权限无法添加联系人';

  @override
  String get bsPartialContacts =>
      'Apple 将显示所有联系人，而不仅仅是与 InstaSOS 共享的联系人。\n要共享更多联系人，请打开';

  @override
  String get bsPartialContactsFix =>
      'Apple 将显示所有联系人，而不仅仅是与 Insta-SOS 共享的联系人。\n要共享更多联系人，请打开';

  @override
  String get bsNumError => '此联系人是私密的或没有电话号码。';

  @override
  String get bsSOSOnOpen => '打开时发送 SOS';

  @override
  String get bsSOSOnClose => '关闭时发送 SOS';

  @override
  String get bsSOSOnCloseHint =>
      '首页上与设置相对的位置将出现一个安全关闭（大拇指向上）按钮。\n如果 InstaSOS 因除了安全关闭按钮以外的任何原因（最小化、切换应用、息屏）失去焦点，将开始 SOS 广播。';

  @override
  String get bsSOSOnCloseHintFix =>
      '首页上与设置相对的位置将出现一个安全关闭（大拇指向上）按钮。\n如果 Insta-SOS 因除了安全关闭按钮以外的任何原因（最小化、切换应用、息屏）失去焦点，将开始 SOS 广播。';

  @override
  String get bsCloseOffWarning => '应用将自动关闭以防止意外广播。';

  @override
  String get bsSOSOnVideo => '录制中断时发送 SOS';

  @override
  String get dsLadyLiberty => '自由女神像的照片，带有权利列表的预览。';
}
