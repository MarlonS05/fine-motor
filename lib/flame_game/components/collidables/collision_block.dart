import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  CollisionBlock({super.position, super.size, required this.type}) : super();

  final String type;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    add(RectangleHitbox(
      isSolid: true,
      collisionType: CollisionType.passive,
    ));
    return super.onLoad();
  }
}
