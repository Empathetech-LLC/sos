// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LangEs extends Lang {
  LangEs([String locale = 'es']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Done';

  @override
  String get gReminder => 'Recordatorio';

  @override
  String get gSystem => 'System settings';

  @override
  String get gNotAgain => 'No volver a mostrar';

  @override
  String get gOnCloseWarning =>
      '\"SOS on close\" is enabled. This will start a broadcast.';

  @override
  String get sosLastKnown => 'Última localización conocida';

  @override
  String get sosNeedSMS => 'SOS necesita poder enviar SMS para funcionar bien.';

  @override
  String get sosDisabled => 'Ubicación inaccesible (deshabilitado)';

  @override
  String get sosDenied => 'Ubicación inaccesible (rechazado)';

  @override
  String get sosError => 'Ubicación inaccesible (error)';

  @override
  String get hsWelcome => 'Bienvenido a InstaSOS';

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
      'The tutorial and settings are machine translated.\nThe rights list is human translated.';

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
  String get hsBroadcastTutorial =>
      'Activa el SOS para enviar SMS automáticamente a tus contactos de emergencia.\n\nSi InstaSOS tiene acceso a tu ubicación, se incluirá en los mensajes.\n\nSeguirán enviándose SMS aunque el dispositivo esté bloqueado.\n\nDesactiva el SOS o cierra la aplicación para dejar de enviar mensajes.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activate SOS to automatically text your emergency contacts.\n\nWhen Insta-SOS has access to your location, it will be included in the texts.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'The texts will continue when the phone is locked.\n\nManually deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsTwoOfFour => 'Second of four. Continue...';

  @override
  String get hsSettingsTutorial =>
      'Puedes...\n\n- Añadir más contactos de emergencia\n- Configurar SMS automáticos\n- Cambiar el idioma y\n- editar la apariencia de la aplicación\n\nen las opciones.\n\nMantén pulsado el botón de opciones para enviar feedback.';

  @override
  String get hsSettingsTutorialFix =>
      'You can configure your SOS broadcast, customize the app\'s appearance, and access more resources/support in the settings.';

  @override
  String get hsThreeOfFour => 'Third of four. Continue...';

  @override
  String get hsVideoTutorial =>
      'Cuando tomes una foto o grabes un vídeo, podrás compartirlo al instante.\n\nPor defecto, si se interrumpe una grabación, SOS se activará automáticamente.\n\nMantén pulsada la vista previa central para mostrar una lista de tus derechos.';

  @override
  String get hsIOSVideoTutorial =>
      'Cuando tomes una foto o grabes un vídeo, podrás compartirlo al instante.\n\nMantén pulsada la vista previa central para mostrar una lista de tus derechos.';

  @override
  String get hsTutorialComplete => 'Tutorial complete';

  @override
  String get hsAddEMC =>
      'If you\'re using SOS alerts, please head to the settings page and add your emergency contacts.';

  @override
  String get hsStartSOS => 'Activar para emitir señal SOS';

  @override
  String get hsEndSOS => 'SOS en transmisión. Activar para detener.';

  @override
  String get hsSafeCloseHint => 'Despejado. Cierra la app sin SOS.';

  @override
  String get hsBroadcasting => 'Broadcasting';

  @override
  String get hsStop => 'Detener';

  @override
  String get hsCameraHint => 'Toma una foto';

  @override
  String get hsPreviewHint => 'Mantén pulsado para mostrar tus derechos';

  @override
  String get hsShowRights => 'Muestra tus derechos';

  @override
  String get hsHideRights => 'Oculta tus derechos';

  @override
  String get hsStartRecord => 'Grabar un vídeo';

  @override
  String get hsEndRecord => 'Terminar la grabación';

  @override
  String get hsFlashOff =>
      'Flash desactivado. Activar para encender el flash automático';

  @override
  String get hsFlashAuto => 'Flash automático. Activar para encender el flash';

  @override
  String get hsFlashOn => 'Flash activado. Activar para apagar el flash';

  @override
  String get hsFlashTorch => 'Modo linterna. Activar para apagar la luz';

  @override
  String get hsNoFlash => 'Camera flash not working';

  @override
  String get rvSharedHeader => 'Tienes derecho a...';

  @override
  String get rvOnFoot => 'A pie';

  @override
  String get rvWhileDriving => 'Al volante';

  @override
  String get rvAtHome => 'En casa';

  @override
  String get rvSharedRemainSilent =>
      'Guarda silencio. No tienes que responder a ninguna pregunta, pero si dices algo, no mientas.';

  @override
  String get rvSharedDocument =>
      'Documéntalo todo. Tienes derecho a hacer fotos, grabar vídeos y audio.';

  @override
  String get rvMobilePockets =>
      'Niégate a que te registren los bolsillos. El ICE puede cachearte, pero no registrarte.';

  @override
  String get rvMobileQuestion =>
      'Haz preguntas, incluyendo por qué te han hecho detenerte.';

  @override
  String get rvMobileLeave => 'Salir si no estás detenido.';

  @override
  String get rvDriveSearch => 'Niégate a que registren tu vehículo.';

  @override
  String get rvDriveID =>
      'Si eres pasajero, niégate a proporcionar documentos de identificación. Solo la persona al volante está obligada a identificarse.';

  @override
  String get rvDriveWarrant =>
      'Pregunta si tienen una orden judicial. Tienes derecho a verla si la tienen. Una \"orden judicial\" solo es válida si está firmada por un juez.';

  @override
  String get rvHomeWarrant =>
      'No abras la puerta. Si tienen una orden judicial, pídeles que la pasen primero por debajo de la puerta. Una \"orden judicial\" solo es válida si está firmada por un juez. No abras la puerta.';

  @override
  String get rvSharedSign => 'Niégate a firmar cualquier cosa.';

  @override
  String get rvSharedFingerprint =>
      'Niégate a que el ICE tome tus huellas dactilares a menos que estés arrestado.';

  @override
  String get rvSharedLawyer =>
      'Consultar a un abogado. Si te han arrestado formalmente, tienes derecho a un abogado de oficio.';

  @override
  String get ssAutoShare => 'Compartir medios automáticamente';

  @override
  String get ssSOS => 'SOS settings';

  @override
  String get ssAppearance => 'Apariencia';

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
  String get faqName => 'Preguntas Frecuentes';

  @override
  String get faqListQ => '¿Cómo se elaboró la lista de derechos?';

  @override
  String get faqListA =>
      'La lista de derechos fue recopilada de varias fuentes públicas, incluyendo:';

  @override
  String get faqSettings => '¿Qué función tienen los ajustes?';

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
      ' if a video is recording and InstaSOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen. It is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqOnInterruptAFix =>
      ' if a video is recording and Insta-SOS loses focus, an SOS broadcast will begin. Losing focus being: minimizing the app, switching apps, and/or locking the screen. It is recommended to enable either this or \"SOS on close\" (or both).';

  @override
  String get faqUnavailable => '¿El SOS dice \"Ubicación no disponible\"?';

  @override
  String get faqReliability =>
      'Para mejorar la fiabilidad del SOS, por favor activa \"Permitir todo el tiempo\" en los ';

  @override
  String get faqLocationPermissions => 'permisos de ubicación';

  @override
  String get faqLocationTrust =>
      'La aplicación solo usa tu ubicación mientras hay una transmisión de SOS activa. Ni InstaSOS ni Empathetech LLC rastrean, almacenan o venden datos de usuarios.';

  @override
  String get faqLocationTrustFix =>
      'The app only uses your location while an SOS broadcast is active. Neither Insta-SOS or Empathetic LLC track, store, or sell user data.';

  @override
  String get faqContactPermissions =>
      'Si recibes este mensaje al añadir un contacto de emergencia, InstaSOS no tiene permiso para acceder a ese contacto.';

  @override
  String get faqContactPermissionsFix =>
      'If you get this message when adding an emergency contact, Insta-SOS does not have permission to access that specific contact.';

  @override
  String get faqUpdateContacts =>
      'Puedes actualizar los permisos de contactos en los ';

  @override
  String get faqSplitClarity1 =>
      'Giving access to a contact does not make them an emergency contact. Only the numbers listed in the ';

  @override
  String get faqSplitClarity2 => 'will be contacted during an SOS broadcast.';

  @override
  String get faqMissing => '¿Por qué faltan algunas funciones de Android?';

  @override
  String get faqRestricted =>
      'Las funciones que faltan requieren automatización de SMS, y Apple no permite a los desarrolladores automatizar mensajes de texto (sin un servicio de pago).';

  @override
  String get faqShortcuts =>
      '¿Qué hay de los atajos de iOS?\nTambién existen restricciones para acceder a los atajos del usuario, lo que rompería funciones cruciales. Principalmente: interrumpiría las grabaciones de video.';

  @override
  String get faqLanguages => '¿Por qué no está disponible el idioma X?';

  @override
  String get faqResponsible =>
      'Sería irresponsable usar traducción automática para la lista de derechos. Por favor considera ';

  @override
  String get faqContributing => 'contribuir';

  @override
  String get faqExpand => ' para ayudar a expandir las opciones de idioma.';

  @override
  String get faqReset => 'Restablecer tutorial';

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
  String get bsSOSOnVideo => 'SOS on interrupted recording';

  @override
  String get dsLadyLiberty =>
      'Una imagen de la Estatua de la Libertad, con una vista previa de la lista de derechos.';

  @override
  String get dsShowBack => 'Show back button?';
}
