# InstaSOS
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/Empathetech-LLC/sos/blob/main/README.md)
[![ar](https://img.shields.io/badge/lang-ar-black.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.ar.md)
[![es](https://img.shields.io/badge/lang-es-gold.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.es.md)
[![fil](https://img.shields.io/badge/lang-fil-blue.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.fil.md)
[![fr](https://img.shields.io/badge/lang-fr-white.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.fr.md)
[![ht](https://img.shields.io/badge/lang-ht-blue.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.ht.md)
[![zh](https://img.shields.io/badge/lang-zh-red.svg)](https://github.com/Empathetech-LLC/sos/blob/main/localized_readme/README.zh.md)

<br>一款集成了相机、SOS 求救信号和权利清单的多功能工具。

InstaSOS 可在危机时刻将您的状况即时分享给紧急联系人。

它帮助您记录证据，并在面对执法或移民机关时提醒你应有的权利。

InstaSOS 无需注册账号、不使用 cookies、无广告、无任何付费项目。

请务必注意安全。

## <br>内容表

* [Using](#using)
* [Contributing](#contributing)
* [License](#license)

# <br>Using

作为普通群众，我们的第一道防线就是我们的相机。<br>所以，从本质上说，InstaSOS 就是一台相机。

<img src="assets/images/readme/screenshot-1-camera.png" alt="Screenshot of the InstaSOS home screen" width="250"/>

<br>当您长按屏幕中央时，应用会显示（或隐藏）您的权利清单。

| 行走时 | 驾驶时 | 在家时 |
|:-------------:|:-------------:|:-------------:|
| <img src="assets/images/readme/screenshot-2-walking.png" alt="行走权利截图" width="250"/> | <img src="assets/images/readme/screenshot-3-driving.png" alt="驾驶权利截图" width="250"/> | <img src="assets/images/readme/screenshot-4-at-home.png" alt="在家权利截图" width="250"/> |

<br>InstaSOS 的核心功能，是 SOS 按钮。<br>启用该功能后，您的位置将发送给紧急联络人。<br>紧急联络人由您在首次打开应用时自行设定。

<img src="assets/images/readme/screenshot-5-ios-message.png" alt="iOS SOS 信息示例截图" width="250"/>

<br>在 iOS 上，信息是自动生成的。<br>每隔 5 分钟，系统将创建一条包含您当前位置的信息（如上图所示）。<br>您需自行点击发送按钮，也可以选择取消。<br>整个过程不会离开应用，亦不会中断视频录制。

在 Android 上，信息发送完全自动。<br>每隔 5 分钟，一条包含您当前位置的信息会被自动发送，您可以专注于当前事务。

由于其自动化特性，Android 平台的 SOS 信息即使在后台也能发送。<br>“后台”指的是应用被最小化、切换到其他应用或手机锁屏的状态。<br>在后台状态下，SOS 信息将每隔 15 分钟发送一次。

自动信息的优势不止于此。<br>在 Android 上，您还可以启用“关闭即 SOS”以及“录制中断即 SOS”。

<img src="assets/images/readme/screenshot-6-android-options.png" alt="自定义Android选项的截图" width="250"/>

<br>启用“关闭即 SOS”后，主画面会显示一个安全退出（大拇指）按钮。<br>如果应用因任何非安全退出的原因进入后台，SOS 广播将自动启动。

| 提示器 | 新的主页 |
|:-------------:|:-------------:|
| <img src="assets/images/readme/screenshot-7-safe-close-message.png" alt="关闭时启动SOS的提示画面截图" width="250"/> | <img src="assets/images/readme/screenshot-8-safe-close-button.png" alt="带有安全关闭按钮的主画面截图" width="250"/> |

<br>“录制中断即 SOS”默认启用。<br>若您正在录制视频且过程中断，后台广播将自动启动。

“SOS 打开即启用”适用于两个平台。<br>启用后，一打开应用就会立即启动 SOS 广播。

在两个平台中，您可再次按下 SOS 按钮来停止广播。<br>广播期间，该按钮的图标为响铃，类似于应用图标。<br>完全关闭应用也可终止广播。

## <br>注意事项

### 地址

您的位置信息来自设备 GPS，并粘贴为地图链接。<br>[location code](lib/utils/location.dart) excerpt:
```Dart
final Position pos = await Geolocator.getCurrentPosition();
return 'https://www.google.com/maps?q=${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
```

### <br>各平台的差异

文字信息功能的差异源于 Apple 的政策。<br>他们完全不允许短信自动化，即使是用于紧急应用也无申诉通道。<br>在我看来，这与其一贯宣称“使用他们的产品才更安全”的宣传口径颇为矛盾。

#### <br>时间设置

为何前台状态每 5 分钟发送一次，而后台状态为每 15 分钟？

Android 系统为节省电量（以及多种其他原因），限制后台任务的频率。十五分钟是后台可执行任务的最大频率。<br>但这些限制在应用打开时并不适用。

# <br>贡献

## 时间支持

如您愿意成为贡献者，请与  [community](mailto:community@empathetech.net?subject=Becoming%20a%20contributor)  联系。创意永不缺，时间才是瓶颈！

### <br>翻译

如果您会英语并掌握目前尚未支持的语言，请联系我们！欢迎更多伙伴加入。

或者：若您会英语且熟悉当前已支持语言，发现翻译有误，也请联系！这需要大家共同努力。

## <br>资金

Empathetech 提供免费、开源软件作为公共服务。若您愿意捐赠支持此项目持续发展，我们将深表感谢。

&nbsp;&nbsp;&nbsp;[GoFundMe](https://gofund.me/c047d07e)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Patreon](https://patreon.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Buy Me a Coffee](https://www.buymeacoffee.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Ko-fi](https://ko-fi.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[PayPal](https://www.paypal.com/donate/?hosted_button_id=NGEL6AB5A6KNL)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Venmo](https://venmo.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Cash App](https://cash.app/$empathetech)

<br>非常感谢您给予的任何形式的支持与贡献！

# <br>License

[GNU GPLv3](./LICENSE)