// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class LangJa extends Lang {
  LangJa([String locale = 'ja']) : super(locale);

  @override
  String get gOk => 'OK';

  @override
  String get gDone => '完了';

  @override
  String get gReminder => 'リマインダー';

  @override
  String get gSystem => 'システム設定';

  @override
  String get gNotAgain => '次回から表示しない';

  @override
  String get gOnCloseWarning => '「閉じる時にSOS」が有効になっています。これによりSOS発信が開始されます。';

  @override
  String get sosLastKnown => '最終確認位置:';

  @override
  String get sosNeedSMS => 'SOSにはSMS（テキストメッセージ）の権限が必要です。';

  @override
  String get sosDisabled => '位置情報にアクセスできません（無効）';

  @override
  String get sosDenied => '位置情報にアクセスできません（拒否）';

  @override
  String get sosError => '位置情報にアクセスできません（エラー）';

  @override
  String get hsWelcome => 'InstaSOSへようこそ';

  @override
  String get hsWelcomeFix => 'Insta-SOSへようこそ';

  @override
  String get hsAppIntro =>
      'はじめに、これは「自分の権利を知る」ためのアプリです。\n以下のリストで権限を付与することで、さらに多くのツールを有効にできます。';

  @override
  String get hsAppIntroAlt => '最新の大型アップデートがありました。以下で準備が整っているか確認しましょう。';

  @override
  String get hsYourApp => '権限はいつでも変更可能です。';

  @override
  String get hsHybridTranslation =>
      'チュートリアルと設定は機械翻訳されています。\n権利リストは人間によって翻訳されています。';

  @override
  String get hsCamera => 'カメラ';

  @override
  String get hsAddRecording => 'ビデオ録画を有効にします';

  @override
  String get hsMic => 'マイク';

  @override
  String get hsSilent => 'これがないとビデオは無音になります';

  @override
  String get hsGallery => 'ギャラリー';

  @override
  String get hsAddSave => '録画の保存に必要です';

  @override
  String get hsCameraReady => 'カメラの準備ができました';

  @override
  String get hsCameraSetupHint => '有効にしてInsta-SOSにカメラへのアクセスを許可します';

  @override
  String get hsCameraSnack => '上の設定でカメラを有効にしてから\nもう一度お試しください';

  @override
  String get hsContacts => '連絡先';

  @override
  String get hsAddContacts => 'SOSメッセージを有効にします';

  @override
  String get hsAppleContacts =>
      'この手順はアプリの権限設定のみです。\nまだ緊急連絡先を選択するわけではありません。\n\n面倒を避けるため、すべて許可することをお勧めします。';

  @override
  String get hsContactsSetupHint => '有効にしてInsta-SOSに連絡先へアクセスする許可を与えます。';

  @override
  String get hsSMS => 'Androidでは、誰にどのようにテキストを送信するかについて両方の許可が必要です';

  @override
  String get hsTextingSetupHint => '有効にしてInsta-SOSにメッセージを送信する許可を与えます。';

  @override
  String get hsSOSReady => 'SOSの準備ができました';

  @override
  String get hsLocation => '位置情報';

  @override
  String get hsAddLocation => 'SOSメッセージに位置情報を追加します';

  @override
  String get hsAddAlways => '「常に許可」にすることをお勧めします。もう一度押すとシステム設定が開きます。';

  @override
  String get hsLocationReady => '位置情報の準備ができました';

  @override
  String get hsLocationSetupHint => '有効にしてInsta-SOSに位置情報へアクセスする許可を与えます。';

  @override
  String get hsUnable => '特定できません';

  @override
  String get hsOneOfFour => '4つのうちの1つ目。次へ...';

  @override
  String get hsBroadcastTutorial =>
      'SOSを有効にすると、緊急連絡先に自動でメッセージが送信されます。\n\nInstaSOSが位置情報にアクセスできる場合、メッセージに位置情報が含まれます。';

  @override
  String get hsBroadcastTutorialFix =>
      'SOSを有効にすると、緊急連絡先に自動でメッセージが送信されます。\n\nInsta-SOSが位置情報にアクセスできる場合、メッセージに位置情報が含まれます。';

  @override
  String get hsBroadcastTutorialAndroid =>
      'スマートフォンがロックされていてもメッセージ送信は継続されます。\n\n送信を停止するには、手動でSOSを無効にするか、アプリを完全に閉じてください。';

  @override
  String get hsTwoOfFour => '4つのうちの2つ目。次へ...';

  @override
  String get hsSettingsTutorial =>
      '設定で以下のことができます：\n- SOS発信の設定\n- アプリの外観のカスタマイズ\n- その他のリソースやサポートへのアクセス';

  @override
  String get hsSettingsTutorialFix =>
      '設定から、SOS発信の設定、アプリの外観のカスタマイズ、その他のリソースやサポートへのアクセスが可能です。';

  @override
  String get hsThreeOfFour => '4つのうちの3つ目。次へ...';

  @override
  String get hsVideoTutorial =>
      '写真や動画を撮影すると、すぐに共有できます。\n\nデフォルトでは、録画が中断された場合、SOS発信が自動的に開始されます。\n\nカメラのプレビューを長押しすると、あなたの権利の表示/非表示を切り替えられます。';

  @override
  String get hsIOSVideoTutorial =>
      '写真や動画を撮影すると、すぐに共有できます。\n\nカメラのプレビューを長押しすると、あなたの権利の表示/非表示を切り替えられます。';

  @override
  String get hsTutorialComplete => 'チュートリアル完了';

  @override
  String get hsAddEMC => 'SOSアラートを使用する場合は、設定ページで緊急連絡先を追加してください。';

  @override
  String get hsStartSOS => '有効にしてSOS発信を開始します。';

  @override
  String get hsEndSOS => 'SOSを発信中です。有効にして停止します。';

  @override
  String get hsSafeCloseHint => '異常なし。SOSを発信せずにアプリを閉じます。';

  @override
  String get hsBroadcasting => '発信中';

  @override
  String get hsStop => '停止';

  @override
  String get hsCameraHint => '写真を撮ります。';

  @override
  String get hsPreviewHint => '長押しであなたの権利を表示/非表示にします。';

  @override
  String get hsShowRights => '権利を表示します。';

  @override
  String get hsHideRights => '権利を非表示にします。';

  @override
  String get hsStartRecord => '動画を録画します。';

  @override
  String get hsEndRecord => '録画を終了します。';

  @override
  String get hsFlashOff => 'フラッシュオフ。有効にしてオートフラッシュをオンにします。';

  @override
  String get hsFlashAuto => 'オートフラッシュ。有効にしてフラッシュをオンにします。';

  @override
  String get hsFlashOn => 'フラッシュオン。有効にしてフラッシュをオフにします。';

  @override
  String get hsFlashTorch => 'トーチモード。有効にしてフラッシュをオフにします。';

  @override
  String get hsNoFlash => 'カメラのフラッシュが機能していません';

  @override
  String get rvSharedHeader => 'あなたには以下の権利があります...';

  @override
  String get rvOnFoot => '徒歩中';

  @override
  String get rvWhileDriving => '運転中';

  @override
  String get rvAtHome => '自宅にいるとき';

  @override
  String get rvSharedRemainSilent => '黙秘する。嘘をつく必要はありませんが、質問に答える義務もありません。';

  @override
  String get rvSharedDocument => 'すべてを記録する。写真撮影、動画録画、音声録音を行う権利があります。';

  @override
  String get rvMobilePockets =>
      'ポケットの捜索を拒否する。ICEはボディチェックはできますが、ポケットの中を捜索することはできません。';

  @override
  String get rvMobileQuestion => '質問する。なぜ停止させられているのか確認しましょう。';

  @override
  String get rvMobileLeave => '拘束されていない場合は立ち去ることができます。';

  @override
  String get rvDriveSearch => '車の捜索を拒否する。';

  @override
  String get rvDriveID => '同乗者としてIDの提示を拒否する。IDの提示が義務付けられているのは運転者のみです。';

  @override
  String get rvDriveWarrant =>
      '令状を持っているか確認する。持っている場合は提示を求める権利があります。裁判官の署名がない「令状」は無効です。';

  @override
  String get rvHomeWarrant =>
      'ドアを閉めたままにする。令状がある場合は、先にドアの下から滑り込ませるよう求めてください。裁判官の署名がない「令状」は無効です。ドアは閉めたままにしてください。';

  @override
  String get rvSharedSign => '何にも署名しない。';

  @override
  String get rvSharedFingerprint => '逮捕されていない限り、ICEによる指紋採取を拒否する。';

  @override
  String get rvSharedLawyer => '弁護士に相談する。正式に逮捕された場合、国選弁護人が付く権利があります。';

  @override
  String get ssAutoShare => '写真/動画の自動共有';

  @override
  String get ssSOS => 'SOS設定';

  @override
  String get ssAppearance => '外観設定';

  @override
  String get ssPermissions => '権限';

  @override
  String get ssResources => 'リソース';

  @override
  String get ssSupport => 'サポート';

  @override
  String get pmOnlyAdd => 'このツールは権限の追加のみをサポートします。';

  @override
  String get pmRemoveIn => '権限を削除するには、次の場所で行えます： ';

  @override
  String get pmManualPermission => 'システム設定で権限を削除した場合、復元する際もシステム設定で行う必要があります。';

  @override
  String get rmCommunity => 'コミュニティリソース';

  @override
  String get rmGov => '米国政府のリソース';

  @override
  String get rmAffiliate => 'いずれもYWTとは提携していません';

  @override
  String get faqName => 'よくある質問 (FAQ)';

  @override
  String get faqListQ => '権利リストはどのように作成されましたか？';

  @override
  String get faqListA => '権利リストは、以下を含むいくつかの公開リソースから引用されました：';

  @override
  String get faqSettings => '設定はどのように機能しますか？';

  @override
  String get faqAutoShareA =>
      ' はスマートフォンの組み込みの共有機能を使用します。保存された緊急連絡先（ある場合）は使用しません。共有は任意であり、いつでもキャンセルできます。';

  @override
  String get faqLinkA =>
      ' は、緊急連絡先に位置情報を送信する方法です。「Googleマップ」、「Appleマップ」、「Waze」は、各サービスのクリック可能なリンクを送信します。「座標」は、緯度と経度をプレーンテキストで送信します。';

  @override
  String get faqOnOpenA =>
      ' アプリの起動時に即座にSOS発信が開始されます。誤発信につながる可能性があるため、ほとんどのユーザーには推奨されません。';

  @override
  String get faqOnInterruptA =>
      ' 動画の録画中にInstaSOSがフォーカスを失うと、SOS発信が開始されます。フォーカスを失うとは、アプリの最小化、アプリの切り替え、画面のロックなどを指します。これか「閉じる時にSOS」のいずれか（または両方）を有効にすることをお勧めします。';

  @override
  String get faqOnInterruptAFix =>
      ' 動画の録画中にInsta-SOSがフォーカスを失うと、SOS発信が開始されます。フォーカスを失うとは、アプリの最小化、アプリの切り替え、画面のロックなどを指します。これか「閉じる時にSOS」のいずれか（または両方）を有効にすることをお勧めします。';

  @override
  String get faqUnavailable => 'SOSで「位置情報が利用できません」と表示されますか？';

  @override
  String get faqReliability => 'SOSの信頼性を向上させるには、次の場所で「常に許可」を有効にしてください： ';

  @override
  String get faqLocationPermissions => '位置情報の権限';

  @override
  String get faqLocationTrust =>
      'このアプリは、SOS発信がアクティブな間のみ位置情報を使用します。InstaSOSもYWTも、ユーザーデータの追跡、保存、販売は行いません。';

  @override
  String get faqLocationTrustFix =>
      'このアプリは、SOS発信がアクティブな間のみ位置情報を使用します。Insta-SOSもYWTも、ユーザーデータの追跡、保存、販売は行いません。';

  @override
  String get faqContactPermissions =>
      '緊急連絡先の追加時にこのメッセージが表示される場合、InstaSOSにはその特定の連絡先にアクセスする権限がありません。';

  @override
  String get faqContactPermissionsFix =>
      '緊急連絡先の追加時にこのメッセージが表示される場合、Insta-SOSにはその特定の連絡先にアクセスする権限がありません。';

  @override
  String get faqUpdateContacts => '次の場所で、さらに多く（またはすべて）の連絡先へのアクセスを許可できます： ';

  @override
  String get faqSplitClarity1 =>
      '連絡先へのアクセスを許可しても、その人が緊急連絡先になるわけではありません。次の場所に記載された番号のみが';

  @override
  String get faqSplitClarity2 => ' SOS発信中に連絡されます。';

  @override
  String get faqMissing => '一部のAndroid機能が不足しているのはなぜですか？';

  @override
  String get faqRestricted =>
      '不足している機能にはSMSの自動化が必要ですが、Appleは開発者が（有料サービスなしで）テキストメッセージを自動化することを許可していません。';

  @override
  String get faqShortcuts =>
      'iOSショートカットについてはどうですか？\nユーザーショートカットへのアクセスにも制限があり、重要な機能が損なわれるためです。主に、動画の録画が中断されるという問題があります。';

  @override
  String get faqLanguages => 'X言語が利用できないのはなぜですか？';

  @override
  String get faqResponsible => '権利リストに機械翻訳を使用するのは無責任であると考えます。以下のことをご検討ください： ';

  @override
  String get faqContributing => '翻訳への貢献';

  @override
  String get faqExpand => ' （言語オプションを増やすためのご協力をお願いします。）';

  @override
  String get faqReset => 'チュートリアルをリセット';

  @override
  String get faqContact => 'サポートに連絡';

  @override
  String get faqContactHint => 'YWTにメールを送信';

  @override
  String get bsEMC => '緊急連絡先';

  @override
  String get bsAddSomeone => '追加してSOSを有効にする';

  @override
  String get bsRemoveHint => '連絡先を削除';

  @override
  String get bsAddHint => '別の連絡先を追加';

  @override
  String get bsLinkType => '位置情報リンクのタイプ';

  @override
  String get bsSnackRequest => '緊急連絡先を追加してください';

  @override
  String get bsNeedPermission => '権限がないと連絡先を追加できません';

  @override
  String get bsPartialContacts =>
      'AppleではInstaSOSと共有されている連絡先だけでなく、すべての連絡先が表示されます。\nさらに多くの連絡先を共有するには、次を開いてください： ';

  @override
  String get bsPartialContactsFix =>
      'AppleではInsta-SOSと共有されている連絡先だけでなく、すべての連絡先が表示されます。\nさらに多くの連絡先を共有するには、次を開いてください： ';

  @override
  String get bsNumError => 'この連絡先は非公開であるか、電話番号がありません。';

  @override
  String get bsSOSOnOpen => '開く時にSOS';

  @override
  String get bsSOSOnClose => '閉じる時にSOS';

  @override
  String get bsSOSOnCloseHint =>
      'ホーム画面の設定の反対側に、安全な終了（親指を立てたマーク）ボタンが表示されます。\n安全な終了ボタンを使用せずにInstaSOSがフォーカスを失った場合（最小化、アプリ切り替え、画面オフなど）、SOS発信が開始されます。';

  @override
  String get bsSOSOnCloseHintFix =>
      'ホーム画面の設定の反対側に、安全な終了（親指を立てたマーク）ボタンが表示されます。\n安全な終了ボタンを使用せずにInsta-SOSがフォーカスを失った場合（最小化、アプリ切り替え、画面オフなど）、SOS発信が開始されます。';

  @override
  String get bsCloseOffWarning => '意図しない発信を防ぐため、アプリは自動的に閉じます。';

  @override
  String get bsSOSOnVideo => '録画中断時にSOS';

  @override
  String get dsLadyLiberty => '自由の女神の写真と、権利リストのプレビュー。';
}
