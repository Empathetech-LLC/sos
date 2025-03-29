// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LangEn extends Lang {
  LangEn([String locale = 'en']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get hsNeedContacts =>
      'SOS needs access to your contacts to function properly.';

  @override
  String get hsNeedLocation =>
      'SOS needs access to your location to function properly.';

  @override
  String get hsSOSHint => 'Start sharing location';

  @override
  String get hsSafeCloseHint => 'All clear\nClose the app without SOS';

  @override
  String get hsCameraHint => 'Take a photo';

  @override
  String get hsRecordHint => 'Record a video';

  @override
  String get hsBTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n- Change the app\'s appearance\n\n in the settings.';

  @override
  String get hsRTutorial =>
      'When you take a picture or finish a video, you will be asked to share it.\n\nIf a video is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'Contact does not have a phone number';

  @override
  String get ssSOSOnOpen => 'Auto SOS on open';

  @override
  String get ssSOSOnClose => 'Auto SOS on close';

  @override
  String get ssVideoSOS => 'Auto SOS on interrupted recording';

  @override
  String get ssEMC => 'Emergency contacts';
}
