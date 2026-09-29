import 'dart:async';

import 'package:finemotor/flame_game/components/collidables/collision_block.dart';
import 'package:finemotor/flame_game/config/collision_config.dart';
import 'package:finemotor/flame_game/config/drag_arrow_config.dart';
import 'package:finemotor/flame_game/fine_motor_game.dart';
import 'package:finemotor/logger/logger.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class DragArrow extends SpriteComponent
    with CollisionCallbacks, DragCallbacks, HasGameReference<FineMotorGame> {
  late final Set<String> unCollidedObjects;

  late bool isDragable;

  @override
  FutureOr<void> onLoad() {
    _createSprite();

    size = DragArrowConfig.size;

    _createHitbox();

    _initVars();

    debugMode = true;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    var score = 0.0;
    for (final object in unCollidedObjects) {
      if (object == CollisionTypes.small.name) {
        score += CollisionConfig.smallCollisionPoints;
      } else if (object == CollisionTypes.medium.name) {
        score += CollisionConfig.mediumCollisionPoints;
      } else if (object == CollisionTypes.large.name) {
        score += CollisionConfig.largeCollisionPoints;
      }
    }

    game.addScore(score * dt);

    super.update(dt);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (isDragable) {
      // move arrow where dragged
      position += event.localDelta;
    }
    super.onDragUpdate(event);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is CollisionBlock) {
      if (other.type == CollisionTypes.target.name) {
        isDragable = false;
        game.hitTarget();
      } else {
        unCollidedObjects.remove(other.type);
        logger.d("removing: ${other.type}");
      }
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is CollisionBlock) {
      unCollidedObjects.add(other.type);
    }
    super.onCollisionEnd(other);
  }

  void _createSprite() {
    Sprite body = Sprite(game.images.fromCache('entities/drag_arrow.png'));
    sprite = body;
  }

  void _createHitbox() {
    add(
      RectangleHitbox(
        size: DragArrowConfig.hitboxSize,
        position: DragArrowConfig.hitboxOffset,
      ),
    );
  }

  void _initVars() {
    isDragable = true;
    unCollidedObjects = {};
  }
}
