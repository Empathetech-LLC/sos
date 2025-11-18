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
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsAppTutorial =>
      '本应用可在危机时刻迅速将您的状况分享给紧急联系人。\n\n请选择一位紧急联系人。\n目前只需添加一位，后续可随时增添。';

  @override
  String get hsPermissionsTutorialTitle => '如果您愿意';

  @override
  String get hsPermissionsTutorial =>
      'InstaSOS 也可用于采集和分享证据。\n\n系统将请求相机、麦克风和相册访问权限以实现该功能。';

  @override
  String get hsPermissionsAlways => '请将定位权限设置为“始终允许”。\n仅在SOS激活时才会使用定位信息。';

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
  String get hsRightsTutorial =>
      '启用相机后，拍摄照片或视频内容可即时分享。\n\n默认情况下，录像若被中断，SOS将自动激活。\n\n点击法槌图标或长按屏幕中央可查看您的权限列表。';

  @override
  String get hsIOSRightsTutorial =>
      '启用相机后，拍摄照片或视频内容可即时分享。\n\n点击法槌图标或长按屏幕中央可查看您的权限列表。';

  @override
  String get hsNeedContacts => 'InstaSOS 需要访问您的联系人以正常运行。';

  @override
  String get hsPartialContacts =>
      'Apple 将显示所有联系人，而不仅仅是与 InstaSOS 共享的联系人。\n要分享更多联系人，请前往 iOS 设置 -> 应用 -> InstaSOS';

  @override
  String get hsNumError => '该联系人是私人联系人或没有电话号码。';

  @override
  String get rsSharedHeader => '您有权...';

  @override
  String get rsOnFoot => '步行时';

  @override
  String get rsWhileDriving => '驾车时';

  @override
  String get rsAtHome => '在家中';

  @override
  String get rsSharedRemainSilent => '保持沉默。无需撒谎，但您不必回答任何问题。';

  @override
  String get rsSharedDocument => '记录一切。您有权拍照、录像和录音。';

  @override
  String get rsMobilePockets => '拒绝搜查口袋。移民执法人员可进行简单搜身，但无权搜查。';

  @override
  String get rsMobileQuestion => '提出疑问。了解为何被拦截。';

  @override
  String get rsMobileLeave => '如果您没有被拘留，您有权离开。';

  @override
  String get rsDriveSearch => '拒绝对车辆进行搜查。';

  @override
  String get rsDriveID => '作为乘客可拒绝出示身份证明。只有驾驶员必须出示。';

  @override
  String get rsDriveWarrant => '询问警官是否持有搜查令。如有，您有权查看。未由法官签署的“搜查令”无效。';

  @override
  String get rsHomeWarrant =>
      '保持房门关闭。如对方称持有搜查令，请先让其从门缝递进。未由法官签署的“搜查令”无效。始终保持房门关闭。';

  @override
  String get rsSharedSign => '拒绝签署任何文件。';

  @override
  String get rsSharedFingerprint => '除非被正式逮捕，可拒绝接受移民局采集指纹。';

  @override
  String get rsSharedLawyer => '您有权联系律师。如您已被正式逮捕，则有权请求法院为您指派律师。';

  @override
  String get ssSOSOnOpen => '打开应用时启动SOS';

  @override
  String get ssSOSOnClose => '关闭应用时启动SOS';

  @override
  String get ssSOSOnCloseHint => '启用后，在设置按钮对侧会显示一个“安全关闭”按钮。';

  @override
  String get ssCloseOffWarning => '应用程序将自动关闭，以防止意外播出。';

  @override
  String get ssVideoSOS => '录像中断自动启动SOS';

  @override
  String get ssAutoShare => '自动共享媒体';

  @override
  String get ssEMC => '紧急联系人';

  @override
  String get ssRemoveHint => '移除联系人';

  @override
  String get ssAddHint => '添加联系人';

  @override
  String get ssLinkType => '链接类型';

  @override
  String get ssAppearance => '界面外观';

  @override
  String get faqName => '常见问题';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA1 => '权利列表汇编自多个公共来源，包括：';

  @override
  String get faqListA2 => '另一个有用的资源：';

  @override
  String get faqSettings => '这些设置有什么作用？';

  @override
  String get faqOnOpen =>
      '启动时触发 SOS：启用后，应用程序启动时将立即开始 SOS 广播。不建议大多数用户使用，因为这可能导致意外误发。';

  @override
  String get faqOnInterrupt =>
      '录制中断时触发 SOS：启用后，如果正在录制视频且 InstaSOS 因任何原因（最小化、切换应用、屏幕关闭）失去焦点，将开始 SOS 广播。\n建议启用此选项或“关闭时触发 SOS”（或两者都启用）。';

  @override
  String get faqAutoShare => '自动分享媒体：启用后，一旦视频完成或拍下照片，将立即出现系统原生分享选项。';

  @override
  String get faqEMC => '紧急联系人：当 SOS 广播激活时，将接收您位置信息的人员。';

  @override
  String get faqLink =>
      '链接类型：您的位置将如何发送给紧急联系人。“Google Maps”、“Apple Maps”和“Waze”将发送相应服务的可点击链接。“Coordinates”将以纯文本形式发送您的经纬度。';

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
  String get faqResetSnack => '教程将在下次启动时重播。';

  @override
  String get faqOnCloseWarning => '“关闭时求救”已启用。这将开始广播。';

  @override
  String get dsLadyLiberty => '自由女神像的图片，附有权利列表的预览。';
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
  String get hsWelcome => '欢迎使用 InstaSOS';

  @override
  String get hsAppTutorial =>
      '本应用可在危机时刻迅速将您的状况分享给紧急联系人。\n\n请选择一位紧急联系人。\n目前只需添加一位，后续可随时增添。';

  @override
  String get hsPermissionsTutorialTitle => '如果您愿意';

  @override
  String get hsPermissionsTutorial =>
      'InstaSOS 也可用于采集和分享证据。\n\n系统将请求相机、麦克风和相册访问权限以实现该功能。';

  @override
  String get hsPermissionsAlways => '请将定位权限设置为“始终允许”。\n仅在SOS激活时才会使用定位信息。';

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
  String get hsRightsTutorial =>
      '启用相机后，拍摄照片或视频内容可即时分享。\n\n默认情况下，录像若被中断，SOS将自动激活。\n\n点击法槌图标或长按屏幕中央可查看您的权限列表。';

  @override
  String get hsIOSRightsTutorial =>
      '启用相机后，拍摄照片或视频内容可即时分享。\n\n点击法槌图标或长按屏幕中央可查看您的权限列表。';

  @override
  String get hsNeedContacts => 'InstaSOS 需要访问您的联系人以正常运行。';

  @override
  String get hsPartialContacts =>
      'Apple 将显示所有联系人，而不仅仅是与 InstaSOS 共享的联系人。\n要分享更多联系人，请前往 iOS 设置 -> 应用 -> InstaSOS';

  @override
  String get hsNumError => '该联系人是私人联系人或没有电话号码。';

  @override
  String get rsSharedHeader => '您有权...';

  @override
  String get rsOnFoot => '步行时';

  @override
  String get rsWhileDriving => '驾车时';

  @override
  String get rsAtHome => '在家中';

  @override
  String get rsSharedRemainSilent => '保持沉默。无需撒谎，但您不必回答任何问题。';

  @override
  String get rsSharedDocument => '记录一切。您有权拍照、录像和录音。';

  @override
  String get rsMobilePockets => '拒绝搜查口袋。移民执法人员可进行简单搜身，但无权搜查。';

  @override
  String get rsMobileQuestion => '提出疑问。了解为何被拦截。';

  @override
  String get rsMobileLeave => '如果您没有被拘留，您有权离开。';

  @override
  String get rsDriveSearch => '拒绝对车辆进行搜查。';

  @override
  String get rsDriveID => '作为乘客可拒绝出示身份证明。只有驾驶员必须出示。';

  @override
  String get rsDriveWarrant => '询问警官是否持有搜查令。如有，您有权查看。未由法官签署的“搜查令”无效。';

  @override
  String get rsHomeWarrant =>
      '保持房门关闭。如对方称持有搜查令，请先让其从门缝递进。未由法官签署的“搜查令”无效。始终保持房门关闭。';

  @override
  String get rsSharedSign => '拒绝签署任何文件。';

  @override
  String get rsSharedFingerprint => '除非被正式逮捕，可拒绝接受移民局采集指纹。';

  @override
  String get rsSharedLawyer => '您有权联系律师。如您已被正式逮捕，则有权请求法院为您指派律师。';

  @override
  String get ssSOSOnOpen => '打开应用时启动SOS';

  @override
  String get ssSOSOnClose => '关闭应用时启动SOS';

  @override
  String get ssSOSOnCloseHint => '启用后，在设置按钮对侧会显示一个“安全关闭”按钮。';

  @override
  String get ssCloseOffWarning => '应用程序将自动关闭，以防止意外播出。';

  @override
  String get ssVideoSOS => '录像中断自动启动SOS';

  @override
  String get ssAutoShare => '自动共享媒体';

  @override
  String get ssEMC => '紧急联系人';

  @override
  String get ssRemoveHint => '移除联系人';

  @override
  String get ssAddHint => '添加联系人';

  @override
  String get ssLinkType => '链接类型';

  @override
  String get ssAppearance => '界面外观';

  @override
  String get faqName => '常见问题';

  @override
  String get faqListQ => '权利列表是如何制定的？';

  @override
  String get faqListA1 => '权利列表汇编自多个公共来源，包括：';

  @override
  String get faqListA2 => '另一个有用的资源：';

  @override
  String get faqSettings => '这些设置有什么作用？';

  @override
  String get faqOnOpen =>
      '启动时触发 SOS：启用后，应用程序启动时将立即开始 SOS 广播。不建议大多数用户使用，因为这可能导致意外误发。';

  @override
  String get faqOnInterrupt =>
      '录制中断时触发 SOS：启用后，如果正在录制视频且 InstaSOS 因任何原因（最小化、切换应用、屏幕关闭）失去焦点，将开始 SOS 广播。\n建议启用此选项或“关闭时触发 SOS”（或两者都启用）。';

  @override
  String get faqAutoShare => '自动分享媒体：启用后，一旦视频完成或拍下照片，将立即出现系统原生分享选项。';

  @override
  String get faqEMC => '紧急联系人：当 SOS 广播激活时，将接收您位置信息的人员。';

  @override
  String get faqLink =>
      '链接类型：您的位置将如何发送给紧急联系人。“Google Maps”、“Apple Maps”和“Waze”将发送相应服务的可点击链接。“Coordinates”将以纯文本形式发送您的经纬度。';

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
  String get faqResetSnack => '教程将在下次启动时重播。';

  @override
  String get faqOnCloseWarning => '“关闭时求救”已启用。这将开始广播。';

  @override
  String get dsLadyLiberty => '自由女神像的图片，附有权利列表的预览。';
}
