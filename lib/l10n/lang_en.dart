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
  String get hsSOSHint => 'Share location with your EMC';

  @override
  String get hsSafeCloseHint =>
      'All clear\nClose the app without activating SOS';

  @override
  String get hsCameraHint => 'Take a photo';

  @override
  String get hsRecordHint => 'Record a video';

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
  String get hsNoNumber => 'Contact does not have a phone number';

  @override
  String get ssSOSOnOpen => 'Auto SOS on open';

  @override
  String get ssSOSOnClose => 'Auto SOS on close';

  @override
  String get ssVideoSOS => 'Auto SOS on interrupted recording';

  @override
  String get ssSOSFrequency => 'SOS Frequency';

  @override
  String get ssSOSMessage => 'SOS Message';

  @override
  String get ssEMC => 'Emergency contacts';
}
