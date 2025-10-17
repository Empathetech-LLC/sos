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
  String get dsLadyLiberty => '自由女神像的图片，附有权利列表的预览。';
}
