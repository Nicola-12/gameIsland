import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:game_island/enemies/troll_sprite_sheet.dart';
import 'package:game_island/main.dart';

class Troll extends SimpleEnemy with ObjectCollision, UseBarLife {
  Troll(Vector2 position)
      : super(
          position: position,
          size: tileSize,
          animation: SimpleDirectionAnimation(
            idleRight: TrollSpriteSheet.idleRight,
            idleLeft: TrollSpriteSheet.idleLeft,
            runRight: TrollSpriteSheet.runRight,
            runLeft: TrollSpriteSheet.runLeft,
          ),
          speed: 30,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2(8, 5), align: Vector2(4, 11))
        ],
      ),
    );

    setupBarLife(
      barLifePosition: BarLifePorition.top,
      showLifeText: false,
      margin: 0,
      offset: Vector2(0, 5)
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) => {},
      radiusVision: tileSize.x * 1.5,
      margin: 4,
    );
    super.update(dt);
  }
}
