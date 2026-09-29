part of 'motor_test_bloc.dart';

@freezed
abstract class MotorTestEvent with _$MotorTestEvent {
  const factory MotorTestEvent.started() = _Started;
  const factory MotorTestEvent.saveTapped() = _SaveTapped;
}
