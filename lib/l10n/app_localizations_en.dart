// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fine Motor';

  @override
  String get navHome => 'Home';

  @override
  String get navCatalog => 'Catalog';

  @override
  String get navResults => 'Results';

  @override
  String get navSettings => 'Settings';

  @override
  String get homeWelcome => 'Welcome';

  @override
  String get homeBody =>
      'Complete your tremor checks to track fine motor control.';

  @override
  String get homeDailyCheckIn => 'Daily check-in';

  @override
  String get catalogTitle => 'Catalog';

  @override
  String get resultsTitle => 'Results';

  @override
  String get resultsEmptyTitle => 'No results yet';

  @override
  String get resultsEmptyBody => 'Completed tremor tests will appear here.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguageSection => 'LANGUAGE';

  @override
  String get settingsAboutSection => 'ABOUT';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsSyncWithDoctor => 'Sync with doctor';

  @override
  String get settingsLoadError => 'Could not load settings';

  @override
  String get retry => 'Retry';

  @override
  String get wipeDatabase => 'Wipe database';

  @override
  String get databaseErrorTitle => 'Database error';

  @override
  String get databaseErrorBody =>
      'Fine Motor could not open local storage. Retry, or wipe the database to recreate an empty schema.';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get comingInPhase2 => 'Coming in phase 2';

  @override
  String get couldNotSaveLanguage => 'Could not save language';

  @override
  String get motorTestTitle => 'Draw shapes';

  @override
  String get motorTestSave => 'Save';

  @override
  String get motorTestReset => 'Reset';
}
