import 'dart:async';

import 'package:finemotor/flame_game/components/collidables/collision_block.dart';
import 'package:finemotor/flame_game/config/levels_config.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World with HasCollisionDetection {
  late String levelName;
  late String collisionsLayerName;
  Level(this.levelName, this.collisionsLayerName);

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    await _loadLevel();

    _loadCollisions();

    return super.onLoad();
  }

  Future<void> _loadLevel() async {
    level = await TiledComponent.load(levelName, LevelsConfig.tileSize);
    await add(level);
  }

  void _loadCollisions() {
    final ObjectGroup? collisionsLayer = level.tileMap.getLayer<ObjectGroup>(collisionsLayerName);

    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        final collisionBlock = CollisionBlock(
          position: Vector2(collision.x, collision.y),
          size: Vector2(collision.width, collision.height),
          type:  collision.name
        );
        add(collisionBlock);
      }
    }
  }
}
