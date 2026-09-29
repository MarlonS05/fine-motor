import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/logger/logger.dart';
import 'package:go_router/go_router.dart';

/// Injectable router for BLoCs — controllers must not import go_router.
///
/// Paths may be written with or without a leading `/`
/// (e.g. `go('home')`, `push('catalog/motortests/45')`).
class AppRouter {
  AppRouter(this._goRouter);

  final GoRouter _goRouter;

  /// For [MaterialApp.router] only — do not use from BLoCs.
  GoRouter get config => _goRouter;

  void go(String location) => _goRouter.go(_normalize(location));

  Future<T?> push<T extends Object?>(String location) =>
      _goRouter.push<T>(_normalize(location));

  void pop<T extends Object?>([T? result]) {
    if (_goRouter.canPop()) {
      _goRouter.pop(result);
    }
  }

  void startTest(LevelEnum level) {
    push('/motor_test/$level', );
  }

  static String _normalize(String location) {
    if (location.isEmpty) return '/';
    return location.startsWith('/') ? location : '/$location';
  }
}
