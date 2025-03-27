// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LangEn extends Lang {
  LangEn([String locale = 'en']) : super(locale);

  @override
  String get hsSOSHint => 'Share location with EMC';

  @override
  String get hsSafeCloseHint =>
      'All clear\nClose the app without notifying EMC';

  @override
  String get hsCameraHint => 'Take a photo';

  @override
  String get hsRecordHint => 'Record a video';

  @override
  String get ssNotifyOnOpen => 'Notify EMC on open';

  @override
  String get ssNotifyOnClose => 'Notify EMC on close';

  @override
  String get ssNotifyOnSOS => 'SOS when recording is interrupted';
}
