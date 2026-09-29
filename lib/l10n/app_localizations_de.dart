// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Fine Motor';

  @override
  String get navHome => 'Start';

  @override
  String get navCatalog => 'Katalog';

  @override
  String get navResults => 'Ergebnisse';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get homeWelcome => 'Willkommen';

  @override
  String get homeBody =>
      'Absolvieren Sie Ihre Tremor-Checks, um die Feinmotorik zu verfolgen.';

  @override
  String get homeDailyCheckIn => 'Täglicher Check-in';

  @override
  String get catalogTitle => 'Katalog';

  @override
  String get resultsTitle => 'Ergebnisse';

  @override
  String get resultsEmptyTitle => 'Noch keine Ergebnisse';

  @override
  String get resultsEmptyBody => 'Abgeschlossene Tremor-Tests erscheinen hier.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsLanguageSection => 'SPRACHE';

  @override
  String get settingsAboutSection => 'INFO';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsSyncWithDoctor => 'Mit Arzt synchronisieren';

  @override
  String get settingsLoadError => 'Einstellungen konnten nicht geladen werden';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get wipeDatabase => 'Datenbank löschen';

  @override
  String get databaseErrorTitle => 'Datenbankfehler';

  @override
  String get databaseErrorBody =>
      'Fine Motor konnte den lokalen Speicher nicht öffnen. Versuchen Sie es erneut, oder löschen Sie die Datenbank, um ein leeres Schema neu anzulegen.';

  @override
  String get comingSoon => 'Demnächst verfügbar';

  @override
  String get comingInPhase2 => 'Kommt in Phase 2';

  @override
  String get couldNotSaveLanguage => 'Sprache konnte nicht gespeichert werden';

  @override
  String get motorTestTitle => 'Formen zeichnen';

  @override
  String get motorTestSave => 'Speichern';

  @override
  String get motorTestReset => 'Zurücksetzen';
}
