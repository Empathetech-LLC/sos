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
  String get hsWelcome => 'Welcome to SOS';

  @override
  String get hsATutorial =>
      'This app is designed to share your location with emergency contacts in a moment of crisis.\n\nPlease choose your first emergency contact.\nThey must have a phone number.\n\nJust one for now, you can add more later.';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Customize the SOS message\n- Enable automatic SOS\n- Change the app\'s appearance\n\nand more in the settings.';

  @override
  String get hsRecTutorial =>
      'When you take a picture or finish a record, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with one that shows you your rights.';

  @override
  String get hsRightTutorial =>
      'While the camera is disabled, you can still hide/show a list of your rights.\n\nIf you enable the camera, and take a picture or record a video, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'Le contact n\'a pas de numéro de téléphone';

  @override
  String get rsGHeader => 'Vous avez le droit de...';

  @override
  String get rsGFingerprint =>
      '- Refuser d\'être fiché par ICE à moins que vous ne soyez arrêté.';

  @override
  String get rsWLeave => '- Partir si vous n\'êtes pas arrêté.';

  @override
  String get rsCSearch => '- Refuser une fouille de votre voiture.';

  @override
  String get rsCPockets =>
      '- Refuser une fouille de vos poches. ICE peut faire une palpation, mais pas une fouille.';

  @override
  String get rsCWarrant =>
      '- Demander si les agents ont un mandat. Vous avez le droit de le voir s\'ils en ont.';

  @override
  String get rsCID =>
      '- Refuser de fournir une pièce d\'identité en tant que passager. Seul le conducteur est tenu de fournir une pièce d\'identité.';

  @override
  String get rsCQuestion =>
      '- Poser des questions. Découvrez pourquoi vous êtes arrêté.';

  @override
  String get rsCLeave => '- Partir si vous n\'êtes pas arrêté.';

  @override
  String get rsCRemainSilent =>
      '- Rester silencieux. Vous n\'avez pas à répondre à leurs questions.\nVous ne pouvez pas mentir ou résister à l\'arrestation, mais vous n\'avez pas à leur dire quoi que ce soit.';

  @override
  String get rsHWarrant =>
      '- Gardez votre porte fermée. S\'ils ont un mandat, demandez-leur de le glisser sous la porte d\'abord.';

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
