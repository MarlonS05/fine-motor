import 'package:finemotor/flame_game/fine_motor_game.dart';
import 'package:finemotor/l10n/app_localizations.dart';
import 'package:finemotor/screens/test/motor_test/motor_test_bloc.dart';
import 'package:finemotor/theme/app_dimensions.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';

class MotorTestView extends StatelessWidget {
  const MotorTestView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    SignatureController signatureController = SignatureController(
      penStrokeWidth: 6,
      penColor: Colors.blue,
    );

    final FineMotorGame game = FineMotorGame(
      onGameOver: () => signatureController.disabled = true,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.motorTestTitle)),
      body: BlocBuilder<MotorTestBloc, MotorTestState>(
        builder: (context, state) {
          return Stack(
            children: [
              Signature(
                controller: signatureController,
                backgroundColor: Colors.transparent,
              ),
              GameWidget(
                game: game,
                behavior: game.isGameOver
                    ? HitTestBehavior.opaque
                    : HitTestBehavior.deferToChild,
              ),
              if (state.loading)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black.withValues(alpha: 0.35),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // FloatingActionButton.extended(
          //   heroTag: 'motorTestReset',
          //   onPressed: () {
          //     game.resetGame();
          //     signatureController.clear();
          //   },
          //   icon: const Icon(Icons.refresh),
          //   label: Text(l10n.motorTestReset),
          // ),
          const SizedBox(width: AppDimensions.sm),
          FloatingActionButton.extended(
            heroTag: 'motorTestSave',
            onPressed: () => context.read<MotorTestBloc>().add(
              const MotorTestEvent.saveTapped(),
            ),
            icon: const Icon(Icons.save),
            label: Text(l10n.motorTestSave),
          ),
        ],
      ),
    );
  }
}
