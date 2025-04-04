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
  String get hsAppTutorial =>
      'It shares your status with emergency contacts in a moment of crisis.\n\nPlease choose an emergency contact.\nJust one for now, you can add more later.';

  @override
  String get hsPermissionsTutorialTitle => 'If you want';

  @override
  String get hsPermissionsTutorial =>
      'SOS can also share evidence.\n\nIt will ask for camera, microphone, gallery, and location access to do so.';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nIf SOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nEither deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSettingsTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n- Change the app\'s language, and\n- Update the app\'s appearance\n\nin the settings.\n\nHold the settings button to give feedback for the app.';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with a gavel that shows your rights.';

  @override
  String get hsRightsTutorial =>
      'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nHit the gavel to show a list of your rights.';

  @override
  String get hsNoNumber => 'El contacto no tiene un número de teléfono';

  @override
  String get rsSharedHeader => 'Tienes derecho a...';

  @override
  String get rsSharedRemainSilent =>
      'Permanecer en silencio. Algunos estados pueden requerir un nombre, pero eso es todo lo que pueden exigir. No mientas ni resistas el arresto, pero no tienes que responder preguntas.';

  @override
  String get rsSharedDoubleSilence =>
      'Permanecer en silencio sobre tu silencio. No tienes que justificarte.';

  @override
  String get rsSharedDocument =>
      'Documentar todo. Tienes derecho a tomar fotos, grabar videos y grabar audio.';

  @override
  String get rsWalkPockets =>
      'Negarse a una búsqueda de sus bolsillos. ICE puede hacer un registro superficial, pero no una búsqueda.';

  @override
  String get rsWalkLeave => 'Irse si no está bajo arresto.';

  @override
  String get rsDriveSearch => 'Negarse a una búsqueda de su automóvil.';

  @override
  String get rsDrivePockets =>
      'Negarse a una búsqueda de sus bolsillos. ICE puede hacer un registro superficial, pero no una búsqueda.';

  @override
  String get rsDriveID =>
      'Negarse a proporcionar identificación como pasajero. Solo el conductor está obligado a proporcionar identificación.';

  @override
  String get rsDriveQuestion =>
      'Hacer preguntas. Averigua por qué te están deteniendo.';

  @override
  String get rsDriveWarrant =>
      'Preguntar si los oficiales tienen una orden. Tienes derecho a verla si la tienen.';

  @override
  String get rsDriveLeave => 'Irse si no está bajo arresto.';

  @override
  String get rsHomeWarrant =>
      'Mantén la puerta cerrada. Si tienen una orden, pídeles que se la pasen por debajo de la puerta primero.';

  @override
  String get rsSharedFingerprint =>
      'Negarse a ser fichado por ICE a menos que esté bajo arresto.';

  @override
  String get rsSharedLawyer =>
      'Consultar a un abogado. Si has sido arrestado formalmente, tienes derecho a un abogado de oficio.';

  @override
  String get ssSOSOnOpen => 'SOS automático al abrir';

  @override
  String get ssSOSOnClose => 'SOS automático al cerrar';

  @override
  String get ssSOSOnCloseHint =>
      'Cuando está habilitado, se mostrará un botón de cierre seguro opuesto a la configuración.';

  @override
  String get ssVideoSOS => 'SOS automático en caso de grabación interrumpida';

  @override
  String get ssEMC => 'Contactos de emergencia';
}
