// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LangFr extends Lang {
  LangFr([String locale = 'fr']) : super(locale);

  @override
  String get hsSOSHint => 'Partager la position avec le CME';

  @override
  String get hsSafeCloseHint =>
      'Tout est clair\nFermer l\'application sans avertir le CME';

  @override
  String get hsCameraHint => 'Prendre une photo';

  @override
  String get hsRecordHint => 'Enregistrer une vidéo';

  @override
  String get ssNotifyOnOpen => 'Notifier le CME à l\'ouverture';

  @override
  String get ssNotifyOnClose => 'Notifier le CME à la fermeture';

  @override
  String get ssNotifyOnSOS => 'SOS lorsque l\'enregistrement est interrompu';
}
