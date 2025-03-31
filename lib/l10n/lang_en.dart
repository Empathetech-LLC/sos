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
  String get hsWelcome => 'Welcome to SOS';

  @override
  String get hsAppTutorial =>
      'This app is designed to share your location with emergency contacts in a moment of crisis.\n\nPlease choose your first emergency contact.\nThey must have a phone number.\n\nJust one for now, you can add more later.';

  @override
  String get hsCameraTutorial =>
      'SOS can also help share evidence.\n\nThe app will ask you for camera, microphone, and gallery access so it can take and save photos and videos.\n\nThis is recommended, but optional.';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to text your emergency contacts your exact location every minute.\n\nIt will continue when the phone is locked.\n\nDeactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsSettingsTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n& Change the app\'s appearance\n\n in the settings.\n\nHold the settings button to give feedback for the app.';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.\n\nWhile recording a video, the camera button will be replaced with one that shows you your rights.';

  @override
  String get hsRightsTutorial =>
      'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nIf a recording is interrupted, SOS will activate automatically.';

  @override
  String get hsNoNumber => 'Contact does not have a phone number';

  @override
  String get rsSharedHeader => 'You have the right to...';

  @override
  String get rsSharedFingerprint =>
      '- Refuse to be fingerprinted by ICE unless you are under arrest.';

  @override
  String get rsWalkLeave => '- Leave if you are not under arrest.';

  @override
  String get rsDriveSearch => '- Refuse a search of your car.';

  @override
  String get rsDrivePockets =>
      '- Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rsDriveWarrant =>
      '- Ask if the officers have a warrant. You have the right to see it if they do.';

  @override
  String get rsDriveID =>
      '- Refuse to provide ID as a passenger. Only the driver is required to provide ID';

  @override
  String get rsDriveQuestion =>
      '- Ask questions. Find out why you are being stopped.';

  @override
  String get rsDriveLeave => '- Leave if you are not under arrest.';

  @override
  String get rsDriveRemainSilent =>
      '- Remain silent. You do not have to answer of their questions.\nYou cannot lie or resist arrest, but you do not have to tell them anything.';

  @override
  String get rsHomeWarrant =>
      '- Keep you door shut. If they have a warrant, ask them to slip it under the door first.';

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
  String get ssVideoSOSHint =>
      'Enable for continuos texts, disable for a single text.';

  @override
  String get ssEMC => 'Emergency contacts';
}
