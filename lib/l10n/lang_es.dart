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
  String get rsSharedHeader => 'You have the right to...';

  @override
  String get rsSharedRemainSilent =>
      'Remain silent. Do not lie, but you don\'t have to answer questions.';

  @override
  String get rsSharedDocument =>
      'Document everything. You have the right to take pictures, record videos, and record audio.';

  @override
  String get rsWalkPockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rsWalkLeave => 'Leave if you are not under arrest.';

  @override
  String get rsDriveSearch => 'Refuse a search of your car.';

  @override
  String get rsDrivePockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rsDriveID =>
      'Refuse to provide ID as a passenger. Only the driver is required to provide ID.';

  @override
  String get rsDriveQuestion =>
      'Ask questions. Find out why you are being stopped.';

  @override
  String get rsDriveWarrant =>
      'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.';

  @override
  String get rsDriveLeave => 'Leave if you are not under arrest.';

  @override
  String get rsHomeWarrant =>
      'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.';

  @override
  String get rsSharedFingerprint =>
      'Refuse to be fingerprinted by ICE unless you are under arrest.';

  @override
  String get rsSharedLawyer =>
      'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.';

  @override
  String get sosDisabled => 'Cannot access location (disabled)';

  @override
  String get sosDenied => 'Cannot access location (denied)';

  @override
  String get ssSOSOnOpen => 'Auto SOS on open';

  @override
  String get ssSOSOnClose => 'Auto SOS on close';

  @override
  String get ssSOSOnCloseHint =>
      'When enabled, a safe close button will be shown opposite the settings.';

  @override
  String get ssVideoSOS => 'Auto SOS on interrupted recording';

  @override
  String get ssEMC => 'Emergency contacts';

  @override
  String get ssRemoveHint => 'Remove contact';

  @override
  String get ssAddHint => 'Add another contact';

  @override
  String get ssAppearance => 'Appearance';
}
