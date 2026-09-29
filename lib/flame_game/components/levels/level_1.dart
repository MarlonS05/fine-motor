import 'dart:async';

import 'package:finemotor/flame_game/components/collidables/collision_block.dart';
import 'package:finemotor/flame_game/components/entities/drag_arrow.dart';
import 'package:finemotor/flame_game/config/collision_config.dart';
import 'package:finemotor/flame_game/config/drag_arrow_config.dart';
import 'package:finemotor/flame_game/config/levels_config.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level1 extends World {
  final String levelName = "polygon_shapes.tmx";
  final String collisionsLayerName = "line 1 collisions";

  late TiledComponent level;
  late DragArrow arrow;

  @override
  FutureOr<void> onLoad() async {
    await _loadLevel();

    Vector2 arrowSpawnpoint = _loadCollisions();

    _loadDragArrow(arrowSpawnpoint);

    return super.onLoad();
  }

  Future<void> _loadLevel() async {
    level = await TiledComponent.load(levelName, LevelsConfig.tileSize);
    await add(level);
  }

  Vector2 _loadCollisions() {
    final ObjectGroup? collisionsLayer = level.tileMap.getLayer<ObjectGroup>(
      collisionsLayerName,
    );

    Vector2 result = Vector2.all(0);

    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        if (collision.name == CollisionTypes.small.name) {
          result = collision.position;
        }
        final collisionBlock = CollisionBlock(
          position: Vector2(collision.x, collision.y),
          size: Vector2(collision.width, collision.height),
          type: collision.name,
        );
        add(collisionBlock);
      }
    }
    return result;
  }

  void _loadDragArrow(Vector2 spawnpoint) {
    final ObjectGroup? collisionsLayer = level.tileMap.getLayer<ObjectGroup>(
      collisionsLayerName,
    );

    arrow = DragArrow();
    arrow.position = spawnpoint + DragArrowConfig.positionOffset;

    add(arrow);
  }
}
