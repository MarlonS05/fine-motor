import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/screens/results/results_list/results_bloc.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:finemotor/theme/app_text_styles.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.resultsTitle)),
      body: BlocBuilder<ResultsBloc, ResultsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            empty: () => Padding(
              padding: const EdgeInsets.all(AppDimensions.lg),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.resultsEmptyTitle,
                      style: AppTextStyles.heroTitle(),
                    ),
                    const SizedBox(height: AppDimensions.sm),
                    Text(
                      l10n.resultsEmptyBody,
                      style: AppTextStyles.body(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
