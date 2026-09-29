import 'dart:async';
import 'dart:ui';

import 'package:finemotor/flame_game/components/hud/score_hud.dart';
import 'package:finemotor/flame_game/components/levels/level_1.dart';
import 'package:finemotor/flame_game/config/setup_config.dart';
import 'package:finemotor/logger/logger.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class FineMotorGame extends FlameGame
    with DragCallbacks, HasCollisionDetection {
  final VoidCallback onGameOver;

  FineMotorGame({required this.onGameOver});

  @override
  Color backgroundColor() => SetupConfig.backgroundColor;

  late final CameraComponent cameraComponent;
  late double score;
  late ScoreHud _scoreHud;

  bool isGameOver = false;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    _gameInit();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  void _gameInit() {
    // add level 1
    World world = Level1();
    _createCamera(world);

    addAll([world, cameraComponent]);

    score = 0;

    _scoreHud = ScoreHud();
    cameraComponent.viewport.add(_scoreHud);
    _scoreHud.setScore(score);
  }

  void _createCamera(World world) {
    // Add camera and game screen size
    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: SetupConfig.cameraWidth,
      height: SetupConfig.cameraHeight,
    );
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
  }

  void addScore(double addition) {
    if (!isGameOver) {
      score += addition;
      _scoreHud.setScore(score);
    }
  }

  void hitTarget() {
    isGameOver = true;
    onGameOver();
    logger.d("game over, final score: $score");
  }
}
