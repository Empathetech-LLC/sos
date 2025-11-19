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
  String get gReminder => 'Recordatorio';

  @override
  String get gNotAgain => 'No volver a mostrar';

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
  String get hsStartSOS => 'Activar para emitir señal SOS';

  @override
  String get hsEndSOS => 'SOS en transmisión. Activar para detener.';

  @override
  String get hsSafeCloseHint => 'Despejado. Cierra la app sin SOS.';

  @override
  String get hsAutoSOS => 'SOS automático';

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
  String get hsWelcome => 'Bienvenido a InstaSOS';

  @override
  String get hsAppTutorial =>
      'Comparte tu estado con contactos de emergencia durante una crisis.\n\nElige un contacto de emergencia.\nSolo uno por ahora, luego podrás añadir más';

  @override
  String get hsPermissionsTutorialTitle => 'Si quieres';

  @override
  String get hsPermissionsTutorial =>
      'InstaSOS también puede obtener y compartir evidencia.\n\nPara ello, pedirá acceso a la cámara, al micrófono y a la galería.';

  @override
  String get hsPermissionsAlways =>
      'Pon que siempre tenga acceso a tu ubicación.\nSolo se utilizará mientras SOS esté activo';

  @override
  String get hsBroadcastTutorial =>
      'Activa el SOS para enviar SMS automáticamente a tus contactos de emergencia.\n\nSi InstaSOS tiene acceso a tu ubicación, se incluirá en los mensajes.\n\nSeguirán enviándose SMS aunque el dispositivo esté bloqueado.\n\nDesactiva el SOS o cierra la aplicación para dejar de enviar mensajes.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activa el SOS para enviar SMS automáticamente a tus contactos de emergencia.\n\nSi InstaSOS tiene acceso a tu ubicación, se incluirá en los mensajes';

  @override
  String get hsSettingsTutorial =>
      'Puedes...\n\n- Añadir más contactos de emergencia\n- Configurar SMS automáticos\n- Cambiar el idioma y\n- editar la apariencia de la aplicación\n\nen las opciones.\n\nMantén pulsado el botón de opciones para enviar feedback.';

  @override
  String get hsVideoTutorial =>
      'Cuando tomes una foto o grabes un vídeo, podrás compartirlo al instante.\n\nPor defecto, si se interrumpe una grabación, SOS se activará automáticamente.\n\nMantén pulsada la vista previa central para mostrar una lista de tus derechos.';

  @override
  String get hsIOSVideoTutorial =>
      'Cuando tomes una foto o grabes un vídeo, podrás compartirlo al instante.\n\nMantén pulsada la vista previa central para mostrar una lista de tus derechos.';

  @override
  String get hsRightsTutorial =>
      'Si habilitas la cámara y tomas una foto o grabas un vídeo, podrás compartirlo al momento.\n\nPor defecto, si se interrumpe una grabación, SOS se activará automáticamente.\n\nMantén pulsado el mazo para mostrar una lista de tus derechos';

  @override
  String get hsIOSRightsTutorial =>
      'Si habilitas la cámara y tomas una foto o grabas un vídeo, podrás compartirlo al momento.\n\nMantén pulsado el mazo para mostrar una lista de tus derechos';

  @override
  String get hsNeedContacts =>
      'InstaSOS necesita acceso a tus contactos para funcionar bien.';

  @override
  String get hsPartialContacts =>
      'Apple mostrará todos los contactos, no solo aquellos compartidos con InstaSOS.\nPara compartir más contactos, vaya a Configuración de iOS -> Aplicaciones -> InstaSOS';

  @override
  String get hsNumError =>
      'El contacto es privado o no tiene número de teléfono.';

  @override
  String get rsSharedHeader => 'Tienes derecho a...';

  @override
  String get rsOnFoot => 'A pie';

  @override
  String get rsWhileDriving => 'Al volante';

  @override
  String get rsAtHome => 'En casa';

  @override
  String get rsSharedRemainSilent =>
      'Guarda silencio. No tienes que responder a ninguna pregunta, pero si dices algo, no mientas.';

  @override
  String get rsSharedDocument =>
      'Documéntalo todo. Tienes derecho a hacer fotos, grabar vídeos y audio.';

  @override
  String get rsMobilePockets =>
      'Niégate a que te registren los bolsillos. El ICE puede cachearte, pero no registrarte.';

  @override
  String get rsMobileQuestion =>
      'Haz preguntas, incluyendo por qué te han hecho detenerte.';

  @override
  String get rsMobileLeave => 'Salir si no estás detenido.';

  @override
  String get rsDriveSearch => 'Niégate a que registren tu vehículo.';

  @override
  String get rsDriveID =>
      'Si eres pasajero, niégate a proporcionar documentos de identificación. Solo la persona al volante está obligada a identificarse.';

  @override
  String get rsDriveWarrant =>
      'Pregunta si tienen una orden judicial. Tienes derecho a verla si la tienen. Una \"orden judicial\" solo es válida si está firmada por un juez.';

  @override
  String get rsHomeWarrant =>
      'No abras la puerta. Si tienen una orden judicial, pídeles que la pasen primero por debajo de la puerta. Una \"orden judicial\" solo es válida si está firmada por un juez. No abras la puerta.';

  @override
  String get rsSharedSign => 'Niégate a firmar cualquier cosa.';

  @override
  String get rsSharedFingerprint =>
      'Niégate a que el ICE tome tus huellas dactilares a menos que estés arrestado.';

  @override
  String get rsSharedLawyer =>
      'Consultar a un abogado. Si te han arrestado formalmente, tienes derecho a un abogado de oficio.';

  @override
  String get ssSOSOnOpen => 'SOS al abrirse';

  @override
  String get ssSOSOnClose => 'SOS al cerrar';

  @override
  String get ssSOSOnCloseHint =>
      'Cuando esté activada, aparecerá un botón de cierre seguro (pulgar hacia arriba) en la página principal, junto a la configuración. Si InstaSOS pierde el foco por cualquier motivo que no sea el botón de cierre seguro (minimización, cambio de aplicaciones, pantalla apagada), se iniciará una transmisión de SOS.';

  @override
  String get ssCloseOffWarning =>
      'La aplicación se cerrará automáticamente para evitar transmisiones accidentales.';

  @override
  String get ssVideoSOS => 'SOS al interrumpir la grabación';

  @override
  String get ssAutoShare => 'Compartir medios automáticamente';

  @override
  String get ssEMC => 'Contactos de emergencia';

  @override
  String get ssRemoveHint => 'Eliminar contacto';

  @override
  String get ssAddHint => 'Añadir otro contacto';

  @override
  String get ssLinkType => 'Tipo de enlace';

  @override
  String get ssAppearance => 'Apariencia';

  @override
  String get faqName => 'Preguntas Frecuentes';

  @override
  String get faqListQ => '¿Cómo se elaboró la lista de derechos?';

  @override
  String get faqListA1 =>
      'La lista de derechos fue recopilada de varias fuentes públicas, incluyendo:';

  @override
  String get faqListA2 => 'Otro recurso útil: ';

  @override
  String get faqSettings => '¿Qué función tienen los ajustes?';

  @override
  String get faqOnOpen =>
      'SOS al abrir: cuando está activado, se iniciará una transmisión de SOS inmediatamente al abrir la aplicación. No se recomienda para la mayoría de los usuarios, ya que podría causar transmisiones accidentales.';

  @override
  String get faqOnInterrupt =>
      'SOS al interrumpir grabación: cuando está activado, si hay una grabación de video activa e InstaSOS pasa a segundo plano por cualquier motivo (minimizada, cambio de aplicación, pantalla apagada), se iniciará una transmisión de SOS.\nSe recomienda activar esta opción o \"SOS al cerrar\" (o ambas).';

  @override
  String get faqAutoShare =>
      'Compartir medios automáticamente: cuando está activado, las opciones nativas para compartir aparecerán tan pronto como finalice un video o se tome una foto.';

  @override
  String get faqEMC =>
      'Contactos de emergencia: las personas a las que se enviará tu ubicación mientras una transmisión de SOS esté activa.';

  @override
  String get faqLink =>
      'Tipo de enlace: cómo se entregará tu ubicación a tus contactos de emergencia. \"Google Maps\", \"Apple Maps\" y \"Waze\" enviarán un enlace en el que se puede hacer clic para el servicio correspondiente. \"Coordenadas\" enviará tu latitud y longitud como texto sin formato.';

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
  String get faqPrivateContact =>
      '¿El contacto es privado o no tiene número de teléfono?';

  @override
  String get faqContactPermissions =>
      'Si recibes este mensaje al añadir un contacto de emergencia, InstaSOS no tiene permiso para acceder a ese contacto.';

  @override
  String get faqUpdateContacts =>
      'Puedes actualizar los permisos de contactos en los ';

  @override
  String get faqOSSettings => 'ajustes de iOS';

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
  String get faqResetSnack =>
      'El tutorial se reproducirá de nuevo en el próximo inicio.';

  @override
  String get faqOnCloseWarning =>
      '\"SOS al cerrar\" está habilitado. Esto iniciará una transmisión.';

  @override
  String get dsLadyLiberty =>
      'Una imagen de la Estatua de la Libertad, con una vista previa de la lista de derechos.';
}
