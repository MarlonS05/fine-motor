import 'package:shared_preferences/shared_preferences.dart';
import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/domain/services/locale_preferences_port.dart';

class SharedPreferencesLocalePreferences implements LocalePreferencesPort {
  static const _key = 'app_locale';

  @override
  Future<AppLocale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    return switch (raw) {
      'en' => AppLocale.en,
      _ => AppLocale.de,
    };
  }

  @override
  Future<void> setLocale(AppLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.name);
  }
}
