part of 'main_shell_bloc.dart';

@freezed
abstract class MainShellState with _$MainShellState {
  const factory MainShellState({@Default(0) int selectedIndex}) =
      _MainShellState;
}
