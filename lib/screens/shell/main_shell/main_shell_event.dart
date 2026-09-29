part of 'main_shell_bloc.dart';

@freezed
abstract class MainShellEvent with _$MainShellEvent {
  const factory MainShellEvent.started(int currentIndex) = _Started;
  const factory MainShellEvent.tabSelected(int index) = _TabSelected;
}
