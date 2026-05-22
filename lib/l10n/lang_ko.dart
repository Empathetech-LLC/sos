// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class LangKo extends Lang {
  LangKo([String locale = 'ko']) : super(locale);

  @override
  String get gOk => '확인';

  @override
  String get gDone => '완료';

  @override
  String get gReminder => '알림';

  @override
  String get gSystem => '시스템 설정';

  @override
  String get gNotAgain => '다시 보지 않기';

  @override
  String get gOnCloseWarning => '\"종료 시 SOS\"가 활성화되었습니다. 브로드캐스트가 시작됩니다.';

  @override
  String get sosLastKnown => '마지막으로 확인된 위치:';

  @override
  String get sosNeedSMS => 'SOS는 SMS(문자 메시지) 권한이 필요합니다.';

  @override
  String get sosDisabled => '위치에 액세스할 수 없음(비활성화됨)';

  @override
  String get sosDenied => '위치에 액세스할 수 없음(거부됨)';

  @override
  String get sosError => '위치에 액세스할 수 없음(오류)';

  @override
  String get hsWelcome => 'InstaSOS에 오신 것을 환영합니다';

  @override
  String get hsWelcomeFix => 'Insta-SOS에 오신 것을 환영합니다';

  @override
  String get hsAppIntro =>
      '시작하기 전에, 이 앱은 권리 고지(Know Your Rights) 앱입니다.\n아래 목록에서 권한을 부여하여 더 많은 도구를 활성화할 수 있습니다.';

  @override
  String get hsAppIntroAlt =>
      '최신 업데이트는 대규모 업데이트였습니다. 아래에서 모든 것이 준비되었는지 확인해 보세요.';

  @override
  String get hsYourApp => '언제든지 마음/권한을 변경할 수 있습니다.';

  @override
  String get hsHybridTranslation =>
      '튜토리얼과 설정은 기계 번역되었습니다.\n권리 목록은 사람이 직접 번역했습니다.';

  @override
  String get hsCamMic => '카메라 및 마이크';

  @override
  String get hsAddRecording => '비디오 녹화를 활성화합니다.';

  @override
  String get hsGallery => '갤러리';

  @override
  String get hsAddSave => '녹화물을 저장하는 데 필요합니다.';

  @override
  String get hsCameraReady => '카메라가 준비되었습니다';

  @override
  String get hsCameraSetupHint => '활성화하여 Insta-SOS에 카메라 권한을 부여하세요.';

  @override
  String get hsContacts => '연락처';

  @override
  String get hsAddContacts => '비상 연락처 알림 활성화 1단계.';

  @override
  String get hsAddContactsIOS => '비상 연락처 알림을 활성화합니다.';

  @override
  String get hsContactsReady => '연락처가 준비되었습니다';

  @override
  String get hsContactsSetupHint => '활성화하여 Insta-SOS에 연락처 보기 권한을 부여하세요.';

  @override
  String get hsAppleContacts =>
      '이 단계는 앱 권한만을 위한 것입니다.\n아직 비상 연락처를 선택하는 것이 아닙니다.\n\n문제를 줄이기 위해 모두 허용하는 것을 권장합니다.';

  @override
  String get hsTexting => '문자 메시지';

  @override
  String get hsAddTexting => '비상 연락처 알림 활성화 2단계.';

  @override
  String get hsTextingReady => '문자 메시지가 준비되었습니다';

  @override
  String get hsTextingSetupHint => '활성화하여 Insta-SOS에 메시지 전송 권한을 부여하세요.';

  @override
  String get hsLocation => '위치';

  @override
  String get hsUnable => '확인할 수 없음';

  @override
  String get hsAddLocation => '비상 연락처와 위치 공유를 활성화합니다.';

  @override
  String get hsAddAlways => '항상 허용을 권장합니다. 시스템 설정을 열려면 다시 누르세요.';

  @override
  String get hsLocationReady => '위치가 준비되었습니다';

  @override
  String get hsLocationSetupHint => '활성화하여 Insta-SOS에 위치 보기 권한을 부여하세요.';

  @override
  String get hsOneOfFour => '4개 중 첫 번째. 계속...';

  @override
  String get hsBroadcastTutorial =>
      'SOS를 활성화하면 비상 연락처에 자동으로 문자를 보냅니다.\n\nInstaSOS가 위치에 액세스할 수 있으면 문자에 위치가 포함됩니다.';

  @override
  String get hsBroadcastTutorialFix =>
      'SOS를 활성화하면 비상 연락처에 자동으로 문자를 보냅니다.\n\nInsta-SOS가 위치에 액세스할 수 있으면 문자에 위치가 포함됩니다.';

  @override
  String get hsBroadcastTutorialAndroid =>
      '휴대전화가 잠겨 있어도 문자는 계속 전송됩니다.\n\n문자 전송을 중지하려면 수동으로 SOS를 비활성화하거나 앱을 완전히 닫으세요.';

  @override
  String get hsTwoOfFour => '4개 중 두 번째. 계속...';

  @override
  String get hsSettingsTutorial =>
      '설정에서 다음을 수행할 수 있습니다.\n- SOS 브로드캐스트 구성\n- 앱의 모양 사용자 지정\n- 더 많은 리소스 및 지원 액세스';

  @override
  String get hsSettingsTutorialFix =>
      '설정에서 SOS 브로드캐스트를 구성하고, 앱의 모양을 사용자 지정하고, 더 많은 리소스/지원에 액세스할 수 있습니다.';

  @override
  String get hsThreeOfFour => '4개 중 세 번째. 계속...';

  @override
  String get hsVideoTutorial =>
      '사진을 찍거나 비디오를 녹화하면 바로 공유할 수 있습니다.\n\n기본적으로 녹화가 중단되면 SOS 브로드캐스트가 자동으로 시작됩니다.\n\n카메라 미리보기를 길게 눌러 권리를 표시하거나 숨길 수 있습니다.';

  @override
  String get hsIOSVideoTutorial =>
      '사진을 찍거나 비디오를 녹화하면 바로 공유할 수 있습니다.\n\n카메라 미리보기를 길게 눌러 권리를 표시하거나 숨길 수 있습니다.';

  @override
  String get hsTutorialComplete => '튜토리얼 완료';

  @override
  String get hsAddEMC => 'SOS 알림을 사용하는 경우 설정 페이지로 이동하여 비상 연락처를 추가하세요.';

  @override
  String get hsStartSOS => '활성화하여 SOS 브로드캐스트를 시작합니다.';

  @override
  String get hsEndSOS => 'SOS가 브로드캐스트 중입니다. 활성화하여 중지합니다.';

  @override
  String get hsSafeCloseHint => '모두 정상입니다. SOS 없이 앱을 닫습니다.';

  @override
  String get hsBroadcasting => '브로드캐스트 중';

  @override
  String get hsStop => '중지';

  @override
  String get hsCameraHint => '사진 찍기.';

  @override
  String get hsPreviewHint => '길게 눌러 권리를 표시/숨기기.';

  @override
  String get hsShowRights => '권리 표시하기.';

  @override
  String get hsHideRights => '권리 숨기기.';

  @override
  String get hsStartRecord => '비디오 녹화하기.';

  @override
  String get hsEndRecord => '녹화 종료하기.';

  @override
  String get hsFlashOff => '플래시 끄기. 자동 플래시를 켜려면 활성화하세요.';

  @override
  String get hsFlashAuto => '자동 플래시. 플래시를 켜려면 활성화하세요.';

  @override
  String get hsFlashOn => '플래시 켜기. 플래시를 끄려면 활성화하세요.';

  @override
  String get hsFlashTorch => '토치 모드. 플래시를 끄려면 활성화하세요.';

  @override
  String get hsNoFlash => '카메라 플래시가 작동하지 않음';

  @override
  String get rvSharedHeader => '여러분은 다음과 같은 권리를 가집니다.';

  @override
  String get rvOnFoot => '도보 이동 중';

  @override
  String get rvWhileDriving => '운전 중';

  @override
  String get rvAtHome => '집에 있을 때';

  @override
  String get rvSharedRemainSilent =>
      '침묵할 권리가 있습니다. 거짓말은 하지 마세요. 하지만 질문에 답할 필요는 없습니다.';

  @override
  String get rvSharedDocument =>
      '모든 상황을 기록하세요. 사진을 찍고, 영상을 촬영하고, 음성을 녹음할 권리가 있습니다.';

  @override
  String get rvMobilePockets =>
      '주머니 수색을 거부할 수 있습니다. ICE는 몸수색은 할 수 있지만, 주머니를 뒤질 수는 없습니다.';

  @override
  String get rvMobileQuestion => '질문하세요. 왜 멈춰 세웠는지 확인하세요.';

  @override
  String get rvMobileLeave => '구금된 상태가 아니라면 떠날 수 있습니다.';

  @override
  String get rvDriveSearch => '차량 수색을 거부할 수 있습니다.';

  @override
  String get rvDriveID => '승객이라면 신분증 제시를 거부할 수 있습니다. 신분증 제시는 운전자에게만 요구됩니다.';

  @override
  String get rvDriveWarrant =>
      '경찰관에게 영장이 있는지 물어보세요. 영장이 있다면 확인할 권리가 있습니다. 판사 서명이 없는 \"영장\"은 유효하지 않습니다.';

  @override
  String get rvHomeWarrant =>
      '문을 닫아두세요. 영장이 있다고 하면 먼저 문 아래로 넣어달라고 요청하세요. 판사 서명이 없는 \"영장\"은 유효하지 않습니다. 문은 계속 닫아두세요.';

  @override
  String get rvSharedSign => '어떤 서류에도 서명하지 않을 수 있습니다.';

  @override
  String get rvSharedFingerprint => '체포되지 않은 상태라면 ICE의 지문 채취를 거부할 수 있습니다.';

  @override
  String get rvSharedLawyer =>
      '변호사와 상담할 권리가 있습니다. 정식으로 체포된 경우에는 국선 변호인을 요청할 수 있습니다.';

  @override
  String get ssAutoShare => '사진/비디오 자동 공유';

  @override
  String get ssSOS => 'SOS 설정';

  @override
  String get ssAppearance => '모양 설정';

  @override
  String get ssPermissions => '권한';

  @override
  String get ssResources => '리소스';

  @override
  String get ssSupport => '지원';

  @override
  String get pmOnlyAdd => '이 도구는 권한을 추가하는 데만 도움이 됩니다.';

  @override
  String get pmRemoveIn => '다음에서 권한을 제거할 수 있습니다: ';

  @override
  String get pmManualPermission => '시스템 설정에서 권한을 제거한 경우, 해당 설정에서 다시 복원해야 합니다.';

  @override
  String get rmCommunity => '커뮤니티 리소스';

  @override
  String get rmGov => '미국 정부 리소스';

  @override
  String get rmAffiliate => '어느 곳도 Empathetech LLC와 제휴하지 않았습니다';

  @override
  String get rmAffiliateFix => '어느 곳도 Empathetic LLC와 제휴하지 않았습니다';

  @override
  String get faqName => '자주 묻는 질문(FAQ)';

  @override
  String get faqListQ => '권리 목록은 어떻게 만들어졌나요?';

  @override
  String get faqListA => '권리 목록은 다음을 포함한 여러 공개 리소스에서 가져왔습니다:';

  @override
  String get faqSettings => '설정은 어떻게 작동하나요?';

  @override
  String get faqAutoShareA =>
      ' 휴대폰에 내장된 공유 기능을 사용합니다. 저장된 비상 연락처(있는 경우)를 사용하지 않습니다. 공유는 선택 사항이며 언제든지 취소할 수 있습니다.';

  @override
  String get faqLinkA =>
      ' 비상 연락처에 위치가 전달되는 방식입니다. \"Google 지도\", \"Apple 지도\" 및 \"Waze\"는 해당 서비스의 클릭 가능한 링크를 보냅니다. \"좌표\"는 위도와 경도를 일반 텍스트로 보냅니다.';

  @override
  String get faqOnOpenA =>
      ' 앱 실행 시 즉시 SOS 브로드캐스트가 시작됩니다. 의도치 않은 브로드캐스트로 이어질 수 있으므로 대부분의 사용자에게는 권장하지 않습니다.';

  @override
  String get faqOnInterruptA =>
      ' 비디오가 녹화 중이고 InstaSOS가 포커스를 잃으면 SOS 브로드캐스트가 시작됩니다. 포커스 상실이란 앱 최소화, 앱 전환 및/또는 화면 잠금을 의미합니다. 이것 또는 \"종료 시 SOS\" 중 하나(또는 둘 다)를 활성화하는 것이 좋습니다.';

  @override
  String get faqOnInterruptAFix =>
      ' 비디오가 녹화 중이고 Insta-SOS가 포커스를 잃으면 SOS 브로드캐스트가 시작됩니다. 포커스 상실이란 앱 최소화, 앱 전환 및/또는 화면 잠금을 의미합니다. 이것 또는 \"종료 시 SOS\" 중 하나(또는 둘 다)를 활성화하는 것이 좋습니다.';

  @override
  String get faqUnavailable => 'SOS에서 \"위치를 사용할 수 없음\"이라고 표시되나요?';

  @override
  String get faqReliability => 'SOS의 신뢰성을 높이려면 다음 설정에서 \"항상 허용\"을 활성화하세요: ';

  @override
  String get faqLocationPermissions => '위치 권한';

  @override
  String get faqLocationTrust =>
      '앱은 SOS 브로드캐스트가 활성화된 동안에만 위치를 사용합니다. InstaSOS나 Empathetech LLC는 사용자 데이터를 추적, 저장 또는 판매하지 않습니다.';

  @override
  String get faqLocationTrustFix =>
      '앱은 SOS 브로드캐스트가 활성화된 동안에만 위치를 사용합니다. Insta-SOS나 Empathetic LLC는 사용자 데이터를 추적, 저장 또는 판매하지 않습니다.';

  @override
  String get faqContactPermissions =>
      '비상 연락처를 추가할 때 이 메시지가 표시되면 InstaSOS가 해당 연락처에 액세스할 권한이 없는 것입니다.';

  @override
  String get faqContactPermissionsFix =>
      '비상 연락처를 추가할 때 이 메시지가 표시되면 Insta-SOS가 해당 연락처에 액세스할 권한이 없는 것입니다.';

  @override
  String get faqUpdateContacts =>
      '다음 설정에서 더 많은(또는 모든) 연락처에 대한 액세스 권한을 부여할 수 있습니다: ';

  @override
  String get faqSplitClarity1 =>
      '연락처에 액세스 권한을 부여한다고 해서 비상 연락처가 되는 것은 아닙니다. 다음에 나열된 번호로만 ';

  @override
  String get faqSplitClarity2 => ' SOS 브로드캐스트 중에 연락이 갑니다.';

  @override
  String get faqMissing => '일부 Android 기능이 누락된 이유는 무엇인가요?';

  @override
  String get faqRestricted =>
      '누락된 기능은 SMS 자동화가 필요하며, Apple은 개발자가 (유료 서비스 없이는) 문자 메시지를 자동화하는 것을 허용하지 않습니다.';

  @override
  String get faqShortcuts =>
      'iOS 단축어는 어떤가요?\n사용자 단축어 액세스에도 제한이 있어 중요한 기능이 중단될 수 있습니다. 주로 비디오 녹화를 방해하게 됩니다.';

  @override
  String get faqLanguages => 'X 언어는 왜 지원되지 않나요?';

  @override
  String get faqResponsible =>
      '권리 목록에 기계 번역을 사용하는 것은 무책임한 일일 수 있습니다. 다음을 고려해 주세요: ';

  @override
  String get faqContributing => '번역 참여';

  @override
  String get faqExpand => ' 하여 언어 옵션을 확장하는 데 도움을 주실 수 있습니다.';

  @override
  String get faqReset => '튜토리얼 재설정';

  @override
  String get faqContact => '고객 지원 문의';

  @override
  String get faqContactHint => 'Empathetic LLC에 이메일 보내기';

  @override
  String get bsEMC => '비상 연락처';

  @override
  String get bsAddSomeone => 'SOS를 활성화하려면 사람을 추가하세요';

  @override
  String get bsRemoveHint => '연락처 제거';

  @override
  String get bsAddHint => '다른 연락처 추가';

  @override
  String get bsLinkType => '위치 링크 유형';

  @override
  String get bsSnackRequest => '비상 연락처를 추가해 주세요';

  @override
  String get bsNeedPermission => '권한 없이는 연락처를 추가할 수 없습니다';

  @override
  String get bsPartialContacts =>
      'Apple은 InstaSOS와 공유된 연락처만이 아니라 모든 연락처를 표시합니다.\n더 많은 연락처를 공유하려면 다음을 엽니다: ';

  @override
  String get bsPartialContactsFix =>
      'Apple은 Insta-SOS와 공유된 연락처만이 아니라 모든 연락처를 표시합니다.\n더 많은 연락처를 공유하려면 다음을 엽니다: ';

  @override
  String get bsNumError => '이 연락처는 비공개이거나 전화번호가 없습니다.';

  @override
  String get bsSOSOnOpen => '실행 시 SOS';

  @override
  String get bsSOSOnClose => '종료 시 SOS';

  @override
  String get bsSOSOnCloseHint =>
      '설정 반대편 홈 페이지에 안전 종료(엄지척) 버튼이 나타납니다.\n안전 종료 버튼을 누르는 것을 제외하고 InstaSOS가 포커스를 잃는 경우(최소화, 앱 전환, 화면 꺼짐) SOS 브로드캐스트가 시작됩니다.';

  @override
  String get bsSOSOnCloseHintFix =>
      '설정 반대편 홈 페이지에 안전 종료(엄지척) 버튼이 나타납니다.\n안전 종료 버튼을 누르는 것을 제외하고 Insta-SOS가 포커스를 잃는 경우(최소화, 앱 전환, 화면 꺼짐) SOS 브로드캐스트가 시작됩니다.';

  @override
  String get bsCloseOffWarning => '의도치 않은 브로드캐스트를 방지하기 위해 앱이 자동으로 닫힙니다.';

  @override
  String get bsSOSOnVideo => '녹화 중단 시 SOS';

  @override
  String get dsLadyLiberty => '자유의 여신상 사진 및 권리 목록 미리보기.';

  @override
  String get dsShowBack => '뒤로 가기 버튼을 표시할까요?';
}
