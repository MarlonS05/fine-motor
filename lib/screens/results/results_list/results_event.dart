part of 'results_bloc.dart';

@freezed
abstract class ResultsEvent with _$ResultsEvent {
  const factory ResultsEvent.started() = _Started;
}
