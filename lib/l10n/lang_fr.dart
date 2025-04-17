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
  String get sosNeedSMS =>
      'SOS a besoin d\'une autorisation SMS pour fonctionner correctement.';

  @override
  String get sosDisabled =>
      'Impossible d\'accéder à la localisation (désactivée)';

  @override
  String get sosDenied => 'Impossible d\'accéder à la localisation (refusée)';

  @override
  String get hsStartSOS => 'Activer pour démarrer la diffusion SOS.';

  @override
  String get hsEndSOS => 'SOS est en cours de diffusion. Activez pour arrêter.';

  @override
  String get hsSafeCloseHint =>
      'Tout est clair. Fermer l\'application sans activer SOS.';

  @override
  String get hsCameraHint => 'Prendre une photo.';

  @override
  String get hsShowRights => 'Montrez vos droits.';

  @override
  String get hsHideRights => 'Cachez vos droits.';

  @override
  String get hsStartRecord => 'Enregistrer une vidéo.';

  @override
  String get hsEndRecord => 'Terminez l\'enregistrement.';

  @override
  String get hsFlashOff =>
      'Flash désactivé. Activez pour activer le flash automatique.';

  @override
  String get hsFlashAuto => 'Flash automatique. Activez pour activer le flash.';

  @override
  String get hsFlashOn => 'Flash activé. Activez pour désactiver le flash.';

  @override
  String get hsFlashTorch => 'Mode torche. Activez pour désactiver le flash.';

  @override
  String get hsWelcome => 'Bienvenue sur SOS';

  @override
  String get hsAppTutorial =>
      'L\'application partage votre statut avec vos contacts d\'urgence en cas de crise.\n\nVeuillez choisir un contact d\'urgence.\nUn seul pour l\'instant, vous pourrez en ajouter d\'autres plus tard.';

  @override
  String get hsPermissionsTutorialTitle => 'Si vous le souhaitez';

  @override
  String get hsPermissionsTutorial =>
      'SOS peut également collecter et partager des preuves.\n\nElle demandera l\'accès à la caméra, au microphone et à la galerie pour ce faire.';

  @override
  String get hsBroadcastTutorial =>
      'Activez SOS pour envoyer automatiquement des messages à vos contacts d\'urgence.\n\nSi SOS a accès à votre position, celle-ci sera incluse dans les messages.\n\nLes messages continueront même si le téléphone est verrouillé.\n\nDésactivez SOS ou fermez complètement l\'application pour arrêter les messages.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activez SOS pour envoyer automatiquement des messages à vos contacts d\'urgence.\n\nSi SOS a accès à votre position, celle-ci sera incluse dans les messages.';

  @override
  String get hsSettingsTutorial =>
      'Vous pouvez...\n\n- Ajouter d\'autres contacts d\'urgence\n- Configurer le SOS automatique\n- Changer la langue de l\'application, et\n- Modifier l\'apparence de l\'application\n\ndans les paramètres.\n\nMaintenez le bouton des paramètres pour envoyer des commentaires sur l\'application.';

  @override
  String get hsVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, SOS s\'activera automatiquement.\n\nTouchez deux fois le centre de l\'aperçu pour afficher une liste de vos droits.';

  @override
  String get hsIOSVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nTouchez deux fois le centre de l\'aperçu pour afficher une liste de vos droits.';

  @override
  String get hsRightsTutorial =>
      'Si vous activez la caméra et prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, SOS s\'activera automatiquement.\n\nTouchez le marteau ou touchez deux fois le centre de l\'écran pour voir une liste de vos droits.';

  @override
  String get hsIOSRightsTutorial =>
      'Si vous activez la caméra et prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nTouchez le marteau ou touchez deux fois le centre de l\'écran pour voir une liste de vos droits.';

  @override
  String get hsNeedContacts =>
      'SOS a besoin d\'accéder à vos contacts pour fonctionner correctement.';

  @override
  String get hsNoNumber => 'Le contact doit avoir un numéro de téléphone.';

  @override
  String get rsSharedHeader => 'Vous avez le droit de...';

  @override
  String get rsSharedRemainSilent =>
      'Garder le silence. Ne mentez pas, mais vous n\'êtes pas obligé de répondre aux questions.';

  @override
  String get rsSharedDocument =>
      'Tout documenter. Vous avez le droit de prendre des photos, d\'enregistrer des vidéos et de l\'audio.';

  @override
  String get rsWalkPockets =>
      'Refuser une fouille de vos poches. L’ICE peut effectuer une palpation, mais pas une fouille.';

  @override
  String get rsWalkLeave => 'Partir si vous n’êtes pas en état d’arrestation.';

  @override
  String get rsDriveSearch => 'Refuser une fouille de votre voiture.';

  @override
  String get rsDrivePockets =>
      'Refuser une fouille de vos poches. L’ICE peut effectuer une palpation, mais pas une fouille.';

  @override
  String get rsDriveID =>
      'Refuser de fournir une pièce d\'identité en tant que passager. Seul le conducteur est tenu de le faire.';

  @override
  String get rsDriveQuestion =>
      'Poser des questions. Découvrez pourquoi vous êtes arrêté.';

  @override
  String get rsDriveWarrant =>
      'Demandez si les agents ont un mandat. Vous avez le droit de le voir s’ils en ont un. Si un « mandat » n’est pas signé par un juge, il n’est pas valide.';

  @override
  String get rsDriveLeave => 'Partir si vous n’êtes pas en état d’arrestation.';

  @override
  String get rsHomeWarrant =>
      'Gardez la porte fermée. S’ils ont un mandat, demandez-leur de le glisser sous la porte. Si un « mandat » n’est pas signé par un juge, il n’est pas valide. Gardez la porte fermée.';

  @override
  String get rsSharedFingerprint =>
      'Refuser que l’ICE prenne vos empreintes digitales, sauf si vous êtes en état d’arrestation.';

  @override
  String get rsSharedLawyer =>
      'Consulter un avocat. Si vous avez été formellement arrêté, vous avez droit à un avocat commis d’office.';

  @override
  String get ssSOSOnOpen => 'SOS auto à l\'ouverture';

  @override
  String get ssSOSOnClose => 'SOS auto à la fermeture';

  @override
  String get ssSOSOnCloseHint =>
      'Lorsqu\'il est activé, un bouton de fermeture sécurisée apparaîtra en face des paramètres.';

  @override
  String get ssVideoSOS => 'SOS auto si l\'enregistrement est interrompu';

  @override
  String get ssEMC => 'Contacts d\'urgence';

  @override
  String get ssRemoveHint => 'Supprimer le contact';

  @override
  String get ssAddHint => 'Ajouter un autre contact';

  @override
  String get ssAppearance => 'Apparence';
}
