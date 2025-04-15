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
  String get sosNeedSMS =>
      'SOS necesita permiso de SMS para funcionar correctamente.';

  @override
  String get sosDisabled => 'No se puede acceder a la ubicación (desactivada)';

  @override
  String get sosDenied => 'No se puede acceder a la ubicación (denegada)';

  @override
  String get hsNeedContacts =>
      'SOS necesita acceso a tus contactos para funcionar correctamente.';

  @override
  String get hsSOSHint => 'Comenzar a compartir ubicación';

  @override
  String get hsSafeCloseHint => 'Todo claro\nCerrar la app sin activar SOS';

  @override
  String get hsCameraHint => 'Tomar una foto';

  @override
  String get hsRecordHint => 'Grabar un video';

  @override
  String get hsWelcome => 'Bienvenido a SOS';

  @override
  String get hsAppTutorial =>
      'Comparte tu estado con contactos de emergencia en un momento de crisis.\n\nPor favor elige un contacto de emergencia.\nSolo uno por ahora, podrás agregar más después.';

  @override
  String get hsPermissionsTutorialTitle => 'Si quieres';

  @override
  String get hsPermissionsTutorial =>
      'SOS también puede recopilar y compartir evidencia.\n\nPedirá acceso a la cámara, micrófono y galería para hacerlo.';

  @override
  String get hsBroadcastTutorial =>
      'Activa SOS para enviar mensajes automáticamente a tus contactos de emergencia.\n\nSi SOS tiene acceso a tu ubicación, esta se incluirá en los mensajes.\n\nLos mensajes continuarán incluso si el teléfono está bloqueado.\n\nDesactiva SOS o cierra completamente la app para detener los mensajes.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activa SOS para enviar mensajes automáticamente a tus contactos de emergencia.\n\nSi SOS tiene acceso a tu ubicación, esta se incluirá en los mensajes.';

  @override
  String get hsSettingsTutorial =>
      'Puedes...\n\n- Agregar más contactos de emergencia\n- Configurar SOS automático\n- Cambiar el idioma de la app, y\n- Actualizar la apariencia de la app\n\nen los ajustes.\n\nMantén presionado el botón de ajustes para enviar comentarios sobre la app.';

  @override
  String get hsVideoTutorial =>
      'Cuando tomes una foto o grabes un video, podrás compartirlo de inmediato.\n\nPor defecto, si una grabación se interrumpe, SOS se activará automáticamente.\n\nToca dos veces el centro de la vista previa para ver una lista de tus derechos.';

  @override
  String get hsIOSVideoTutorial =>
      'Cuando tomes una foto o grabes un video, podrás compartirlo de inmediato.\n\nToca dos veces el centro de la vista previa para ver una lista de tus derechos.';

  @override
  String get hsRightsTutorial =>
      'Si habilitas la cámara y tomas una foto o grabas un video, podrás compartirlo de inmediato.\n\nPor defecto, si una grabación se interrumpe, SOS se activará automáticamente.\n\nToca el mazo o toca dos veces el centro de la pantalla para ver una lista de tus derechos.';

  @override
  String get hsIOSRightsTutorial =>
      'Si habilitas la cámara y tomas una foto o grabas un video, podrás compartirlo de inmediato.\n\nToca el mazo o toca dos veces el centro de la pantalla para ver una lista de tus derechos.';

  @override
  String get hsNoNumber => 'El contacto debe tener un número de teléfono.';

  @override
  String get rsSharedHeader => 'Tienes derecho a...';

  @override
  String get rsSharedRemainSilent =>
      'Guardar silencio. No mientas, pero no tienes que responder preguntas.';

  @override
  String get rsSharedDocument =>
      'Documentar todo. Tienes derecho a tomar fotos, grabar videos y grabar audio.';

  @override
  String get rsWalkPockets =>
      'Negarte a que registren tus bolsillos. ICE puede hacer una revisión externa, pero no un registro.';

  @override
  String get rsWalkLeave => 'Irte si no estás bajo arresto.';

  @override
  String get rsDriveSearch => 'Negarte a que registren tu auto.';

  @override
  String get rsDrivePockets =>
      'Negarte a que registren tus bolsillos. ICE puede hacer una revisión externa, pero no un registro.';

  @override
  String get rsDriveID =>
      'Negarte a mostrar identificación como pasajero. Solo el conductor está obligado a mostrarla.';

  @override
  String get rsDriveQuestion =>
      'Hacer preguntas. Averigua por qué te detuvieron.';

  @override
  String get rsDriveWarrant =>
      'Preguntar si los agentes tienen una orden judicial. Tienes derecho a verla si la tienen. Si la \"orden\" no está firmada por un juez, no es válida.';

  @override
  String get rsDriveLeave => 'Irte si no estás bajo arresto.';

  @override
  String get rsHomeWarrant =>
      'Mantener la puerta cerrada. Si tienen una orden, pídeles que la pasen por debajo de la puerta. Si la \"orden\" no está firmada por un juez, no es válida. Mantén la puerta cerrada.';

  @override
  String get rsSharedFingerprint =>
      'Negarte a que ICE tome tus huellas digitales a menos que estés bajo arresto.';

  @override
  String get rsSharedLawyer =>
      'Consultar con un abogado. Si has sido arrestado formalmente, tienes derecho a un abogado designado por el tribunal.';

  @override
  String get ssSOSOnOpen => 'SOS automático al abrir';

  @override
  String get ssSOSOnClose => 'SOS automático al cerrar';

  @override
  String get ssSOSOnCloseHint =>
      'Cuando está activado, se mostrará un botón de cierre seguro frente al de ajustes.';

  @override
  String get ssVideoSOS => 'SOS automático si se interrumpe la grabación';

  @override
  String get ssEMC => 'Contactos de emergencia';

  @override
  String get ssRemoveHint => 'Eliminar contacto';

  @override
  String get ssAddHint => 'Agregar otro contacto';

  @override
  String get ssAppearance => 'Apariencia';
}
