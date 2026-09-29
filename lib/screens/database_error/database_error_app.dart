import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/theme/app_colors.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:finemotor/theme/app_text_styles.dart';

class DatabaseErrorApp extends StatelessWidget {
  const DatabaseErrorApp({
    super.key,
    required this.locale,
    required this.onRetry,
    required this.onWipe,
  });

  final Locale locale;
  final Future<void> Function() onRetry;
  final Future<void> Function() onWipe;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Motor',
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: _DatabaseErrorScreen(onRetry: onRetry, onWipe: onWipe),
    );
  }
}

class _DatabaseErrorScreen extends StatefulWidget {
  const _DatabaseErrorScreen({
    required this.onRetry,
    required this.onWipe,
  });

  final Future<void> Function() onRetry;
  final Future<void> Function() onWipe;

  @override
  State<_DatabaseErrorScreen> createState() => _DatabaseErrorScreenState();
}

class _DatabaseErrorScreenState extends State<_DatabaseErrorScreen> {
  var _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                l10n.databaseErrorTitle,
                style: AppTextStyles.heroTitle(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.md),
              Text(
                l10n.databaseErrorBody,
                style: AppTextStyles.body(),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              FilledButton(
                onPressed: _busy ? null : () => _run(widget.onRetry),
                child: Text(l10n.retry),
              ),
              const SizedBox(height: AppDimensions.sm),
              OutlinedButton(
                onPressed: _busy ? null : () => _run(widget.onWipe),
                child: Text(l10n.wipeDatabase),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
