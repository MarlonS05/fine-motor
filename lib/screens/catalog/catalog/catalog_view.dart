import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_bloc.dart';
import 'package:finemotor/screens/catalog/catalog/catalog_snack.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:finemotor/theme/app_text_styles.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<CatalogBloc, CatalogState>(
      listenWhen: (previous, current) {
        final previousSnack = previous.mapOrNull(ready: (state) => state.snack);
        final currentSnack = current.mapOrNull(ready: (state) => state.snack);
        return currentSnack != null && currentSnack != previousSnack;
      },
      listener: (context, state) {
        final snack = state.mapOrNull(ready: (s) => s.snack);
        if (snack == null) return;
        final l10n = AppLocalizations.of(context)!;
        final message = switch (snack) {
          CatalogSnack.comingSoon => l10n.comingSoon,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        context.read<CatalogBloc>().add(const CatalogEvent.snackConsumed());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.catalogTitle)),
        body: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: () => Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  child: FilledButton(
                    onPressed: () => context
                        .read<CatalogBloc>()
                        .add(const CatalogEvent.started()),
                    child: Text(l10n.retry),
                  ),
                ),
              ),
              ready: (tests, _) => ListView.separated(
                padding: const EdgeInsets.all(AppDimensions.md),
                itemCount: tests.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: AppDimensions.sm),
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return _CatalogTestTile(
                    test: test,
                    onTap: () => context
                        .read<CatalogBloc>()
                        .add(CatalogEvent.testSelected(test.level)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CatalogTestTile extends StatelessWidget {
  const _CatalogTestTile({required this.test, required this.onTap});

  final MotorTest test;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        test.title,
        style: AppTextStyles.heroTitle().copyWith(fontSize: 16),
      ),
      subtitle: Text(
        test.description,
        style: AppTextStyles.body(),
      ),
      onTap: onTap,
    );
  }
}
