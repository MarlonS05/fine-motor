part of 'motor_test_bloc.dart';

@freezed
abstract class MotorTestState with _$MotorTestState {
  const factory MotorTestState({
    @Default(true) bool loading,
    MotorTest? motorTest,
  }) = _MotorTestState;
}
