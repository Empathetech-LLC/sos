// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LangEs extends Lang {
  LangEs([String locale = 'es']) : super(locale);

  @override
  String get hsSOSHint => 'Compartir ubicación con el CME';

  @override
  String get hsSafeCloseHint =>
      'Todo claro\nCerrar la aplicación sin notificar al CME';

  @override
  String get hsCameraHint => 'Tomar una foto';

  @override
  String get hsRecordHint => 'Grabar un video';

  @override
  String get ssNotifyOnOpen => 'Notificar al CME al abrir';

  @override
  String get ssNotifyOnClose => 'Notificar al CME al cerrar';

  @override
  String get ssNotifyOnSOS => 'SOS cuando se interrumpe la grabación';
}
