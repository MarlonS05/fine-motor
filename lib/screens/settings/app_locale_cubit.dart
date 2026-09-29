import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/domain/models/app_locale.dart';

class AppLocaleCubit extends Cubit<Locale> {
  AppLocaleCubit(AppLocale initial)
      : super(initial == AppLocale.en ? const Locale('en') : const Locale('de'));

  void setAppLocale(AppLocale locale) {
    emit(locale == AppLocale.en ? const Locale('en') : const Locale('de'));
  }
}
