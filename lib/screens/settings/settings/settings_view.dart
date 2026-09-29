import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/domain/models/app_locale.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/screens/settings/settings/settings_bloc.dart';
import 'package:finemotor/screens/settings/settings/settings_snack.dart';
import 'package:finemotor/theme/app_colors.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:finemotor/theme/app_text_styles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen: (previous, current) {
        final prevSnack = previous.mapOrNull(ready: (s) => s.snack);
        final currSnack = current.mapOrNull(ready: (s) => s.snack);
        return currSnack != null && currSnack != prevSnack;
      },
      listener: (context, state) {
        final snack = state.mapOrNull(ready: (s) => s.snack);
        if (snack == null) return;
        final l10n = AppLocalizations.of(context)!;
        final message = switch (snack) {
          SettingsSnack.couldNotSaveLanguage => l10n.couldNotSaveLanguage,
          SettingsSnack.comingInPhase2 => l10n.comingInPhase2,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        context.read<SettingsBloc>().add(const SettingsEvent.snackConsumed());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.settingsTitle)),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: () => Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.settingsLoadError,
                        style: AppTextStyles.heroTitle(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.md),
                      FilledButton(
                        onPressed: () => context
                            .read<SettingsBloc>()
                            .add(const SettingsEvent.started()),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              ready: (locale, versionLabel, _) => ListView(
                padding: const EdgeInsets.all(AppDimensions.md),
                children: [
                  Text(
                    l10n.settingsLanguageSection,
                    style: AppTextStyles.sectionLabel(),
                  ),
                  const SizedBox(height: AppDimensions.sm),
                  RadioGroup<AppLocale>(
                    groupValue: locale,
                    onChanged: (value) {
                      if (value == null) return;
                      context
                          .read<SettingsBloc>()
                          .add(SettingsEvent.localeSelected(value));
                    },
                    child: const Column(
                      children: [
                        RadioListTile<AppLocale>(
                          value: AppLocale.de,
                          title: Text('Deutsch'),
                        ),
                        RadioListTile<AppLocale>(
                          value: AppLocale.en,
                          title: Text('English'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.lg),
                  Text(
                    l10n.settingsAboutSection,
                    style: AppTextStyles.sectionLabel(),
                  ),
                  ListTile(
                    title: Text(l10n.settingsVersion),
                    subtitle: Text(
                      versionLabel,
                      style: AppTextStyles.body(AppColors.bodyTertiary),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.lg),
                  FilledButton.tonal(
                    onPressed: () => context
                        .read<SettingsBloc>()
                        .add(const SettingsEvent.syncTapped()),
                    child: Text(l10n.settingsSyncWithDoctor),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
