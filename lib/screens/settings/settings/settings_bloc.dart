import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/domain/services/app_info_port.dart';
import 'package:finemotor/domain/services/locale_preferences_port.dart';
import 'package:finemotor/domain/use_cases/settings/set_locale_use_case.dart';
import 'package:finemotor/screens/settings/app_locale_cubit.dart';
import 'package:finemotor/screens/settings/settings/settings_snack.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    this._localePreferences,
    this._appInfo,
    this._setLocale,
    this._localeCubit,
  ) : super(const SettingsState.loading()) {
    on<_Started>(_onStarted);
    on<_LocaleSelected>(_onLocaleSelected);
    on<_SyncTapped>(_onSyncTapped);
    on<_SnackConsumed>(_onSnackConsumed);
  }

  final LocalePreferencesPort _localePreferences;
  final AppInfoPort _appInfo;
  final SetLocaleUseCase _setLocale;
  final AppLocaleCubit _localeCubit;

  Future<void> _onStarted(
    _Started event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    try {
      final locale = await _localePreferences.getLocale();
      final version = await _appInfo.getVersionLabel();
      _localeCubit.setAppLocale(locale);
      emit(SettingsState.ready(locale: locale, versionLabel: version));
    } on Object {
      emit(const SettingsState.error());
    }
  }

  Future<void> _onLocaleSelected(
    _LocaleSelected event,
    Emitter<SettingsState> emit,
  ) async {
    final current = state;
    if (current is! _Ready) return;
    try {
      await _setLocale(event.locale);
      _localeCubit.setAppLocale(event.locale);
      emit(current.copyWith(locale: event.locale));
    } on Object {
      emit(current.copyWith(snack: SettingsSnack.couldNotSaveLanguage));
    }
  }

  void _onSyncTapped(_SyncTapped event, Emitter<SettingsState> emit) {
    final current = state;
    if (current is! _Ready) return;
    emit(current.copyWith(snack: SettingsSnack.comingInPhase2));
  }

  void _onSnackConsumed(_SnackConsumed event, Emitter<SettingsState> emit) {
    final current = state;
    if (current is! _Ready) return;
    emit(current.copyWith(snack: null));
  }
}
