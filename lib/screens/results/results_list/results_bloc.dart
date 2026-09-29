import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_event.dart';
part 'results_state.dart';
part 'results_bloc.freezed.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc() : super(const ResultsState.loading()) {
    on<_Started>(_onStarted);
  }

  void _onStarted(_Started event, Emitter<ResultsState> emit) {
    // Persistence deferred — always empty for this pass.
    emit(const ResultsState.empty());
  }
}
