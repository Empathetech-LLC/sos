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
  String get sosNeedSMS => 'SOS needs SMS permission to function properly.';

  @override
  String get sosDisabled => 'Cannot access location (disabled)';

  @override
  String get sosDenied => 'Cannot access location (denied)';

  @override
  String get hsSOSHint => 'Start sharing location';

  @override
  String get hsSafeCloseHint => 'All clear\nClose the app without SOS';

  @override
  String get hsCameraHint => 'Take a photo';

  @override
  String get hsRecordHint => 'Record a video';

  @override
  String get hsFlashOff => 'Flash Off. Activate to turn on auto flash.';

  @override
  String get hsFlashAuto => 'Auto flash. Activate to turn flash on.';

  @override
  String get hsFlashOn => 'Flash on. Activate to turn flash off.';

  @override
  String get hsFlashTorch => 'Torch mode. Activate to turn flash off.';

  @override
  String get hsWelcome => 'Welcome to InstaSOS';

  @override
  String get hsAppTutorial =>
      'It shares your status with emergency contacts in a moment of crisis.\n\nPlease choose an emergency contact.\nJust one for now, you can add more later.';

  @override
  String get hsPermissionsTutorialTitle => 'If you want';

  @override
  String get hsPermissionsTutorial =>
      'InstaSOS can also gather and share evidence.\n\nIt will ask for camera, microphone, and gallery access to do so.';

  @override
  String get hsBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nIf InstaSOS has access to your location, it will be included in the texts.\n\nThe texts will continue when the phone is locked.\n\nEither deactivate SOS or fully close the app to stop the texts.';

  @override
  String get hsIOSBroadcastTutorial =>
      'Activate SOS to automatically text your emergency contacts.\n\nIf InstaSOS has access to your location, it will be included in the texts.';

  @override
  String get hsSettingsTutorial =>
      'You can...\n\n- Add more emergency contacts\n- Setup automatic SOS\n- Change the app\'s language, and\n- Update the app\'s appearance\n\nin the settings.\n\nHold the settings button to give feedback for the app.';

  @override
  String get hsVideoTutorial =>
      'When you take a picture or record a video, you will be able to share it right away.\n\nBy default, if a recording is interrupted, SOS will activate automatically.\n\nDouble tap the center preview to show a list of your rights.';

  @override
  String get hsIOSVideoTutorial =>
      'When you take a picture or record a video, you will be able to share it right away.\n\nDouble tap the center preview to show a list of your rights.';

  @override
  String get hsRightsTutorial =>
      'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nBy default, if a recording is interrupted, SOS will activate automatically.\n\nHit the gavel or double tap the center of the screen to show a list of your rights.';

  @override
  String get hsIOSRightsTutorial =>
      'If you enable the camera, and take a picture or record a video, you will be able to share it right away.\n\nHit the gavel or double tap the center of the screen to show a list of your rights.';

  @override
  String get hsNeedContacts =>
      'InstaSOS needs access to your contacts to function properly.';

  @override
  String get hsNoNumber => 'The contact must have a phone number.';

  @override
  String get rsSharedHeader => 'You have the right to...';

  @override
  String get rsSharedRemainSilent =>
      'Remain silent. Do not lie, but you don\'t have to answer questions.';

  @override
  String get rsSharedDocument =>
      'Document everything. You have the right to take pictures, record videos, and record audio.';

  @override
  String get rsWalkPockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rsWalkLeave => 'Leave if you are not under arrest.';

  @override
  String get rsDriveSearch => 'Refuse a search of your car.';

  @override
  String get rsDrivePockets =>
      'Refuse a search of your pockets. ICE can give a pat-down, but not a search.';

  @override
  String get rsDriveID =>
      'Refuse to provide ID as a passenger. Only the driver is required to provide ID.';

  @override
  String get rsDriveQuestion =>
      'Ask questions. Find out why you are being stopped.';

  @override
  String get rsDriveWarrant =>
      'Ask if the officers have a warrant. You have the right to see it if they do. If a \"warrant\" is not signed by a judge, it\'s not valid.';

  @override
  String get rsDriveLeave => 'Leave if you are not under arrest.';

  @override
  String get rsHomeWarrant =>
      'Keep you door shut. If they have a warrant, ask them to slip it under the door first. If a \"warrant\" is not signed by a judge, it\'s not valid. Keep your door shut.';

  @override
  String get rsSharedFingerprint =>
      'Refuse to be fingerprinted by ICE unless you are under arrest.';

  @override
  String get rsSharedLawyer =>
      'To consult a lawyer. If you have been formally arrested, your are entitled to a court appointed lawyer.';

  @override
  String get ssSOSOnOpen => 'SOS on open';

  @override
  String get ssSOSOnClose => 'SOS on close';

  @override
  String get ssSOSOnCloseHint =>
      'When enabled, a safe close button will be shown opposite the settings.';

  @override
  String get ssVideoSOS => 'SOS on interrupted recording';

  @override
  String get ssEMC => 'Emergency contacts';

  @override
  String get ssRemoveHint => 'Remove contact';

  @override
  String get ssAddHint => 'Add another contact';

  @override
  String get ssAppearance => 'Appearance';
}
