// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LangFr extends Lang {
  LangFr([String locale = 'fr']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get hsSOSHint => 'Partager la position avec le CDU';

  @override
  String get hsSafeCloseHint =>
      'Tout est clair\nFermer l\'application sans avertir le CME';

  @override
  String get hsCameraHint => 'Prendre une photo';

  @override
  String get hsRecordHint => 'Enregistrer une vidéo';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your EMC your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDe-activate SOS or fully close the app to stop broadcasting.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more EMC\n- Customize your SOS message\n- Set the app to auto-SOS\n- Update the appearance\n\nand more in the settings.';

  @override
  String get hsRTutorial =>
      'When you take a picture or finish a recording, it will auto-save to your gallery.\n\nYou can then share the file, and your location, with the native sharing options.\n\nBy default, if a video is interrupted, SOS will auto-activate.';

  @override
  String get hsNoNumber => 'Le contact n\'a pas de numéro de téléphone';

  @override
  String get ssSOSOnOpen => 'SOS automatique à l\'ouverture';

  @override
  String get ssSOSOnClose => 'SOS automatique à la fermeture';

  @override
  String get ssVideoSOS =>
      'SOS automatique en cas d\'enregistrement interrompu';

  @override
  String get ssSOSFrequency => 'Fréquence SOS';

  @override
  String get ssSOSMessage => 'Message SOS';

  @override
  String get ssEMC => 'Contacts d\'urgence';
}
