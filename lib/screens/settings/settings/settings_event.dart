part of 'settings_bloc.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.localeSelected(AppLocale locale) = _LocaleSelected;
  const factory SettingsEvent.syncTapped() = _SyncTapped;
  const factory SettingsEvent.snackConsumed() = _SnackConsumed;
}
