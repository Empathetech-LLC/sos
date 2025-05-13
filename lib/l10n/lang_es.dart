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
  String get hsNoNumber => 'El contacto debe tener un número';

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
      'Guarda silencio. No tienes que responder a ninguna pregunta, pero si dices algo, no mientas';

  @override
  String get rsSharedDocument =>
      'Documéntalo todo. Tienes derecho a hacer fotos, grabar vídeos y audio';

  @override
  String get rsWalkPockets =>
      'Niégate a que te registren los bolsillos. El ICE puede cachearte, pero no registrarte';

  @override
  String get rsWalkLeave => 'Márchate si no estás arrestado';

  @override
  String get rsDriveSearch => 'Niégate a que registren tu vehículo';

  @override
  String get rsDrivePockets =>
      'Niégate a que te registren los bolsillos. El ICE puede cachearte, pero no registrarte';

  @override
  String get rsDriveID =>
      'Si eres pasajero, niégate a proporcionar documentos de identificación. Solo la persona al volante está obligada a identificarse';

  @override
  String get rsDriveQuestion =>
      'Haz preguntas, incluyendo por qué te han hecho detenerte';

  @override
  String get rsDriveWarrant =>
      'Pregunta si tienen una orden judicial. Tienes derecho a verla si la tienen. Una \"orden judicial\" solo es válida si está firmada por un juez';

  @override
  String get rsDriveLeave => 'Márchate si no estás arrestado';

  @override
  String get rsHomeWarrant =>
      'No abras la puerta. Si tienen una orden judicial, pídeles que la pasen primero por debajo de la puerta. Una \"orden judicial\" solo es válida si está firmada por un juez. No abras la puerta.';

  @override
  String get rsSharedFingerprint =>
      'Niégate a que el ICE tome tus huellas dactilares a menos que estés arrestado';

  @override
  String get rsSharedLawyer =>
      'Consultar a un abogado. Si te han arrestado formalmente, tienes derecho a un abogado de oficio';

  @override
  String get ssSOSOnOpen => 'SOS al abrirse';

  @override
  String get ssSOSOnClose => 'SOS al cerrarse';

  @override
  String get ssSOSOnCloseHint =>
      'Cuando esté activado, se mostrará un botón de cierre seguro al otro lado de la configuración';

  @override
  String get ssVideoSOS => 'SOS al interrumpir la grabación';

  @override
  String get ssEMC => 'Contactos de emergencia';

  @override
  String get ssRemoveHint => 'Eliminar contacto';

  @override
  String get ssAddHint => 'Añadir otro contacto';

  @override
  String get ssAppearance => 'Apariencia';
}
