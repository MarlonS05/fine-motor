import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:finemotor/db/app_database.dart';
import 'package:finemotor/di/di.dart';
import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/domain/services/locale_preferences_port.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/logger/logger.dart';
import 'package:finemotor/router/app_router.dart';
import 'package:finemotor/screens/database_error/database_error_app.dart';
import 'package:finemotor/screens/settings/app_locale_cubit.dart';
import 'package:finemotor/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  try {
    await configureDependencies();
  } on DatabaseException catch (e, st) {
    logger.w('Failed opening database on startup', error: e, stackTrace: st);
    final locale = await _startupLocale();
    runApp(
      DatabaseErrorApp(
        locale: locale,
        onRetry: () async {
          await resetDependencies();
          await configureDependencies();
          runApp(const FineMotorApp());
        },
        onWipe: () async {
          final db = AppDatabase();
          await db.wipe();
          await resetDependencies();
          await configureDependencies();
          runApp(const FineMotorApp());
        },
      ),
    );
    return;
  }
  runApp(const FineMotorApp());
}

Future<Locale> _startupLocale() async {
  try {
    if (getIt.isRegistered<LocalePreferencesPort>()) {
      final appLocale = await getIt<LocalePreferencesPort>().getLocale();
      return appLocale == AppLocale.en
          ? const Locale('en')
          : const Locale('de');
    }
  } on Object {
    // Fall through to default.
  }
  return const Locale('de');
}

class FineMotorApp extends StatelessWidget {
  const FineMotorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return BlocProvider.value(
      value: getIt<AppLocaleCubit>(),
      child: BlocBuilder<AppLocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: 'Fine Motor',
            theme: buildAppTheme(),
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: router.config,
          );
        },
      ),
    );
  }
}
