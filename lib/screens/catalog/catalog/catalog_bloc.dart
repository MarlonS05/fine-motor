import 'package:finemotor/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/domain/repositories/motor_test_repository.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_snack.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';
part 'catalog_bloc.freezed.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(this._motorTestRepository, this._router)
      : super(const CatalogState.loading()) {
    on<_Started>(_onStarted);
    on<_TestSelected>(_onTestSelected);
    on<_SnackConsumed>(_onSnackConsumed);
  }

  final AppRouter _router;
  final MotorTestRepository _motorTestRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<CatalogState> emit,
  ) async {
    emit(const CatalogState.loading());
    try {
      final tests = await _motorTestRepository.getAll();
      emit(CatalogState.ready(tests: tests));
    } on Object {
      emit(const CatalogState.error());
    }
  }

  void _onTestSelected(_TestSelected event, Emitter<CatalogState> emit) {
    _router.startTest(event.level);
    // final current = state;
    // if (current is! _Ready) return;
    // emit(current.copyWith(snack: CatalogSnack.comingSoon));
  }

  void _onSnackConsumed(_SnackConsumed event, Emitter<CatalogState> emit) {
    final current = state;
    if (current is! _Ready) return;
    emit(current.copyWith(snack: null));
  }
}
