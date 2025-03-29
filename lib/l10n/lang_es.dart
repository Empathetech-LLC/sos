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
  String get hsSOSHint => 'Compartir ubicación con tu CDE';

  @override
  String get hsSafeCloseHint =>
      'Todo claro\nCerrar la aplicación sin activar SOS';

  @override
  String get hsCameraHint => 'Tomar una foto';

  @override
  String get hsRecordHint => 'Grabar un video';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your EMC your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDe-activate SOS or fully close the app to stop broadcasting.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more EMC\n- Customize your SOS message\n- Set the app to auto-SOS\n- Update the appearance\n\nand more in the settings.';

  @override
  String get hsRTutorial =>
      'When you take a picture or finish a recording, it will auto-save to your gallery.\n\nYou can then share the file, and your location, with the native sharing options.\n\nBy default, if a video is interrupted, SOS will auto-activate.';

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
