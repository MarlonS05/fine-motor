import 'package:finemotor/di/di.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/router/app_routes.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_bloc.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_view.dart';
import 'package:finemotor/screens/home/home/home_bloc.dart';
import 'package:finemotor/screens/home/home/home_view.dart';
import 'package:finemotor/screens/results/results_list/results_bloc.dart';
import 'package:finemotor/screens/results/results_list/results_view.dart';
import 'package:finemotor/screens/settings/settings/settings_bloc.dart';
import 'package:finemotor/screens/settings/settings/settings_view.dart';
import 'package:finemotor/screens/shell/main_shell/main_shell_bloc.dart';
import 'package:finemotor/screens/shell/main_shell/main_shell_view.dart';
import 'package:finemotor/screens/test/motor_test/motor_test_bloc.dart';
import 'package:finemotor/screens/test/motor_test/motor_test_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createGoRouter() {
  return GoRouter(
    initialLocation: '/${AppRoutes.home}',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BlocProvider(
            create: (_) =>
                getIt<MainShellBloc>()
                  ..add(MainShellEvent.started(navigationShell.currentIndex)),
            child: MainShellView(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoutes.home}',
                builder: (context, state) => BlocProvider(
                  create: (_) =>
                      getIt<HomeBloc>()..add(const HomeEvent.started()),
                  child: const HomeView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoutes.catalog}',
                builder: (context, state) => BlocProvider(
                  create: (_) =>
                      getIt<CatalogBloc>()..add(const CatalogEvent.started()),
                  child: const CatalogView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoutes.results}',
                builder: (context, state) => BlocProvider(
                  create: (_) =>
                      getIt<ResultsBloc>()..add(const ResultsEvent.started()),
                  child: const ResultsView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoutes.settings}',
                builder: (context, state) => BlocProvider(
                  create: (_) =>
                      getIt<SettingsBloc>()..add(const SettingsEvent.started()),
                  child: const SettingsView(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/${AppRoutes.motorTest}/:name',
        builder: (context, state) {
          LevelEnum? name = getLevelEnumForString(state.pathParameters['name']);
          return BlocProvider(
            create: (_) =>
                getIt<MotorTestBloc>(param1: name)
                  ..add(const MotorTestEvent.started()),
            child: const MotorTestView(),
          );
        },
      ),
    ],
  );
}
