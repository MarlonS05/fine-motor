part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.dailyCheckInTapped() = _DailyCheckInTapped;
  const factory HomeEvent.snackConsumed() = _SnackConsumed;
}
