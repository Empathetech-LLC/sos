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
  String get hsAppTutorial =>
      'This app is designed to share your location with emergency contacts in a moment of crisis.\n\nPlease choose your first emergency contact.\nThey must have a phone number.\n\nJust one for now, you can add more later.';

  @override
  String get hsPermissionsTutorialTitle => 'If you want';

  @override
  String get hsPermissionsTutorial =>
      'SOS can also help share evidence.\n\nThe app will ask you for camera, microphone, and gallery access so it can take and save photos and videos.\n\nThis is recommended, but optional.';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSettingsTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n& Change the app\'s appearance\n\n in the settings.\n\nHold the settings button to give feedback for the app.';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with one that shows you your rights.';

  @override
  String get hsRightsTutorial =>
      'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'Le contact n\'a pas de numéro de téléphone';

  @override
  String get rsSharedHeader => 'Vous avez le droit de...';

  @override
  String get rsSharedRemainSilent =>
      'Rester silencieux. Certains États peuvent exiger un nom, mais c\'est tout ce qu\'ils peuvent exiger. Ne mentez pas et ne résistez pas à l\'arrestation, mais vous n\'avez pas à répondre aux questions.';

  @override
  String get rsSharedDoubleSilence =>
      'Rester silencieux sur votre silence. Vous n\'avez pas à vous justifier.';

  @override
  String get rsSharedDocument =>
      'Documenter tout. Vous avez le droit de prendre des photos, d\'enregistrer des vidéos et d\'enregistrer de l\'audio.';

  @override
  String get rsWalkPockets =>
      'Refuser une fouille de vos poches. ICE peut faire une palpation, mais pas une fouille.';

  @override
  String get rsWalkLeave => 'Partir si vous n\'êtes pas arrêté.';

  @override
  String get rsDriveSearch => 'Refuser une fouille de votre voiture.';

  @override
  String get rsDrivePockets =>
      'Refuser une fouille de vos poches. ICE peut faire une palpation, mais pas une fouille.';

  @override
  String get rsDriveID =>
      'Refuser de fournir une pièce d\'identité en tant que passager. Seul le conducteur est tenu de fournir une pièce d\'identité.';

  @override
  String get rsDriveQuestion =>
      'Poser des questions. Découvrez pourquoi vous êtes arrêté.';

  @override
  String get rsDriveWarrant =>
      'Demander si les agents ont un mandat. Vous avez le droit de le voir s\'ils en ont.';

  @override
  String get rsDriveLeave => 'Partir si vous n\'êtes pas arrêté.';

  @override
  String get rsHomeWarrant =>
      'Gardez votre porte fermée. S\'ils ont un mandat, demandez-leur de le glisser sous la porte d\'abord.';

  @override
  String get rsSharedFingerprint =>
      'Refuser d\'être fiché par ICE à moins que vous ne soyez arrêté.';

  @override
  String get rsSharedLawyer =>
      'Consulter un avocat. Si vous avez été formellement arrêté, vous avez droit à un avocat commis d\'office.';

  @override
  String get ssSOSOnOpen => 'SOS automatique à l\'ouverture';

  @override
  String get ssSOSOnClose => 'SOS automatique à la fermeture';

  @override
  String get ssSOSOnCloseHint =>
      'Lorsque cette option est activée, un bouton de fermeture sécurisé sera affiché en face des paramètres.';

  @override
  String get ssVideoSOS =>
      'SOS automatique en cas d\'enregistrement interrompu';

  @override
  String get ssVideoSOSHint =>
      'Activer pour des messages continus, désactiver pour un seul message.';

  @override
  String get ssEMC => 'Contacts d\'urgence';
}
