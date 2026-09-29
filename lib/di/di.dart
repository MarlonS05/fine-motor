import 'package:finemotor/db/app_database.dart';
import 'package:finemotor/db/daos/motor_test_dao.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/domain/repositories/motor_test_repository.dart';
import 'package:finemotor/domain/services/app_info_port.dart';
import 'package:finemotor/domain/services/locale_preferences_port.dart';
import 'package:finemotor/domain/use_cases/settings/set_locale_use_case.dart';
import 'package:finemotor/platform/package_info_app_info.dart';
import 'package:finemotor/platform/shared_preferences_locale_preferences.dart';
import 'package:finemotor/repo/motor_test_repository_impl.dart';
import 'package:finemotor/router/app_router.dart';
import 'package:finemotor/router/create_go_router.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_bloc.dart';
import 'package:finemotor/screens/home/home/home_bloc.dart';
import 'package:finemotor/screens/results/results_list/results_bloc.dart';
import 'package:finemotor/screens/settings/app_locale_cubit.dart';
import 'package:finemotor/screens/settings/settings/settings_bloc.dart';
import 'package:finemotor/screens/shell/main_shell/main_shell_bloc.dart';
import 'package:finemotor/screens/test/motor_test/motor_test_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _registerSingletons();
  await getIt<AppDatabase>().ensureOpen();
  await _primeLocaleCubit();
  _registerUseCases();
  _registerScreens();
}

void _registerSingletons() {
  // database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton(() => MotorTestDao(getIt()));

  // repos
  getIt.registerLazySingleton<MotorTestRepository>(
    () => MotorTestRepositoryImpl(getIt()),
  );

  // platform
  getIt.registerLazySingleton<LocalePreferencesPort>(
    () => SharedPreferencesLocalePreferences(),
  );
  getIt.registerLazySingleton<AppInfoPort>(() => PackageInfoAppInfo());

  // locale
  getIt.registerLazySingleton<AppLocaleCubit>(
    () => AppLocaleCubit(AppLocale.de),
  );

  // router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter(createGoRouter()));
}

Future<void> _primeLocaleCubit() async {
  final locale = await getIt<LocalePreferencesPort>().getLocale();
  getIt<AppLocaleCubit>().setAppLocale(locale);
}

void _registerUseCases() {
  // settings use cases
  getIt.registerLazySingleton(() => SetLocaleUseCase(getIt()));
}

void _registerScreens() {
  // shell / home screens
  getIt.registerFactory(() => MainShellBloc(getIt()));
  getIt.registerFactory(() => HomeBloc());

  // catalog screens
  getIt.registerFactory(() => CatalogBloc(getIt(), getIt()));

  // results screens
  getIt.registerFactory(() => ResultsBloc());

  // settings screens
  getIt.registerFactory(() => SettingsBloc(getIt(), getIt(), getIt(), getIt()));

  // test screens
  getIt.registerFactoryParam<MotorTestBloc, LevelEnum?, void>(
    (levelName, _) => MotorTestBloc(levelName, getIt(), getIt()),
  );
}

Future<void> resetDependencies() async {
  await getIt.reset();
}
