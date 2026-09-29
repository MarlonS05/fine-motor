part of 'results_bloc.dart';

@freezed
abstract class ResultsState with _$ResultsState {
  const factory ResultsState.loading() = _Loading;
  const factory ResultsState.empty() = _Empty;
}
