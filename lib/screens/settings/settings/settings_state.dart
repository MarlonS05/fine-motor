part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.error() = _Error;
  const factory SettingsState.ready({
    required AppLocale locale,
    required String versionLabel,
    SettingsSnack? snack,
  }) = _Ready;
}
