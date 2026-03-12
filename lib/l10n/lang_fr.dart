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
  String get gDone => 'Done';

  @override
  String get gReminder => 'Rappel';

  @override
  String get gNotAgain => 'Ne plus afficher';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

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
  String get hsWelcome => 'Bienvenue sur InstaSOS';

  @override
  String get hsWelcomeFix => 'Welcome to Insta-SOS';

  @override
  String get hsAppIntro =>
      'To start, this is only a Know Your Rights app.\nYou can enable more tools by giving them permission in the list below.';

  @override
  String get hsAppIntroAlt =>
      'The latest update was a big one, let\'s make sure everything is ready below.';

  @override
  String get hsYourApp => 'You can change your mind/permissions at any time.';

  @override
  String get hsHybridTranslation =>
      'This tutorial is machine translated.\nThe list of rights is human translated.';

  @override
  String get hsCamMic => 'Camera & Microphone';

  @override
  String get hsAddRecording => 'Enables video recording.';

  @override
  String get hsGallery => 'Gallery';

  @override
  String get hsAddSave => 'Required to save your recordings.';

  @override
  String get hsCameraReady => 'Camera is ready';

  @override
  String get hsCameraSetupHint =>
      'Activate to give Insta-SOS permission to the camera.';

  @override
  String get hsContacts => 'Contacts';

  @override
  String get hsAddContacts => 'Part 1 of enabling emergency contact alerts.';

  @override
  String get hsAddContactsIOS => 'Enables emergency contact alerts.';

  @override
  String get hsContactsReady => 'Contacts are ready';

  @override
  String get hsContactsSetupHint =>
      'Activate to give Insta-SOS permission to view your contacts.';

  @override
  String get hsTexting => 'Texting';

  @override
  String get hsAddTexting => 'Part 2 of enabling emergency contact alerts.';

  @override
  String get hsTextingReady => 'Texting is ready';

  @override
  String get hsTextingSetupHint =>
      'Activate to give Insta-SOS permission to send messages.';

  @override
  String get hsLocation => 'Location';

  @override
  String get hsUnable => 'Unable to determine';

  @override
  String get hsAddLocation =>
      'Enables location sharing with emergency contacts.';

  @override
  String get hsAddAlways =>
      'Recommended to enable always. Press again to open the System Settings.';

  @override
  String get hsLocationReady => 'Location is ready';

  @override
  String get hsLocationSetupHint =>
      'Activate to give Insta-SOS permission to view your location.';

  @override
  String get hsOneOfFour => 'First of four. Continue...';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activez le SOS pour envoyer automatiquement des SMS à vos contacts d\'urgence.\n\nSi InstaSOS a accès à votre localisation, celle-ci sera incluse dans les SMS.';

  @override
  String get hsIOSBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'The texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      'Vous pouvez…\n\n- Ajouter d\'autres contacts d\'urgence\n- Configurer le SOS automatique\n- Modifier la langue de l\'application\n- Mettre à jour l\'apparence de l\'application\n\ndans les paramètres.\n\nMaintenez le bouton Paramètres enfoncé pour partager votre retour sur l\'application.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nPar défaut, si un enregistrement est interrompu, le SOS s\'active automatiquement.\n\nAppuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsIOSVideoTutorial =>
      'Lorsque vous prenez une photo ou enregistrez une vidéo, vous pouvez la partager immédiatement.\n\nAppuyez longuement au centre de l\'écran pour afficher la liste de vos droits.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'Activez pour démarrer la diffusion SOS.';

  @override
  String get hsEndSOS =>
      'Le SOS est en cours de diffusion. Activez pour arrêter.';

  @override
  String get hsSafeCloseHint => 'Tout va bien. Fermer l\'application sans SOS.';

  @override
  String get hsBroadcasting => 'Broadcasting';

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
  String get hsNoFlash => 'Camera flash not working';

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
  String get ssAutoShare => 'Partage automatique de médias';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Apparence';

  @override
  String get ssPermissions => 'Permissions';

  @override
  String get ssResources => 'Resources';

  @override
  String get ssSupport => 'Support';

  @override
  String get pmOnlyAdd => 'This tool only helps to add permissions.';

  @override
  String get pmRemoveIn => 'You can remove permissions in the ';

  @override
  String get pmSystem => 'system settings.';

  @override
  String get pmManualPermission =>
      'If you remove permissions in the system settings, they must be restored there too.';

  @override
  String get rmCommunity => 'Community resources';

  @override
  String get rmGov => 'US government resources';

  @override
  String get rmAffiliate => 'None are affiliated with Empathetech LLC';

  @override
  String get rmAffiliateFix => 'None are affiliated with Empathetic LLC';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Comment la liste des droits a-t-elle été établie ?';

  @override
  String get faqListA =>
      'La liste des droits a été compilée à partir de plusieurs sources publiques, notamment :';

  @override
  String get faqSettings => 'À quoi servent les paramètres ?';

  @override
  String get faqAutoShareA =>
      ' uses your phone\'s built in share. It does not use your saved emergency contacts (if any). Sharing is optional and can always be cancelled.';

  @override
  String get faqLinkA =>
      ' how your location will be delivered to your emergency contacts. \"Google Maps\", \"Apple Maps\", and \"Waze\" will send a clickable link for the corresponding service. \"Coordinates\" will send your latitude and longitude as plain text.';

  @override
  String get faqOnOpenA =>
      ' an SOS broadcast will begin immediately upon app launch. Not recommended for most users, as it could lead to accidental broadcasts.';

  @override
  String get faqOnInterruptA =>
      ' if a video is recording and InstaSOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video is recording and Insta-SOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen.\nIt is recommended to enable either this or \"SOS on close\" (or both).';

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
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetic LLC track, store, or sell user data.';

  @override
  String get faqContactPermissions =>
      'Si vous recevez ce message lors de l\'ajout d\'un contact d\'urgence, InstaSOS n\'a pas la permission d\'accéder à ce contact.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that specific contact.';

  @override
  String get faqUpdateContacts =>
      'Vous pouvez mettre à jour les permissions de contacts dans les ';

  @override
  String get faqSplitClarity1 =>
      'Giving access to a contact does not make them an emergency contact. Only the numbers listed in the ';

  @override
  String get faqSplitClarity2 => 'will be contacted during an SOS broadcast.';

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
  String get faqContact => 'Contact support';

  @override
  String get faqContactHint => 'Email Empathetic LLC';

  @override
  String get bsEMC => 'Emergency contacts';

  @override
  String get bsAddSomeone => 'Add someone to enable SOS';

  @override
  String get bsRemoveHint => 'Remove contact';

  @override
  String get bsAddHint => 'Add another contact';

  @override
  String get bsLinkType => 'Location link type';

  @override
  String get bsSnackRequest => 'Please add emergency contacts';

  @override
  String get bsNeedPermission => 'Cannot add contacts without permission';

  @override
  String get bsPartialContacts =>
      'Apple will display all contacts, not just those shared with InstaSOS.\nTo share more contacts, open the ';

  @override
  String get bsPartialContactsFix =>
      'Apple will display all contacts, not just those shared with Insta-SOS.\nTo share more contacts, open the ';

  @override
  String get bsNumError =>
      'This contact is private or does not have a phone number.';

  @override
  String get bsSOSOnOpen => 'SOS on open';

  @override
  String get bsSOSOnClose => 'SOS on close';

  @override
  String get bsSOSOnCloseHint =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf InstaSOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsSOSOnCloseHintFix =>
      'A safe close (thumbs up) button will be appear on the home page, opposite the settings.\nIf Insta-SOS loses focus for any reason except the safe close button (minimized, switched apps, screen off), an SOS broadcast will begin.';

  @override
  String get bsCloseOffWarning =>
      'The app will auto-close to prevent unintentional broadcasts.';

  @override
  String get bsVideoSOS => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'Une photo de la Statue de la Liberté, avec un aperçu de la liste des droits.';

  @override
  String get dsShowBack => 'Show back button?';
}
