import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finemotor/router/app_router.dart';
import 'package:finemotor/router/app_routes.dart';

part 'main_shell_event.dart';
part 'main_shell_state.dart';
part 'main_shell_bloc.freezed.dart';

class MainShellBloc extends Bloc<MainShellEvent, MainShellState> {
  MainShellBloc(this._router) : super(const MainShellState()) {
    on<_Started>(_onStarted);
    on<_TabSelected>(_onTabSelected);
  }

  final AppRouter _router;

  void _onStarted(_Started event, Emitter<MainShellState> emit) {
    emit(state.copyWith(selectedIndex: event.currentIndex));
  }

  void _onTabSelected(_TabSelected event, Emitter<MainShellState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
    final route = switch (event.index) {
      0 => AppRoutes.home,
      1 => AppRoutes.catalog,
      2 => AppRoutes.results,
      _ => AppRoutes.settings,
    };
    _router.go(route);
  }
}
