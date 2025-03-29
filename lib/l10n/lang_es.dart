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
  String get hsSOSHint => 'Comience a compartir la ubicación';

  @override
  String get hsSafeCloseHint => 'Todo claro\nCierra la aplicación sin SOS';

  @override
  String get hsCameraHint => 'Tomar una foto';

  @override
  String get hsRecordHint => 'Grabar un video';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Customize the SOS message\n- Enable automatic SOS\n- Change the app\'s appearance\n\nand more in the settings.';

  @override
  String get hsRTutorial =>
      'When you take a picture or finish a video, you will be asked to share it.\n\nIf a video is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'El contacto no tiene un número de teléfono';

  @override
  String get ssSOSOnOpen => 'SOS automático al abrir';

  @override
  String get ssSOSOnClose => 'SOS automático al cerrar';

  @override
  String get ssVideoSOS => 'SOS automático en caso de grabación interrumpida';

  @override
  String get ssSOSFrequency => 'Frecuencia SOS';

  @override
  String get ssSOSMessage => 'Mensaje SOS';

  @override
  String get ssEMC => 'Contactos de emergencia';
}
