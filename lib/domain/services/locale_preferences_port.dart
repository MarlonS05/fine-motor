import 'package:finemotor/domain/models/app_locale.dart';

abstract class LocalePreferencesPort {
  Future<AppLocale> getLocale();

  Future<void> setLocale(AppLocale locale);
}
