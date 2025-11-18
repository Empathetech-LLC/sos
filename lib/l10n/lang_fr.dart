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
  String get gReminder => 'Rappel';

  @override
  String get gNotAgain => 'Ne plus afficher';

  @override
  String get sosLastKnown => 'Dernière localisation connue';

  @override
  String get sosNeedSMS =>
      'SOS a besoin d\'une autorisation SMS pour fonctionner correctement.';

  @override
  String get sosDisabled =>
      'Impossible d\'accéder à la localisation (désactivé)';

  @override
  String get sosDenied => 'Impossible d\'accéder à la localisation (refusé)';

  @override
  String get sosError => 'Impossible d\'accéder à la localisation (erreur)';

  @override
  String get hsStartSOS => 'Activez pour démarrer la diffusion SOS.';

  @override
  String get hsEndSOS =>
      'Le SOS est en cours de diffusion. Activez pour arrêter.';

  @override
  String get hsSafeCloseHint => 'Tout va bien. Fermer l\'application sans SOS.';

  @override
  String get hsAutoSOS => 'SOS auto';

  @override
  String get hsStop => 'Arrêter';

  @override
  String get hsCameraHint => 'Prendre une photo.';

  @override
  String get hsPreviewHint =>
      'Appuyez longuement pour basculer votre vue des droits.';

  @override
  String get hsShowRights => 'Afficher vos droits.';

  @override
  String get hsHideRights => 'Cacher vos droits.';

  @override
  String get hsStartRecord => 'Enregistrer une vidéo.';

  @override
  String get hsEndRecord => 'Arrêter l\'enregistrement.';

  @override
  String get hsFlashOff =>
      'Flash désactivé. Activez ce bouton pour activer le flash automatique.';

  @override
  String get hsFlashAuto => 'Flash automatique. Activez pour activer le flash.';

  @override
  String get hsFlashOn => 'Flash activé. Activez pour désactiver le flash.';

  @override
  String get hsFlashTorch => 'Mode torche. Activez pour désactiver le flash.';

  @override
  String get hsWelcome => 'Bienvenue sur InstaSOS';

  @override
  String get hsAppTutorial =>
      'Votre statut est partagé avec les contacts d\'urgence en cas de crise.\n\nVeuillez choisir un contact d\'urgence.\nUn seul pour l\'instant ; vous pourrez en ajouter d\'autres ultérieurement.';

  @override
  String get hsPermissionsTutorialTitle => 'Si vous le souhaitez';

  @override
  String get hsPermissionsTutorial =>
      'InstaSOS peut également recueillir et partager des preuves.\n\nPour ce faire, l\'accès à la caméra, au microphone et à la galerie sera requis.';

  @override
  String get hsPermissionsAlways =>
      'Veuillez définir la localisation sur \"Toujours autoriser\". Elle ne sera utilisée que lorsque le SOS est actif.';

  @override
  String get hsBroadcastTutorial =>
      'Activez le SOS pour envoyer automatiquement des SMS à vos contacts d\'urgence.\n\nSi InstaSOS a accès à votre localisation, celle-ci sera incluse dans les SMS.\n\nLes SMS continueront d\'être envoyés même lorsque le téléphone est verrouillé.\n\nDésactivez le SOS ou fermez complètement l\'application pour arrêter les SMS.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activez le SOS pour envoyer automatiquement des SMS à vos contacts d\'urgence.\n\nSi InstaSOS a accès à votre localisation, celle-ci sera incluse dans les SMS.';

  @override
  String get hsSettingsTutorial =>
      'Vous pouvez…\n\n- Ajouter d\'autres contacts d\'urgence\n- Configurer le SOS automatique\n- Modifier la langue de l\'application\n- Mettre à jour l\'apparence de l\'application\n\ndans les paramètres.\n\nMaintenez le bouton Paramètres enfoncé pour partager votre retour sur l\'application.';

  @override
  String get hsVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, le SOS s\'active automatiquement.\n\nAppuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsIOSVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nAppuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsRightsTutorial =>
      'Si vous activez l\'appareil photo et prenez une photo ou enregistrez une vidéo, vous pourrez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, le SOS s\'active automatiquement.\n\nAppuyez sur le marteau ou appuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsIOSRightsTutorial =>
      'Si vous activez l\'appareil photo et prenez une photo ou enregistrez une vidéo, vous pourrez la partager immédiatement.\n\nAppuyez sur le marteau ou appuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsNeedContacts =>
      'InstaSOS a besoin d\'accéder à vos contacts pour fonctionner correctement.';

  @override
  String get hsPartialContacts =>
      'Apple affichera tous les contacts, pas seulement ceux partagés avec InstaSOS.\nPour partager plus de contacts, accédez à Paramètres iOS -> Applications -> InstaSOS';

  @override
  String get hsNumError =>
      'Le contact est privé ou n\'a pas de numéro de téléphone.';

  @override
  String get rsSharedHeader => 'Vous avez le droit de...';

  @override
  String get rsOnFoot => 'Piéton';

  @override
  String get rsWhileDriving => 'Conducteur';

  @override
  String get rsAtHome => 'Au domicile';

  @override
  String get rsSharedRemainSilent =>
      'Garder le silence. Ne mentez pas, mais vous n\'êtes pas obligé de répondre aux questions.';

  @override
  String get rsSharedDocument =>
      'Documenter tout. Vous avez le droit de prendre des photos, d\'enregistrer des vidéos et de faire des enregistrements audio.';

  @override
  String get rsMobilePockets =>
      'Refuser la fouille de vos poches. L\'ICE peut procéder à une palpation, mais pas à une fouille.';

  @override
  String get rsMobileQuestion =>
      'Poser des questions. Comprenez pourquoi vous avez été arrêté.';

  @override
  String get rsMobileLeave => 'Partez si vous n’êtes pas en détention.';

  @override
  String get rsDriveSearch => 'Refuser la fouille de votre véhicule.';

  @override
  String get rsDriveID =>
      'Refuser de présenter une pièce d\'identité en tant que passager. Seul le conducteur est tenu de présenter une pièce d\'identité.';

  @override
  String get rsDriveWarrant =>
      'Demander aux agents s\'ils ont un mandat. Vous avez le droit de le voir s\'ils en ont un. Si un \"mandat\" n\'est pas signé par un juge, il n\'est pas valide.';

  @override
  String get rsHomeWarrant =>
      'Garder votre porte fermée. S\'ils ont un mandat, demandez-leur de le glisser sous la porte. Si un \"mandat\" n\'est pas signé par un juge, il n\'est pas valide. Gardez votre porte fermée.';

  @override
  String get rsSharedSign => 'Refuser de signer quoi que ce soit.';

  @override
  String get rsSharedFingerprint =>
      'Refuser de vous soumettre à un relevé d\'empreintes digitales par l\'ICE, sauf si vous êtes en état d\'arrestation.';

  @override
  String get rsSharedLawyer =>
      'Consulter un avocat. Si vous avez été officiellement arrêté, vous avez droit à un avocat commis d\'office.';

  @override
  String get ssSOSOnOpen => 'SOS à l\'ouverture';

  @override
  String get ssSOSOnClose => 'SOS à la fermeture';

  @override
  String get ssSOSOnCloseHint =>
      'Lorsqu\'il est activé, un bouton de fermeture sécurisée s\'affiche en face des paramètres.';

  @override
  String get ssCloseOffWarning =>
      'L\'application se fermera automatiquement pour éviter les diffusions involontaires.';

  @override
  String get ssVideoSOS => 'SOS en cas d\'enregistrement interrompu';

  @override
  String get ssAutoShare => 'Partage automatique de médias';

  @override
  String get ssEMC => 'Contacts d\'urgence';

  @override
  String get ssRemoveHint => 'Supprimer le contact';

  @override
  String get ssAddHint => 'Ajouter un autre contact';

  @override
  String get ssLinkType => 'Type de lien';

  @override
  String get ssAppearance => 'Apparence';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Comment la liste des droits a-t-elle été établie ?';

  @override
  String get faqListA1 =>
      'La liste des droits a été compilée à partir de plusieurs sources publiques, notamment :';

  @override
  String get faqListA2 => 'Une autre ressource utile : ';

  @override
  String get faqSettings => 'À quoi servent les paramètres ?';

  @override
  String get faqOnOpen =>
      'SOS à l\'ouverture : lorsqu\'activé, un signal SOS commencera immédiatement au lancement de l\'application. Non recommandé pour la plupart des utilisateurs, car cela pourrait entraîner des alertes accidentelles.';

  @override
  String get faqOnInterrupt =>
      'SOS en cas d\'interruption : lorsqu\'activé, si un enregistrement vidéo est en cours et qu\'InstaSOS passe en arrière-plan (minimisée, changement d\'application, écran éteint), un signal SOS commencera.\nIl est recommandé d\'activer cette option ou « SOS à la fermeture » (ou les deux).';

  @override
  String get faqAutoShare =>
      'Partage automatique : lorsqu\'activé, les options de partage natives apparaîtront dès qu\'une vidéo se termine ou qu\'une photo est prise.';

  @override
  String get faqEMC =>
      'Contacts d\'urgence : les personnes qui recevront votre localisation pendant qu\'un signal SOS est actif.';

  @override
  String get faqLink =>
      'Type de lien : la manière dont votre localisation sera transmise à vos contacts d\'urgence. « Google Maps », « Apple Maps » et « Waze » enverront un lien cliquable pour le service correspondant. « Coordonnées » enverra votre latitude et longitude sous forme de texte brut.';

  @override
  String get faqUnavailable => 'Le SOS indique « Localisation indisponible » ?';

  @override
  String get faqReliability =>
      'Pour améliorer la fiabilité du SOS, veuillez activer « Toujours autoriser » dans les ';

  @override
  String get faqLocationPermissions => 'autorisations de localisation';

  @override
  String get faqLocationTrust =>
      'L\'application utilise votre localisation uniquement lorsqu\'un signal SOS est actif. Ni InstaSOS ni Empathetech LLC ne suivent, ne stockent ou ne vendent les données des utilisateurs.';

  @override
  String get faqPrivateContact =>
      'Le contact est privé ou n\'a pas de numéro de téléphone ?';

  @override
  String get faqContactPermissions =>
      'Si vous recevez ce message lors de l\'ajout d\'un contact d\'urgence, InstaSOS n\'a pas la permission d\'accéder à ce contact.';

  @override
  String get faqUpdateContacts =>
      'Vous pouvez mettre à jour les permissions de contacts dans les ';

  @override
  String get faqOSSettings => 'réglages iOS';

  @override
  String get faqMissing =>
      'Pourquoi certaines fonctionnalités Android sont-elles manquantes ?';

  @override
  String get faqRestricted =>
      'Les fonctionnalités manquantes nécessitent l\'automatisation des SMS, et Apple n\'autorise pas les développeurs à automatiser les messages texte (sans service payant).';

  @override
  String get faqShortcuts =>
      'Qu\'en est-il des Raccourcis iOS ?\nIl existe également des restrictions sur l\'accès aux raccourcis utilisateur, ce qui briserait des fonctionnalités cruciales. Principalement : cela interromprait les enregistrements vidéo.';

  @override
  String get faqLanguages =>
      'Pourquoi la langue X n\'est-elle pas disponible ?';

  @override
  String get faqResponsible =>
      'Il serait irresponsable d\'utiliser la traduction automatique pour la liste des droits. Veuillez envisager de ';

  @override
  String get faqContributing => 'contribuer';

  @override
  String get faqExpand => ' pour aider à élargir les options de langue.';

  @override
  String get faqReset => 'Réinitialiser le tutoriel';

  @override
  String get faqResetSnack => 'Le tutoriel sera relancé au prochain démarrage.';

  @override
  String get faqOnCloseWarning =>
      '\"SOS à la fermeture\" est activé. Cela lancera une diffusion.';

  @override
  String get dsLadyLiberty =>
      'Une photo de la Statue de la Liberté, avec un aperçu de la liste des droits.';
}
