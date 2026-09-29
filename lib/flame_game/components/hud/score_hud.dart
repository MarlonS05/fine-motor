import 'package:finemotor/flame_game/config/score_hud_config.dart';
import 'package:flame/components.dart';

class ScoreHud extends TextComponent {
  ScoreHud()
    : super(
        text: '0',
        anchor: Anchor.topLeft,
        position: ScoreHudConfig.position,
        textRenderer: TextPaint(style: ScoreHudConfig.textStyle),
      );

  void setScore(double score) {
    text = score.toStringAsFixed(0);
  }
}
