# Changelog

All notable changes to this project will be documented in this file.

## [1.5.0] - 2025-10-16
### Added
- Text background opacity mirror to design settings, with a preview of the rights list
- EzConfigFAB to appearance settings screens

### Updated
- Contacts list
  - Better spacing/styling
  - Contact tiles now have initials
  - Fixed an iOS bug
    - Updated the messaging on iOS when users select to share some contacts
  - No longer shows a toast when you cancel
- Fixed i(Pad)OS sharing bug
  - Affected feedback and media sharing, both fixed

## [1.4.1] - 2025-09-25
### Added
- Resources to the README(s)
- l10n audit script
- Right to refuse to sign anything.

### Updated
- Right to leave if you are not under arrest -> not being detained.
- Router to properly consume the new animation duration setting

## [1.4.0] - 2025-09-24
### Added
- LinkType selector
  - Default still Google Maps, but can now select Apple, Waze, or raw coordinates
- Version check FAB
  - Mostly for the .apk peeps
- Auto-share media is now a toggle setting
  - Default on

### Updated
- EFUI 10 && Flutter 3.35
  - TutorialOverlay is now in EFUI (EzTutorial)
- Flash button
  - Includes torch mode and has better error handling

### Fixed
- README typos

### Removed
- Unused font asset(s)

## [1.3.2] - 2025-06-27
### Updated
- Settings UI
  - EFUI 9.2.0

## [1.3.1] - 2025-06-23
### Updated
- Settings checkbox -> settings switch
- iOS "SOS on open" bugfix
  - Sometimes unable to enable; now always able to enable

## [1.3.0] - 2025-06-15
### Added
- Filipino
- Simplified Chinese

## [1.2.1] - 2025-05-19
### Updated
- Camera state management
  - Should resolve an iOS bug where the camera might not be recognized as authentic
    - If you experience(d) this issue, it is temporary. Opening the default camera and/or a phone restart will resolve it.
      - Another example of Apple being alarmist to scare it's users into a submissive state.

## [1.2.0] - 2025-05-13
### Updated
- Localizations
  - Arabic, Spanish, French, Haitian Creole
    - All human verified

## [1.1.1] - 2025-04-22
### Fixed
- Google Play release
- SharePlus package

## [1.1.0] - 2025-04-20
### Added
- Bug fixes and improvements
- Background SOS for Android
  - Released on Android

## [1.0.0] - 2025-04-17
### Added
- InstaSOS V1
  - Released on iOS

## [0.0.0] - 2025-03-25
### Added
- InstaSOS foundation generated via [Open UI](https://www.empathetech.net/#/products/open-ui)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
