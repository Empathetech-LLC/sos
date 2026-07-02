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
  String get gDone => 'Hecho';

  @override
  String get gReminder => 'Recordatorio';

  @override
  String get gSystem => 'Configuración del sistema';

  @override
  String get gNotAgain => 'No volver a mostrar';

  @override
  String get gOnCloseWarning =>
      '\"SOS al cerrar\" está activado. Esto iniciará una transmisión.';

  @override
  String get sosLastKnown => 'Última ubicación conocida:';

  @override
  String get sosNeedSMS => 'SOS necesita permiso de SMS (mensajes de texto).';

  @override
  String get sosDisabled => 'Ubicación inaccesible (deshabilitado)';

  @override
  String get sosDenied => 'Ubicación inaccesible (denegado)';

  @override
  String get sosError => 'Ubicación inaccesible (error)';

  @override
  String get hsWelcome => 'Bienvenido a InstaSOS';

  @override
  String get hsWelcomeFix => 'Bienvenido a Insta-SOS';

  @override
  String get hsAppIntro =>
      'Para empezar, esta es solo una aplicación de Conozca sus Derechos.\nPuedes habilitar más herramientas dándoles permiso en la lista a continuación.';

  @override
  String get hsAppIntroAlt =>
      'La última actualización fue importante, asegurémonos de que todo esté listo a continuación.';

  @override
  String get hsYourApp =>
      'Puedes cambiar de opinión/permisos en cualquier momento.';

  @override
  String get hsHybridTranslation =>
      'El tutorial y la configuración están traducidos automáticamente.\nLa lista de derechos está traducida por humanos.';

  @override
  String get hsCamera => 'Cámara';

  @override
  String get hsAddRecording => 'Habilita la grabación de video';

  @override
  String get hsMic => 'Micrófono';

  @override
  String get hsSilent => 'Los videos no tendrán sonido sin él';

  @override
  String get hsGallery => 'Galería';

  @override
  String get hsAddSave => 'Requerido para guardar tus grabaciones';

  @override
  String get hsCameraReady => 'La cámara está lista';

  @override
  String get hsCameraSetupHint =>
      'Activar para dar permiso a la cámara a Insta-SOS';

  @override
  String get hsCameraSnack =>
      'Por favor, habilita la cámara en la configuración (arriba)\ny luego intenta nuevamente';

  @override
  String get hsContacts => 'Contactos';

  @override
  String get hsAddContacts => 'Habilita los mensajes de SOS';

  @override
  String get hsAppleContacts =>
      'Este paso es solo para permisos de la aplicación.\nAún no estás eligiendo contactos de emergencia.\n\nSe recomienda permitir todos para evitar complicaciones.';

  @override
  String get hsContactsSetupHint =>
      'Activar para dar permiso a Insta-SOS de ver tus contactos.';

  @override
  String get hsSMS =>
      'Android requiere permiso tanto para a quién como para cómo enviar mensajes de texto';

  @override
  String get hsTextingSetupHint =>
      'Activar para dar permiso a Insta-SOS de enviar mensajes.';

  @override
  String get hsSOSReady => 'SOS está listo';

  @override
  String get hsLocation => 'Ubicación';

  @override
  String get hsAddLocation => 'Agrega tu ubicación a los mensajes de SOS';

  @override
  String get hsAddAlways =>
      'Se recomienda habilitar siempre. Presiona nuevamente para abrir la Configuración del sistema.';

  @override
  String get hsLocationReady => 'La ubicación está lista';

  @override
  String get hsLocationSetupHint =>
      'Activar para dar permiso a Insta-SOS de ver tu ubicación.';

  @override
  String get hsUnable => 'No se puede determinar';

  @override
  String get hsOneOfFour => 'Primero de cuatro. Continuar...';

  @override
  String get hsBroadcastTutorial =>
      'Activa SOS para enviar mensajes de texto automáticamente a tus contactos de emergencia.\n\nCuando InstaSOS tenga acceso a tu ubicación, se incluirá en los mensajes.';

  @override
  String get hsBroadcastTutorialFix =>
      'Activa SOS para enviar mensajes de texto automáticamente a tus contactos de emergencia.\n\nCuando Insta-SOS tenga acceso a tu ubicación, se incluirá en los mensajes.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Los mensajes de texto continuarán cuando el teléfono esté bloqueado.\n\nDesactiva manualmente SOS o cierra la aplicación por completo para detener los mensajes.';

  @override
  String get hsTwoOfFour => 'Segundo de cuatro. Continuar...';

  @override
  String get hsSettingsTutorial =>
      '- Configura tu transmisión SOS\n- Personaliza la apariencia de la aplicación\n- Accede a más recursos y soporte\n\nen la configuración.';

  @override
  String get hsSettingsTutorialFix =>
      'Puedes configurar tu transmisión SOS, personalizar la apariencia de la aplicación y acceder a más recursos/soporte en la configuración.';

  @override
  String get hsThreeOfFour => 'Tercero de cuatro. Continuar...';

  @override
  String get hsVideoTutorial =>
      'Cuando tomas una foto o grabas un video, puedes compartirlo de inmediato.\n\nDe forma predeterminada, si se interrumpe una grabación, se iniciará automáticamente una transmisión SOS.\n\nMantén presionada la vista previa de la cámara para mostrar/ocultar tus derechos.';

  @override
  String get hsIOSVideoTutorial =>
      'Cuando tomas una foto o grabas un video, puedes compartirlo de inmediato.\n\nMantén presionada la vista previa de la cámara para mostrar/ocultar tus derechos.';

  @override
  String get hsTutorialComplete => 'Tutorial completado';

  @override
  String get hsAddEMC =>
      'Si estás usando las alertas SOS, por favor dirígete a la página de configuración y agrega tus contactos de emergencia.';

  @override
  String get hsStartSOS => 'Activar para iniciar la transmisión SOS.';

  @override
  String get hsEndSOS => 'SOS está transmitiendo. Activar para detener.';

  @override
  String get hsSafeCloseHint => 'Todo despejado. Cierra la aplicación sin SOS.';

  @override
  String get hsBroadcasting => 'Transmitiendo';

  @override
  String get hsStop => 'Detener';

  @override
  String get hsCameraHint => 'Tomar una foto.';

  @override
  String get hsPreviewHint =>
      'Mantener presionado para mostrar/ocultar tus derechos.';

  @override
  String get hsShowRights => 'Mostrar tus derechos.';

  @override
  String get hsHideRights => 'Ocultar tus derechos.';

  @override
  String get hsStartRecord => 'Grabar un video.';

  @override
  String get hsEndRecord => 'Finalizar la grabación.';

  @override
  String get hsFlashOff =>
      'Flash apagado. Activar para encender el flash automático.';

  @override
  String get hsFlashAuto => 'Flash automático. Activar para encender el flash.';

  @override
  String get hsFlashOn => 'Flash encendido. Activar para apagar el flash.';

  @override
  String get hsFlashTorch => 'Modo linterna. Activar para apagar el flash.';

  @override
  String get hsNoFlash => 'El flash de la cámara no funciona';

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
  String get ssAutoShare => 'Compartir fotos/videos automáticamente';

  @override
  String get ssSOS => 'Configuración de SOS';

  @override
  String get ssAppearance => 'Configuración de apariencia';

  @override
  String get ssPermissions => 'Permisos';

  @override
  String get ssResources => 'Recursos';

  @override
  String get ssSupport => 'Soporte';

  @override
  String get pmOnlyAdd => 'Esta herramienta solo ayuda a agregar permisos.';

  @override
  String get pmRemoveIn => 'Puedes quitar los permisos en la ';

  @override
  String get pmManualPermission =>
      'Si quitas los permisos en la configuración del sistema, también deben restaurarse allí.';

  @override
  String get rmCommunity => 'Recursos comunitarios';

  @override
  String get rmGov => 'Recursos del gobierno de EE. UU.';

  @override
  String get rmAffiliate => 'Ninguno está afiliado a Empathetech LLC';

  @override
  String get rmAffiliateFix => 'Ninguno está afiliado a Empathetic LLC';

  @override
  String get faqName => 'Preguntas Frecuentes';

  @override
  String get faqListQ => '¿Cómo se hizo la lista de derechos?';

  @override
  String get faqListA =>
      'La lista de derechos fue tomada de varios recursos públicos, incluyendo:';

  @override
  String get faqSettings => '¿Cómo funciona la configuración?';

  @override
  String get faqAutoShareA =>
      ' usa la función de compartir integrada en tu teléfono. No usa tus contactos de emergencia guardados (si los hay). Compartir es opcional y siempre se puede cancelar.';

  @override
  String get faqLinkA =>
      ' cómo se entregará tu ubicación a tus contactos de emergencia. \"Google Maps\", \"Apple Maps\" y \"Waze\" enviarán un enlace en el que se puede hacer clic para el servicio correspondiente. \"Coordenadas\" enviará tu latitud y longitud como texto sin formato.';

  @override
  String get faqOnOpenA =>
      ' una transmisión SOS comenzará inmediatamente al abrir la aplicación. No recomendado para la mayoría de los usuarios, ya que podría provocar transmisiones accidentales.';

  @override
  String get faqOnInterruptA =>
      ' si se está grabando un video e InstaSOS pierde el foco, comenzará una transmisión SOS. Perder el foco significa: minimizar la aplicación, cambiar de aplicación y/o bloquear la pantalla. Se recomienda habilitar esto o \"SOS al cerrar\" (o ambos).';

  @override
  String get faqOnInterruptAFix =>
      ' si se está grabando un video e Insta-SOS pierde el foco, comenzará una transmisión SOS. Perder el foco significa: minimizar la aplicación, cambiar de aplicación y/o bloquear la pantalla. Se recomienda habilitar esto o \"SOS al cerrar\" (o ambos).';

  @override
  String get faqUnavailable => '¿SOS dice \"Ubicación no disponible\"?';

  @override
  String get faqReliability =>
      'Para mejorar la fiabilidad de SOS, por favor habilita \"Permitir todo el tiempo\" en los ';

  @override
  String get faqLocationPermissions => 'permisos de ubicación';

  @override
  String get faqLocationTrust =>
      'La aplicación solo usa tu ubicación mientras una transmisión SOS está activa. Ni InstaSOS ni Empathetech LLC rastrean, almacenan o venden datos del usuario.';

  @override
  String get faqLocationTrustFix =>
      'La aplicación solo usa tu ubicación mientras una transmisión SOS está activa. Ni Insta-SOS ni Empathetic LLC rastrean, almacenan o venden datos del usuario.';

  @override
  String get faqContactPermissions =>
      'Si recibes este mensaje al agregar un contacto de emergencia, InstaSOS no tiene permiso para acceder a ese contacto en específico.';

  @override
  String get faqContactPermissionsFix =>
      'Si recibes este mensaje al agregar un contacto de emergencia, Insta-SOS no tiene permiso para acceder a ese contacto en específico.';

  @override
  String get faqUpdateContacts =>
      'Puedes dar acceso a más (o todos) los contactos en la ';

  @override
  String get faqSplitClarity1 =>
      'Dar acceso a un contacto no lo convierte en un contacto de emergencia. Solo los números listados en los ';

  @override
  String get faqSplitClarity2 =>
      ' serán contactados durante una transmisión SOS.';

  @override
  String get faqMissing => '¿Por qué faltan algunas funciones de Android?';

  @override
  String get faqRestricted =>
      'Las funciones faltantes requieren automatización de SMS, y Apple no permite a los desarrolladores automatizar mensajes de texto (sin un servicio pago).';

  @override
  String get faqShortcuts =>
      '¿Qué pasa con los atajos de iOS?\nTambién hay restricciones para acceder a los atajos del usuario, lo que rompería funciones cruciales. Principalmente: interrumpiría las grabaciones de video.';

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
  String get faqContact => 'Contactar a soporte';

  @override
  String get faqContactHint => 'Enviar correo a Empathetic LLC';

  @override
  String get bsEMC => 'Contactos de emergencia';

  @override
  String get bsAddSomeone => 'Agrega a alguien para habilitar SOS';

  @override
  String get bsRemoveHint => 'Eliminar contacto';

  @override
  String get bsAddHint => 'Agregar otro contacto';

  @override
  String get bsLinkType => 'Tipo de enlace de ubicación';

  @override
  String get bsSnackRequest => 'Por favor agrega contactos de emergencia';

  @override
  String get bsNeedPermission => 'No se pueden agregar contactos sin permiso';

  @override
  String get bsPartialContacts =>
      'Apple mostrará todos los contactos, no solo los compartidos con InstaSOS.\nPara compartir más contactos, abre la ';

  @override
  String get bsPartialContactsFix =>
      'Apple mostrará todos los contactos, no solo los compartidos con Insta-SOS.\nPara compartir más contactos, abre la ';

  @override
  String get bsNumError =>
      'Este contacto es privado o no tiene número de teléfono.';

  @override
  String get bsSOSOnOpen => 'SOS al abrir';

  @override
  String get bsSOSOnClose => 'SOS al cerrar';

  @override
  String get bsSOSOnCloseHint =>
      'Aparecerá un botón de cierre seguro (pulgar arriba) en la página de inicio, en el lado opuesto a la configuración.\nSi InstaSOS pierde el foco por cualquier motivo excepto el botón de cierre seguro (minimizado, cambio de aplicación, pantalla apagada), comenzará una transmisión SOS.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Aparecerá un botón de cierre seguro (pulgar arriba) en la página de inicio, en el lado opuesto a la configuración.\nSi Insta-SOS pierde el foco por cualquier motivo excepto el botón de cierre seguro (minimizado, cambio de aplicación, pantalla apagada), comenzará una transmisión SOS.';

  @override
  String get bsCloseOffWarning =>
      'La aplicación se cerrará automáticamente para evitar transmisiones involuntarias.';

  @override
  String get bsSOSOnVideo => 'SOS al interrumpir grabación';

  @override
  String get dsLadyLiberty =>
      'Una imagen de la Estatua de la Libertad, con una vista previa de la lista de derechos.';
}
