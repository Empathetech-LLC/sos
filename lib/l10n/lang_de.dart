// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'lang.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LangDe extends Lang {
  LangDe([String locale = 'de']) : super(locale);

  @override
  String get gOk => 'Ok';

  @override
  String get gDone => 'Fertig';

  @override
  String get gReminder => 'Erinnerung';

  @override
  String get gSystem => 'Systemeinstellungen';

  @override
  String get gNotAgain => 'Nicht mehr anzeigen';

  @override
  String get gOnCloseWarning =>
      '\"SOS beim Schließen\" ist aktiviert. Dies startet einen Notruf.';

  @override
  String get sosLastKnown => 'Letzter bekannter Standort:';

  @override
  String get sosNeedSMS => 'SOS benötigt SMS-Berechtigung.';

  @override
  String get sosDisabled => 'Kein Zugriff auf Standort (deaktiviert)';

  @override
  String get sosDenied => 'Kein Zugriff auf Standort (abgelehnt)';

  @override
  String get sosError => 'Kein Zugriff auf Standort (Fehler)';

  @override
  String get hsWelcome => 'Willkommen bei InstaSOS';

  @override
  String get hsWelcomeFix => 'Willkommen bei Insta-SOS';

  @override
  String get hsAppIntro =>
      'Zu Beginn: Dies ist nur eine App zum Kennen deiner Rechte.\nDu kannst weitere Tools aktivieren, indem du ihnen in der Liste unten die Berechtigung erteilst.';

  @override
  String get hsAppIntroAlt =>
      'Das letzte Update war umfangreich, lass uns unten sicherstellen, dass alles bereit ist.';

  @override
  String get hsYourApp =>
      'Du kannst deine Meinung/Berechtigungen jederzeit ändern.';

  @override
  String get hsHybridTranslation =>
      'Das Tutorial und die Einstellungen sind maschinell übersetzt.\nDie Rechte-Liste ist menschlich übersetzt.';

  @override
  String get hsCamera => 'Kamera';

  @override
  String get hsAddRecording => 'Ermöglicht Videoaufnahmen';

  @override
  String get hsMic => 'Mikrofon';

  @override
  String get hsSilent => 'Ohne dies sind die Videos stumm';

  @override
  String get hsGallery => 'Galerie';

  @override
  String get hsAddSave => 'Erforderlich, um Ihre Aufnahmen zu speichern';

  @override
  String get hsCameraReady => 'Kamera ist bereit';

  @override
  String get hsCameraSetupHint =>
      'Aktivieren, um Insta-SOS die Berechtigung für die Kamera zu erteilen';

  @override
  String get hsCameraSnack =>
      'Bitte aktivieren Sie die Kamera in den Einstellungen (oben)\nund versuchen Sie es dann erneut';

  @override
  String get hsContacts => 'Kontakte';

  @override
  String get hsAddContacts => 'Ermöglicht SOS-Nachrichten';

  @override
  String get hsAppleContacts =>
      'Dieser Schritt betrifft nur App-Berechtigungen.\nSie wählen noch keine Notfallkontakte aus.\n\nEs wird empfohlen, alle zuzulassen, um Probleme zu vermeiden.';

  @override
  String get hsContactsSetupHint =>
      'Aktivieren, um Insta-SOS die Berechtigung zum Anzeigen Ihrer Kontakte zu erteilen.';

  @override
  String get hsSMS =>
      'Android erfordert die Berechtigung sowohl dafür, wem als auch wie Nachrichten gesendet werden';

  @override
  String get hsTextingSetupHint =>
      'Aktivieren, um Insta-SOS die Berechtigung zum Senden von Nachrichten zu erteilen.';

  @override
  String get hsSOSReady => 'SOS ist bereit';

  @override
  String get hsLocation => 'Standort';

  @override
  String get hsAddLocation => 'Fügt Ihren Standort zu SOS-Nachrichten hinzu';

  @override
  String get hsAddAlways =>
      'Es wird empfohlen, dies immer zu aktivieren. Erneut drücken, um die Systemeinstellungen zu öffnen.';

  @override
  String get hsLocationReady => 'Standort ist bereit';

  @override
  String get hsLocationSetupHint =>
      'Aktivieren, um Insta-SOS die Berechtigung zum Anzeigen Ihres Standorts zu erteilen.';

  @override
  String get hsUnable => 'Kann nicht ermittelt werden';

  @override
  String get hsOneOfFour => 'Erster von vier Schritten. Weiter...';

  @override
  String get hsBroadcastTutorial =>
      'Aktiviere SOS, um deinen Notfallkontakten automatisch eine SMS zu senden.\n\nWenn InstaSOS Zugriff auf deinen Standort hat, wird dieser in die SMS aufgenommen.';

  @override
  String get hsBroadcastTutorialFix =>
      'Aktiviere SOS, um deinen Notfallkontakten automatisch eine SMS zu senden.\n\nWenn Insta-SOS Zugriff auf deinen Standort hat, wird dieser in die SMS aufgenommen.';

  @override
  String get hsBroadcastTutorialAndroid =>
      'Die SMS werden weiterhin gesendet, wenn das Telefon gesperrt ist.\n\nDeaktiviere SOS manuell oder schließe die App vollständig, um die SMS zu stoppen.';

  @override
  String get hsTwoOfFour => 'Zweiter von vier Schritten. Weiter...';

  @override
  String get hsSettingsTutorial =>
      '- Konfiguriere deinen SOS-Notruf\n- Passe das Aussehen der App an\n- Greife auf weitere Ressourcen und Support zu\n\nin den Einstellungen.';

  @override
  String get hsSettingsTutorialFix =>
      'Du kannst deinen SOS-Notruf konfigurieren, das Aussehen der App anpassen und auf weitere Ressourcen/Support in den Einstellungen zugreifen.';

  @override
  String get hsThreeOfFour => 'Dritter von vier Schritten. Weiter...';

  @override
  String get hsVideoTutorial =>
      'Wenn du ein Foto oder Video aufnimmst, kannst du es sofort teilen.\n\nWenn eine Aufnahme unterbrochen wird, startet standardmäßig automatisch ein SOS-Notruf.\n\nHalte die Kameravorschau gedrückt, um deine Rechte ein-/auszublenden.';

  @override
  String get hsIOSVideoTutorial =>
      'Wenn du ein Foto oder Video aufnimmst, kannst du es sofort teilen.\n\nHalte die Kameravorschau gedrückt, um deine Rechte ein-/auszublenden.';

  @override
  String get hsTutorialComplete => 'Tutorial abgeschlossen';

  @override
  String get hsAddEMC =>
      'Wenn du SOS-Warnungen verwendest, gehe bitte zu den Einstellungen und füge deine Notfallkontakte hinzu.';

  @override
  String get hsStartSOS => 'Aktivieren, um den SOS-Notruf zu starten.';

  @override
  String get hsEndSOS => 'SOS wird gesendet. Aktivieren, um zu stoppen.';

  @override
  String get hsSafeCloseHint => 'Alles in Ordnung. App ohne SOS schließen.';

  @override
  String get hsBroadcasting => 'Senden läuft';

  @override
  String get hsStop => 'Stopp';

  @override
  String get hsCameraHint => 'Mache ein Foto.';

  @override
  String get hsPreviewHint =>
      'Gedrückt halten, um deine Rechte ein-/auszublenden.';

  @override
  String get hsShowRights => 'Zeige deine Rechte.';

  @override
  String get hsHideRights => 'Verberge deine Rechte.';

  @override
  String get hsStartRecord => 'Ein Video aufnehmen.';

  @override
  String get hsEndRecord => 'Die Aufnahme beenden.';

  @override
  String get hsFlashOff =>
      'Blitz aus. Aktivieren, um den Auto-Blitz einzuschalten.';

  @override
  String get hsFlashAuto =>
      'Auto-Blitz. Aktivieren, um den Blitz einzuschalten.';

  @override
  String get hsFlashOn => 'Blitz an. Aktivieren, um den Blitz auszuschalten.';

  @override
  String get hsFlashTorch =>
      'Taschenlampe. Aktivieren, um den Blitz auszuschalten.';

  @override
  String get hsNoFlash => 'Kamerablitz funktioniert nicht';

  @override
  String get rvSharedHeader => 'Sie haben das Recht, ...';

  @override
  String get rvOnFoot => 'Zu Fuß';

  @override
  String get rvWhileDriving => 'Beim Fahren';

  @override
  String get rvAtHome => 'Zuhause';

  @override
  String get rvSharedRemainSilent =>
      'Zu schweigen. Sie dürfen nicht lügen, müssen aber keine Fragen beantworten.';

  @override
  String get rvSharedDocument =>
      'Alles zu dokumentieren. Sie haben das Recht, Fotos zu machen, Videos aufzunehmen und Tonaufnahmen zu erstellen.';

  @override
  String get rvMobilePockets =>
      'Die Durchsuchung Ihrer Taschen zu verweigern. Die ICE-Beamten dürfen Sie abtasten, aber nicht durchsuchen.';

  @override
  String get rvMobileQuestion =>
      'Fragen zu stellen. Finden Sie heraus, warum Sie angehalten werden.';

  @override
  String get rvMobileLeave =>
      'Sich zu entfernen, wenn Sie nicht festgesetzt werden';

  @override
  String get rvDriveSearch => 'Die Durchsuchung Ihres Fahrzeugs zu verhindern.';

  @override
  String get rvDriveID =>
      'Sich zu weigern, als Fahrgast einen Ausweis vorzulegen. Nur der Fahrer ist verpflichtet, einen Ausweis vorzulegen.';

  @override
  String get rvDriveWarrant =>
      'Zu fragen, ob die Beamten einen Durchsuchungsbefehl haben. In diesem Fall haben Sie das Recht, ihn einzusehen. Wenn ein „Durchsuchungsbefehl“ nicht von einem Richter unterzeichnet ist, ist er ungültig.';

  @override
  String get rvHomeWarrant =>
      'Die Türen geschlossen zu halten. Falls sie einen Durchsuchungsbefehl haben, bitten Sie sie, diesen zunächst unter der Tür hindurchzuschieben. Wenn ein „Durchsuchungsbefehl“ nicht von einem Richter unterzeichnet ist, ist er ungültig. Halten Sie Ihre Tür geschlossen.';

  @override
  String get rvSharedSign => 'Sich zu weigern, irgendetwas zu unterschreiben.';

  @override
  String get rvSharedFingerprint =>
      'Sich zu weigern, sich von der ICE Fingerabdrücke abnehmen zu lassen, es sei denn, Sie befinden sich in Gewahrsam.';

  @override
  String get rvSharedLawyer =>
      'Einen Anwalt zu konsultieren. Wenn Sie offiziell festgenommen wurden, haben Sie Anspruch auf einen Pflichtverteidiger.';

  @override
  String get ssAutoShare => 'Bilder/Videos automatisch teilen';

  @override
  String get ssSOS => 'SOS-Einstellungen';

  @override
  String get ssAppearance => 'Darstellungseinstellungen';

  @override
  String get ssPermissions => 'Berechtigungen';

  @override
  String get ssResources => 'Ressourcen';

  @override
  String get ssSupport => 'Support';

  @override
  String get pmOnlyAdd =>
      'Dieses Tool hilft nur beim Hinzufügen von Berechtigungen.';

  @override
  String get pmRemoveIn => 'Du kannst Berechtigungen entfernen in den ';

  @override
  String get pmManualPermission =>
      'Wenn du Berechtigungen in den Systemeinstellungen entfernst, müssen sie auch dort wiederhergestellt werden.';

  @override
  String get rmCommunity => 'Community-Ressourcen';

  @override
  String get rmGov => 'US-Regierungsressourcen';

  @override
  String get rmAffiliate => 'Keine davon ist mit Empathetech LLC verbunden';

  @override
  String get rmAffiliateFix => 'Keine davon ist mit Empathetic LLC verbunden';

  @override
  String get faqName => 'FAQ';

  @override
  String get faqListQ => 'Wie wurde die Rechte-Liste erstellt?';

  @override
  String get faqListA =>
      'Die Liste der Rechte wurde aus mehreren öffentlichen Ressourcen entnommen, darunter:';

  @override
  String get faqSettings => 'Wie funktionieren die Einstellungen?';

  @override
  String get faqAutoShareA =>
      ' verwendet die integrierte Teilen-Funktion deines Telefons. Es verwendet nicht deine gespeicherten Notfallkontakte (falls vorhanden). Das Teilen ist optional und kann jederzeit abgebrochen werden.';

  @override
  String get faqLinkA =>
      ' wie dein Standort an deine Notfallkontakte gesendet wird. \"Google Maps\", \"Apple Maps\" und \"Waze\" senden einen klickbaren Link für den entsprechenden Dienst. \"Koordinaten\" senden deinen Breiten- und Längengrad als reinen Text.';

  @override
  String get faqOnOpenA =>
      ' Ein SOS-Notruf beginnt sofort beim Start der App. Für die meisten Benutzer nicht empfohlen, da dies zu versehentlichen Notrufen führen könnte.';

  @override
  String get faqOnInterruptA =>
      ' Wenn ein Video aufgenommen wird und InstaSOS den Fokus verliert, beginnt ein SOS-Notruf. Fokusverlust bedeutet: Minimieren der App, Wechseln der App und/oder Sperren des Bildschirms. Es wird empfohlen, entweder dies oder \"SOS beim Schließen\" (oder beides) zu aktivieren.';

  @override
  String get faqOnInterruptAFix =>
      ' Wenn ein Video aufgenommen wird und Insta-SOS den Fokus verliert, beginnt ein SOS-Notruf. Fokusverlust bedeutet: Minimieren der App, Wechseln der App und/oder Sperren des Bildschirms. Es wird empfohlen, entweder dies oder \"SOS beim Schließen\" (oder beides) zu aktivieren.';

  @override
  String get faqUnavailable => 'SOS meldet \"Standort nicht verfügbar\"?';

  @override
  String get faqReliability =>
      'Um die SOS-Zuverlässigkeit zu verbessern, aktiviere bitte \"Immer zulassen\" in den ';

  @override
  String get faqLocationPermissions => 'Standortberechtigungen';

  @override
  String get faqLocationTrust =>
      'Die App verwendet deinen Standort nur, während ein SOS-Notruf aktiv ist. Weder InstaSOS noch Empathetech LLC verfolgen, speichern oder verkaufen Benutzerdaten.';

  @override
  String get faqLocationTrustFix =>
      'Die App verwendet deinen Standort nur, während ein SOS-Notruf aktiv ist. Weder Insta-SOS noch Empathetic LLC verfolgen, speichern oder verkaufen Benutzerdaten.';

  @override
  String get faqContactPermissions =>
      'Wenn du diese Nachricht erhältst, während du einen Notfallkontakt hinzufügst, hat InstaSOS keine Berechtigung, auf diesen bestimmten Kontakt zuzugreifen.';

  @override
  String get faqContactPermissionsFix =>
      'Wenn du diese Nachricht erhältst, während du einen Notfallkontakt hinzufügst, hat Insta-SOS keine Berechtigung, auf diesen bestimmten Kontakt zuzugreifen.';

  @override
  String get faqUpdateContacts =>
      'Du kannst den Zugriff auf weitere (oder alle) Kontakte gewähren in den ';

  @override
  String get faqSplitClarity1 =>
      'Den Zugriff auf einen Kontakt zu gewähren, macht ihn nicht zu einem Notfallkontakt. Nur die Nummern, die aufgeführt sind in den ';

  @override
  String get faqSplitClarity2 =>
      ' werden während eines SOS-Notrufs kontaktiert.';

  @override
  String get faqMissing => 'Warum fehlen einige Android-Funktionen?';

  @override
  String get faqRestricted =>
      'Die fehlenden Funktionen erfordern SMS-Automatisierung, und Apple erlaubt Entwicklern nicht, Textnachrichten zu automatisieren (ohne einen kostenpflichtigen Dienst).';

  @override
  String get faqShortcuts =>
      'Was ist mit iOS-Kurzbefehlen?\nEs gibt auch Einschränkungen für den Zugriff auf Benutzerkurzbefehle, was wichtige Funktionen beeinträchtigen würde. Vor allem: Es würde Videoaufnahmen unterbrechen.';

  @override
  String get faqLanguages => 'Warum ist die Sprache X nicht verfügbar?';

  @override
  String get faqResponsible =>
      'Es wäre unverantwortlich, maschinelle Übersetzung für die Rechte-Liste zu verwenden. Bitte ziehe in Betracht, ';

  @override
  String get faqContributing => 'dazu beizutragen';

  @override
  String get faqExpand => ' , um zu helfen, die Sprachoptionen zu erweitern.';

  @override
  String get faqReset => 'Tutorial zurücksetzen';

  @override
  String get faqContact => 'Support kontaktieren';

  @override
  String get faqContactHint => 'E-Mail an Empathetic LLC senden';

  @override
  String get bsEMC => 'Notfallkontakte';

  @override
  String get bsAddSomeone => 'Jemanden hinzufügen, um SOS zu aktivieren';

  @override
  String get bsRemoveHint => 'Kontakt entfernen';

  @override
  String get bsAddHint => 'Weiteren Kontakt hinzufügen';

  @override
  String get bsLinkType => 'Standort-Link-Typ';

  @override
  String get bsSnackRequest => 'Bitte füge Notfallkontakte hinzu';

  @override
  String get bsNeedPermission =>
      'Kontakte können ohne Berechtigung nicht hinzugefügt werden';

  @override
  String get bsPartialContacts =>
      'Apple zeigt alle Kontakte an, nicht nur die, die für InstaSOS freigegeben sind.\nUm weitere Kontakte freizugeben, öffne die ';

  @override
  String get bsPartialContactsFix =>
      'Apple zeigt alle Kontakte an, nicht nur die, die für Insta-SOS freigegeben sind.\nUm weitere Kontakte freizugeben, öffne die ';

  @override
  String get bsNumError =>
      'Dieser Kontakt ist privat oder hat keine Telefonnummer.';

  @override
  String get bsSOSOnOpen => 'SOS beim Öffnen';

  @override
  String get bsSOSOnClose => 'SOS beim Schließen';

  @override
  String get bsSOSOnCloseHint =>
      'Eine Schaltfläche für sicheres Schließen (Daumen hoch) wird auf der Startseite gegenüber den Einstellungen angezeigt.\nWenn InstaSOS den Fokus aus einem anderen Grund als der Schaltfläche zum sicheren Schließen verliert (minimiert, Apps gewechselt, Bildschirm aus), beginnt ein SOS-Notruf.';

  @override
  String get bsSOSOnCloseHintFix =>
      'Eine Schaltfläche für sicheres Schließen (Daumen hoch) wird auf der Startseite gegenüber den Einstellungen angezeigt.\nWenn Insta-SOS den Fokus aus einem anderen Grund als der Schaltfläche zum sicheren Schließen verliert (minimiert, Apps gewechselt, Bildschirm aus), beginnt ein SOS-Notruf.';

  @override
  String get bsCloseOffWarning =>
      'Die App wird automatisch geschlossen, um unbeabsichtigte Notrufe zu verhindern.';

  @override
  String get bsSOSOnVideo => 'SOS bei unterbrochener Aufnahme';

  @override
  String get dsLadyLiberty =>
      'Ein Bild der Freiheitsstatue mit einer Vorschau der Rechte-Liste.';
}
