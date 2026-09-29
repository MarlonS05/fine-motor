import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/domain/services/locale_preferences_port.dart';

class SetLocaleUseCase {
  SetLocaleUseCase(this._localePreferences);

  final LocalePreferencesPort _localePreferences;

  Future<void> call(AppLocale locale) => _localePreferences.setLocale(locale);
}
