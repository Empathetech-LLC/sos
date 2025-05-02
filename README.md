# InstaSOS
[![ar](https://img.shields.io/badge/lang-ar-black.svg)](https://github.com/Empathetech-LLC/empathetech_flutter_ui/blob/main/localized_readme/README.ar.md)
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/Empathetech-LLC/empathetech_flutter_ui/blob/main/README.md)
[![es](https://img.shields.io/badge/lang-es-gold.svg)](https://github.com/Empathetech-LLC/empathetech_flutter_ui/blob/main/localized_readme/README.es.md)
[![fr](https://img.shields.io/badge/lang-fr-white.svg)](https://github.com/Empathetech-LLC/empathetech_flutter_ui/blob/main/localized_readme/README.fr.md)
[![ht](https://img.shields.io/badge/lang-ht-blue.svg)](https://github.com/Empathetech-LLC/empathetech_flutter_ui/blob/main/localized_readme/README.ht.md)

<br>Hopefully unnecessary.

## <br>Table of Contents

* [Using](#using)
* [Contributing](#contributing)
* [License](#license)

# <br>Using

As civilians, our first line of defense is our cameras.<br>So, at its core, InstaSOS is a camera.

<img src="assets/images/readme/screenshot-1-camera.png" alt="Screenshot of the InstaSOS home screen" width="250"/>

<br>When you long press the center of the screen, the app shows (or hides) a list of your rights.

| ![Screenshot of the walking rights view](assets/images/readme/screenshot-2-walking.png) | ![Screenshot of the driving rights view](assets/images/readme/screenshot-3-driving.png) | ![Screenshot of the at home rights view](assets/images/readme/screenshot-4-at-home.png) |
|:---------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------:|
| While walking                                                                           | While driving                                                                           | While at home                                                                           |

<br>The crucial feature of InstaSOS, is the SOS button.<br>Press it to automatically share your status and location with your emergency contacts.

<img src="assets/images/readme/screenshot-5-ios-message.png" alt="Screenshot of the SOS message on iOS" width="250"/>

<br>On iOS, SOS messages are automated.<br>Every 5 minutes, a message with your latest location will be created (like the image above). You will have to hit the send button yourself; you are also free to cancel.<br>This process is done without leaving the app, and will **not** interrupt video recordings.

On Android, SOS messages are fully automatic.<br>While the app is open, SOS messages will be sent for you every 5 minutes, so you can focus on the task at hand.

Because they're fully automatic, Android SOS messages can even be sent when the app is in the background.<br>"In the background" being when the app is minimized, if you've switched to another app, or locked the phone.<br>While in the background, SOS messages will be sent every 15 minutes.

On top of running in the background, automatic messages allow for custom conditions.<br>On Android, you can enable "SOS on close" and "SOS on interrupted recording".

<img src="assets/images/readme/screenshot-6-android-options.png" alt="Screenshot of the SOS message on iOS" width="250"/>

<br>"SOS on close" will automatically start sending texts when the app goes to the background.<br>While "SOS on close" is enabled, there will be a safe exit (thumbs up) button on the home screen. Use this to close the app without starting a broadcast.

| ![Screenshot of the SOS message on iOS](assets/images/readme/screenshot-7-safe-close-message.png) | ![Screenshot of the SOS message on iOS](assets/images/readme/screenshot-8-safe-close-button.png) |
|:-------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------:|
| While walking                                                                                     | While driving                                                                                    |

<br>"SOS on interrupted recoding" is enabled by default.<br>If you're recording a video, and it gets interrupted, a background broadcast will start automatically.

"SOS on open" is available on both platforms.<br>While enabled, anytime you open the app, SOS will start automatically.

On both platforms, press the button again to stop the broadcast. Fully closing the app will also stop the broadcast.

## <br>Notes

### Location

Your location data is taken from the device GPS, and pasted into a maps link.<br>[location code](lib/utils/location.dart) excerpt:
```Dart
final Position pos = await Geolocator.getCurrentPosition();
return 'https://www.google.com/maps?q=${pos.latitude.toStringAsFixed(4)},${pos.longitude.toStringAsFixed(4)}';
```

### <br>Platform differences

The texting differences are due to Apple's policies.<br>They do not allow text automation, at all. They don't even have an appeal process for emergency apps.<br>Pretty hypocritical coming from a company whose marketing often implies that you aren't safe without their products, IMO.

#### <br>Timing

Why are broadcasts every 5 minutes in the foreground, but every 15 in the background?

Android limits the frequency of background tasks to save battery life (and lots of other reasons). Fifteen minutes is the max frequency.<br>But, the same limitations don't apply when the app is open.

# <br>Contributing

## Time

Please reach out to the [community](mailto:community@empathetech.net?subject=Becoming%20a%20contributor) contact about becoming a contributor. There's never a shortage of ideas, only time!

### <br>Translations

If you speak English and a currently unsupported language, please reach out! The more the merrier.

OR: If you speak English and a currently supported language, and see something wrong, please reach out! It takes a village.

## <br>Money

Empathetech makes free and open source software as a public service. Please consider donating so the work can continue. 

&nbsp;&nbsp;&nbsp;[GoFundMe](https://gofund.me/c047d07e)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Patreon](https://patreon.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Buy Me a Coffee](https://www.buymeacoffee.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Ko-fi](https://ko-fi.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[PayPal](https://www.paypal.com/donate/?hosted_button_id=NGEL6AB5A6KNL)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Venmo](https://venmo.com/empathetech)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Cash App](https://cash.app/$empathetech)

<br> Many thanks for any and all contributions!

# <br>License

[GNU GPLv3](./LICENSE)