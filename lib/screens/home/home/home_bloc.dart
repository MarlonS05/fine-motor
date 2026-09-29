import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finemotor/screens/home/home/home_snack.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<_Started>(_onStarted);
    on<_DailyCheckInTapped>(_onDailyCheckInTapped);
    on<_SnackConsumed>(_onSnackConsumed);
  }

  void _onStarted(_Started event, Emitter<HomeState> emit) {}

  void _onDailyCheckInTapped(
    _DailyCheckInTapped event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(snack: HomeSnack.comingSoon));
  }

  void _onSnackConsumed(_SnackConsumed event, Emitter<HomeState> emit) {
    emit(state.copyWith(snack: null));
  }
}
