import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/domain/repositories/motor_test_repository.dart';
import 'package:finemotor/logger/logger.dart';
import 'package:finemotor/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'motor_test_event.dart';
part 'motor_test_state.dart';
part 'motor_test_bloc.freezed.dart';

class MotorTestBloc extends Bloc<MotorTestEvent, MotorTestState> {
  final LevelEnum? levelName;
  final AppRouter _router;
  final MotorTestRepository _motorTestRepository;
  MotorTestBloc(this.levelName, this._router, this._motorTestRepository) : super(const MotorTestState()) {
    on<_Started>(_onStarted);
    on<_SaveTapped>(_onSaveTapped);
  }

  void _onStarted(_Started event, Emitter<MotorTestState> emit) async {
    if (levelName == null) {
      _router.pop();
    }
    MotorTest? test = await _motorTestRepository.getTest(levelName!);
    if (test == null) {
      _router.pop();
    } else {
      emit(state.copyWith(motorTest: test, loading: false));
    }
  }

  void _onSaveTapped(_SaveTapped event, Emitter<MotorTestState> emit) {}
}
