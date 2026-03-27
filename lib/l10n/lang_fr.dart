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
  String get gDone => 'Terminé';

  @override
  String get gReminder => 'Rappel';

  @override
  String get gSystem => 'Paramètres système';

  @override
  String get gNotAgain => 'Ne plus afficher';

  @override
  String get gOnCloseWarning =>
      '\"SOS à la fermeture\" est activé. Cela lancera une diffusion.';

  @override
  String get sosLastKnown => 'dernière position connue :';

  @override
  String get sosNeedSMS => 'SOS nécessite l\'autorisation pour les SMS.';

  @override
  String get sosDisabled => 'Impossible d\'accéder à la position (désactivée)';

  @override
  String get sosDenied => 'Impossible d\'accéder à la position (refusée)';

  @override
  String get sosError => 'Impossible d\'accéder à la position (erreur)';

  @override
  String get hsWelcome => 'Bienvenue sur InstaSOS';

  @override
  String get hsWelcomeFix => 'Bienvenue sur Insta-SOS';

  @override
  String get hsAppIntro =>
      'Pour commencer, il s\'agit uniquement d\'une application \"Connaissez vos droits\".\nVous pouvez activer d\'autres outils en leur accordant l\'autorisation dans la liste ci-dessous.';

  @override
  String get hsAppIntroAlt =>
      'La dernière mise à jour était importante, assurons-nous que tout est prêt ci-dessous.';

  @override
  String get hsYourApp =>
      'Vous pouvez changer d\'avis/d\'autorisations à tout moment.';

  @override
  String get hsHybridTranslation =>
      'Le tutoriel et les paramètres sont traduits automatiquement.\nLa liste des droits est traduite par des humains.';

  @override
  String get hsCamMic => 'Caméra et microphone';

  @override
  String get hsAddRecording => 'Active l\'enregistrement vidéo.';

  @override
  String get hsGallery => 'Galerie';

  @override
  String get hsAddSave => 'Requis pour sauvegarder vos enregistrements.';

  @override
  String get hsCameraReady => 'La caméra est prête';

  @override
  String get hsCameraSetupHint =>
      'Activez pour donner à Insta-SOS l\'autorisation d\'accéder à la caméra.';

  @override
  String get hsContacts => 'Contacts';

  @override
  String get hsAddContacts =>
      'Partie 1 de l\'activation des alertes aux contacts d\'urgence.';

  @override
  String get hsAddContactsIOS => 'Active les alertes aux contacts d\'urgence.';

  @override
  String get hsContactsReady => 'Les contacts sont prêts';

  @override
  String get hsContactsSetupHint =>
      'Activez pour donner à Insta-SOS l\'autorisation d\'afficher vos contacts.';

  @override
  String get hsAppleContacts =>
      'Este paso es únicamente para los permisos de la aplicación.\nAún no está seleccionando los contactos de emergencia.\n\nSe recomienda conceder todos los permisos para evitar complicaciones.';

  @override
  String get hsTexting => 'SMS';

  @override
  String get hsAddTexting =>
      'Partie 2 de l\'activation des alertes aux contacts d\'urgence.';

  @override
  String get hsTextingReady => 'Les SMS sont prêts';

  @override
  String get hsTextingSetupHint =>
      'Activez pour donner à Insta-SOS l\'autorisation d\'envoyer des messages.';

  @override
  String get hsLocation => 'Position';

  @override
  String get hsUnable => 'Impossible de déterminer';

  @override
  String get hsAddLocation =>
      'Active le partage de position avec les contacts d\'urgence.';

  @override
  String get hsAddAlways =>
      'Recommandé de toujours activer. Appuyez à nouveau pour ouvrir les paramètres système.';

  @override
  String get hsLocationReady => 'La position est prête';

  @override
  String get hsLocationSetupHint =>
      'Activez pour donner à Insta-SOS l\'autorisation de voir votre position.';

  @override
  String get hsOneOfFour => 'Un sur quatre. Continuer...';

  @override
  String get hsBroadcastTutorial =>
      'Activez SOS pour envoyer automatiquement un SMS à vos contacts d\'urgence.\n\nLorsque InstaSOS a accès à votre position, elle sera incluse dans les SMS.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activez SOS pour envoyer automatiquement un SMS à vos contacts d\'urgence.\n\nLorsque Insta-SOS a accès à votre position, elle sera incluse dans les SMS.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Les SMS continueront lorsque le téléphone est verrouillé.\n\nDésactivez manuellement SOS ou fermez complètement l\'application pour arrêter les SMS.';

  @override
  String get hsTwoOfFour => 'Deux sur quatre. Continuer...';

  @override
  String get hsSettingsTutorial =>
      '- Configurez votre diffusion SOS\n- Personnalisez l\'apparence de l\'application\n- Accédez à plus de ressources et d\'assistance\n\ndans les paramètres.';

  @override
  String get hsSettingsTutorialFix =>
      'Vous pouvez configurer votre diffusion SOS, personnaliser l\'apparence de l\'application et accéder à plus de ressources/d\'assistance dans les paramètres.';

  @override
  String get hsThreeOfFour => 'Trois sur quatre. Continuer...';

  @override
  String get hsVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, une diffusion SOS démarrera automatiquement.\n\nAppuyez longuement sur l\'aperçu de la caméra pour afficher/masquer vos droits.';

  @override
  String get hsIOSVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nAppuyez longuement sur l\'aperçu de la caméra pour afficher/masquer vos droits.';

  @override
  String get hsTutorialComplete => 'Tutoriel terminé';

  @override
  String get hsAddEMC =>
      'Si vous utilisez les alertes SOS, veuillez vous rendre sur la page des paramètres et ajouter vos contacts d\'urgence.';

  @override
  String get hsStartSOS => 'Activez pour démarrer la diffusion SOS.';

  @override
  String get hsEndSOS => 'SOS en cours de diffusion. Activez pour arrêter.';

  @override
  String get hsSafeCloseHint => 'Tout va bien. Fermez l\'application sans SOS.';

  @override
  String get hsBroadcasting => 'Diffusion en cours';

  @override
  String get hsStop => 'Arrêter';

  @override
  String get hsCameraHint => 'Prendre une photo.';

  @override
  String get hsPreviewHint => 'Appui long pour afficher/masquer vos droits.';

  @override
  String get hsShowRights => 'Afficher vos droits.';

  @override
  String get hsHideRights => 'Masquer vos droits.';

  @override
  String get hsStartRecord => 'Enregistrer une vidéo.';

  @override
  String get hsEndRecord => 'Terminer l\'enregistrement.';

  @override
  String get hsFlashOff =>
      'Flash désactivé. Activez pour allumer le flash automatique.';

  @override
  String get hsFlashAuto => 'Flash automatique. Activez pour allumer le flash.';

  @override
  String get hsFlashOn => 'Flash activé. Activez pour éteindre le flash.';

  @override
  String get hsFlashTorch => 'Mode torche. Activez pour éteindre le flash.';

  @override
  String get hsNoFlash => 'Le flash de la caméra ne fonctionne pas';

  @override
  String get rvSharedHeader => 'Vous avez le droit de...';

  @override
  String get rvOnFoot => 'Piéton';

  @override
  String get rvWhileDriving => 'Conducteur';

  @override
  String get rvAtHome => 'Au domicile';

  @override
  String get rvSharedRemainSilent =>
      'Garder le silence. Ne mentez pas, mais vous n\'êtes pas obligé de répondre aux questions.';

  @override
  String get rvSharedDocument =>
      'Documenter tout. Vous avez le droit de prendre des photos, d\'enregistrer des vidéos et de faire des enregistrements audio.';

  @override
  String get rvMobilePockets =>
      'Refuser la fouille de vos poches. L\'ICE peut procéder à une palpation, mais pas à une fouille.';

  @override
  String get rvMobileQuestion =>
      'Poser des questions. Comprenez pourquoi vous avez été arrêté.';

  @override
  String get rvMobileLeave => 'Partez si vous n’êtes pas en détention.';

  @override
  String get rvDriveSearch => 'Refuser la fouille de votre véhicule.';

  @override
  String get rvDriveID =>
      'Refuser de présenter une pièce d\'identité en tant que passager. Seul le conducteur est tenu de présenter une pièce d\'identité.';

  @override
  String get rvDriveWarrant =>
      'Demander aux agents s\'ils ont un mandat. Vous avez le droit de le voir s\'ils en ont un. Si un \"mandat\" n\'est pas signé par un juge, il n\'est pas valide.';

  @override
  String get rvHomeWarrant =>
      'Garder votre porte fermée. S\'ils ont un mandat, demandez-leur de le glisser sous la porte. Si un \"mandat\" n\'est pas signé par un juge, il n\'est pas valide. Gardez votre porte fermée.';

  @override
  String get rvSharedSign => 'Refuser de signer quoi que ce soit.';

  @override
  String get rvSharedFingerprint =>
      'Refuser de vous soumettre à un relevé d\'empreintes digitales par l\'ICE, sauf si vous êtes en état d\'arrestation.';

  @override
  String get rvSharedLawyer =>
      'Consulter un avocat. Si vous avez été officiellement arrêté, vous avez droit à un avocat commis d\'office.';

  @override
  String get ssAutoShare => 'Partage automatique de photos/vidéos';

  @override
  String get ssSOS => 'Paramètres SOS';

  @override
  String get ssAppearance => 'Paramètres d\'apparence';

  @override
  String get ssPermissions => 'Autorisations';

  @override
  String get ssResources => 'Ressources';

  @override
  String get ssSupport => 'Assistance';

  @override
  String get pmOnlyAdd =>
      'Cet outil aide uniquement à ajouter des autorisations.';

  @override
  String get pmRemoveIn => 'Vous pouvez supprimer les autorisations dans les ';

  @override
  String get pmManualPermission =>
      'Si vous supprimez des autorisations dans les paramètres système, elles doivent y être restaurées également.';

  @override
  String get rmCommunity => 'Ressources communautaires';

  @override
  String get rmGov => 'Ressources du gouvernement américain';

  @override
  String get rmAffiliate => 'Aucune n\'est affiliée à Empathetech LLC';

  @override
  String get rmAffiliateFix => 'Aucune n\'est affiliée à Empathetic LLC';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Comment la liste des droits a-t-elle été élaborée ?';

  @override
  String get faqListA =>
      'La liste des droits a été tirée de plusieurs ressources publiques, notamment :';

  @override
  String get faqSettings => 'Comment fonctionnent les paramètres ?';

  @override
  String get faqAutoShareA =>
      ' utilise le partage intégré de votre téléphone. Il n\'utilise pas vos contacts d\'urgence enregistrés (le cas échéant). Le partage est facultatif et peut toujours être annulé.';

  @override
  String get faqLinkA =>
      ' comment votre position sera envoyée à vos contacts d\'urgence. \"Google Maps\", \"Apple Maps\" et \"Waze\" enverront un lien cliquable pour le service correspondant. \"Coordonnées\" enverra votre latitude et votre longitude en texte brut.';

  @override
  String get faqOnOpenA =>
      ' une diffusion SOS commencera immédiatement au lancement de l\'application. Non recommandé pour la plupart des utilisateurs, car cela pourrait entraîner des diffusions accidentelles.';

  @override
  String get faqOnInterruptA =>
      ' si une vidéo est en cours d\'enregistrement et qu\'InstaSOS perd le focus, une diffusion SOS commencera. Perdre le focus signifie : réduire l\'application, changer d\'application et/ou verrouiller l\'écran. Il est recommandé d\'activer ceci ou \"SOS à la fermeture\" (ou les deux).';

  @override
  String get faqOnInterruptAFix =>
      ' si une vidéo est en cours d\'enregistrement et qu\'Insta-SOS perd le focus, une diffusion SOS commencera. Perdre le focus signifie : réduire l\'application, changer d\'application et/ou verrouiller l\'écran. Il est recommandé d\'activer ceci ou \"SOS à la fermeture\" (ou les deux).';

  @override
  String get faqUnavailable => 'SOS indique \"Position indisponible\" ?';

  @override
  String get faqReliability =>
      'Pour améliorer la fiabilité du SOS, veuillez activer \"Toujours autoriser\" dans les ';

  @override
  String get faqLocationPermissions => 'autorisations de localisation';

  @override
  String get faqLocationTrust =>
      'L\'application utilise uniquement votre position lorsqu\'une diffusion SOS est active. Ni InstaSOS ni Empathetech LLC ne suivent, ne stockent ou ne vendent les données des utilisateurs.';

  @override
  String get faqLocationTrustFix =>
      'L\'application utilise uniquement votre position lorsqu\'une diffusion SOS est active. Ni Insta-SOS ni Empathetic LLC ne suivent, ne stockent ou ne vendent les données des utilisateurs.';

  @override
  String get faqContactPermissions =>
      'Si vous recevez ce message lors de l\'ajout d\'un contact d\'urgence, InstaSOS n\'a pas l\'autorisation d\'accéder à ce contact spécifique.';

  @override
  String get faqContactPermissionsFix =>
      'Si vous recevez ce message lors de l\'ajout d\'un contact d\'urgence, Insta-SOS n\'a pas l\'autorisation d\'accéder à ce contact spécifique.';

  @override
  String get faqUpdateContacts =>
      'Vous pouvez donner accès à plus de contacts (ou à tous) dans les ';

  @override
  String get faqSplitClarity1 =>
      'Donner accès à un contact n\'en fait pas un contact d\'urgence. Seuls les numéros répertoriés dans les ';

  @override
  String get faqSplitClarity2 => ' seront contactés lors d\'une diffusion SOS.';

  @override
  String get faqMissing =>
      'Pourquoi certaines fonctionnalités Android sont-elles manquantes ?';

  @override
  String get faqRestricted =>
      'Les fonctionnalités manquantes nécessitent l\'automatisation des SMS, et Apple n\'autorise pas les développeurs à automatiser les messages texte (sans un service payant).';

  @override
  String get faqShortcuts =>
      'Qu\'en est-il des raccourcis iOS ?\nIl existe également des restrictions sur l\'accès aux raccourcis utilisateur, ce qui briserait des fonctionnalités cruciales. Principalement : cela interromprait les enregistrements vidéo.';

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
  String get faqContact => 'Contacter l\'assistance';

  @override
  String get faqContactHint => 'Envoyer un e-mail à Empathetic LLC';

  @override
  String get bsEMC => 'Contacts d\'urgence';

  @override
  String get bsAddSomeone => 'Ajouter quelqu\'un pour activer le SOS';

  @override
  String get bsRemoveHint => 'Supprimer le contact';

  @override
  String get bsAddHint => 'Ajouter un autre contact';

  @override
  String get bsLinkType => 'Type de lien de position';

  @override
  String get bsSnackRequest => 'Veuillez ajouter des contacts d\'urgence';

  @override
  String get bsNeedPermission =>
      'Impossible d\'ajouter des contacts sans autorisation';

  @override
  String get bsPartialContacts =>
      'Apple affichera tous les contacts, pas seulement ceux partagés avec InstaSOS.\nPour partager plus de contacts, ouvrez les ';

  @override
  String get bsPartialContactsFix =>
      'Apple affichera tous les contacts, pas seulement ceux partagés avec Insta-SOS.\nPour partager plus de contacts, ouvrez les ';

  @override
  String get bsNumError =>
      'Ce contact est privé ou n\'a pas de numéro de téléphone.';

  @override
  String get bsSOSOnOpen => 'SOS à l\'ouverture';

  @override
  String get bsSOSOnClose => 'SOS à la fermeture';

  @override
  String get bsSOSOnCloseHint =>
      'Un bouton de fermeture sécurisée (pouce en l\'air) apparaîtra sur la page d\'accueil, à l\'opposé des paramètres.\nSi InstaSOS perd le focus pour une raison quelconque à l\'exception du bouton de fermeture sécurisée (réduite, changement d\'application, écran éteint), une diffusion SOS commencera.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Un bouton de fermeture sécurisée (pouce en l\'air) apparaîtra sur la page d\'accueil, à l\'opposé des paramètres.\nSi Insta-SOS perd le focus pour une raison quelconque à l\'exception du bouton de fermeture sécurisée (réduite, changement d\'application, écran éteint), une diffusion SOS commencera.';

  @override
  String get bsCloseOffWarning =>
      'L\'application se fermera automatiquement pour éviter les diffusions involontaires.';

  @override
  String get bsSOSOnVideo => 'SOS lors d\'un enregistrement interrompu';

  @override
  String get dsLadyLiberty =>
      'Une photo de la Statue de la Liberté, avec un aperçu de la liste des droits.';

  @override
  String get dsShowBack => 'Afficher le bouton de retour ?';
}
