import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/screens/home/home/home_bloc.dart';
import 'package:finemotor/screens/home/home/home_snack.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:finemotor/theme/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          current.snack != null && current.snack != previous.snack,
      listener: (context, state) {
        final snack = state.snack;
        if (snack == null) return;
        final l10n = AppLocalizations.of(context)!;
        final message = switch (snack) {
          HomeSnack.comingSoon => l10n.comingSoon,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        context.read<HomeBloc>().add(const HomeEvent.snackConsumed());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.appTitle)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.homeWelcome, style: AppTextStyles.heroTitle()),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  l10n.homeBody,
                  style: AppTextStyles.body(),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () => context
                      .read<HomeBloc>()
                      .add(const HomeEvent.dailyCheckInTapped()),
                  child: Text(l10n.homeDailyCheckIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
