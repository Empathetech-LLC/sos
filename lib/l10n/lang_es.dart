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
      'SOS necesita acceso a sus contactos para funcionar correctamente.';

  @override
  String get hsNeedLocation =>
      'SOS necesita acceso a su ubicación para funcionar correctamente.';

  @override
  String get hsSOSHint => 'Comience a compartir la ubicación';

  @override
  String get hsSafeCloseHint => 'Todo claro\nCierra la aplicación sin SOS';

  @override
  String get hsCameraHint => 'Tomar una foto';

  @override
  String get hsRecordHint => 'Grabar un video';

  @override
  String get hsWelcome => 'Welcome to SOS';

  @override
  String get hsATutorial =>
      'This app is designed to share your location with emergency contacts in a moment of crisis.\n\nPlease choose your first emergency contact.\nThey must have a phone number.\n\nJust one for now, you can add more later.';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Customize the SOS message\n- Enable automatic SOS\n- Change the app\'s appearance\n\nand more in the settings.\n\nHold the settings button to give feedback for the app.';

  @override
  String get hsRecTutorial =>
      'When you take a picture or record a video, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with one that shows you your rights.';

  @override
  String get hsRightTutorial =>
      'While the camera is disabled, you can still hide/show a list of your rights.\n\nIf you enable the camera, and take a picture or record a video, you will be asked to share it.\n\nIf a recording is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'El contacto no tiene un número de teléfono';

  @override
  String get rsGHeader => 'Tienes derecho a...';

  @override
  String get rsGFingerprint =>
      '- Negarse a ser fichado por ICE a menos que esté bajo arresto.';

  @override
  String get rsWLeave => '- Irse si no está bajo arresto.';

  @override
  String get rsCSearch => '- Negarse a una búsqueda de su automóvil.';

  @override
  String get rsCPockets =>
      '- Negarse a una búsqueda de sus bolsillos. ICE puede hacer un registro superficial, pero no una búsqueda.';

  @override
  String get rsCWarrant =>
      '- Preguntar si los oficiales tienen una orden. Tienes derecho a verla si la tienen.';

  @override
  String get rsCID =>
      '- Negarse a proporcionar identificación como pasajero. Solo el conductor está obligado a proporcionar identificación.';

  @override
  String get rsCQuestion =>
      '- Hacer preguntas. Averigua por qué te están deteniendo.';

  @override
  String get rsCLeave => '- Irse si no está bajo arresto.';

  @override
  String get rsCRemainSilent =>
      '- Permanecer en silencio. No tienes que responder a sus preguntas.\nNo puedes mentir o resistirte al arresto, pero no tienes que decirles nada.';

  @override
  String get rsHWarrant =>
      '- Mantén la puerta cerrada. Si tienen una orden, pídeles que se la pasen por debajo de la puerta primero.';

  @override
  String get ssSOSOnOpen => 'SOS automático al abrir';

  @override
  String get ssSOSOnClose => 'SOS automático al cerrar';

  @override
  String get ssVideoSOS => 'SOS automático en caso de grabación interrumpida';

  @override
  String get ssEMC => 'Contactos de emergencia';
}
