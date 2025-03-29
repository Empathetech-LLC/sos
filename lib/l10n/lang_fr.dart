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
  String get hsNeedContacts =>
      'SOS a besoin d\'accéder à vos contacts pour fonctionner correctement.';

  @override
  String get hsNeedLocation =>
      'SOS a besoin d\'accéder à votre position pour fonctionner correctement.';

  @override
  String get hsSOSHint => 'Commencer à partager la position';

  @override
  String get hsSafeCloseHint =>
      'Tout est clair\nFermer l\'application sans SOS';

  @override
  String get hsCameraHint => 'Prendre une photo';

  @override
  String get hsRecordHint => 'Enregistrer une vidéo';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Customize the SOS message\n- Enable automatic SOS\n- Change the app\'s appearance\n\nand more in the settings.';

  @override
  String get hsRTutorial =>
      'When you take a picture or finish a video, you will be asked to share it.\n\nIf a video is interrupted, SOS will activate automatically.';

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
  String get ssEMC => 'Contacts d\'urgence';
}
