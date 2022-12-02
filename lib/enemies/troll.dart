import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:game_island/enemies/troll_sprite_sheet.dart';
import 'package:game_island/main.dart';

class Troll extends SimpleEnemy with ObjectCollision, UseBarLife {
  bool canMove = true;

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
        collisions: [CollisionArea.rectangle(size: Vector2(8, 5), align: Vector2(4, 11))],
      ),
    );

    setupBarLife(
      size: Vector2(10, 1),
      barLifePosition: BarLifePorition.top,
      showLifeText: false,
      margin: 0,
      offset: Vector2(0, 4),
      borderWidth: 2,
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) => _executeAttack(),
        radiusVision: tileSize.x * 2,
        margin: 4,
      );
    }
    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        TrollSpriteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    } else {
      animation?.playOnce(
        TrollSpriteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 10,
      size: tileSize,
      sizePush: tileSize.x / 2,
      animationRight: TrollSpriteSheet.attackRight,
    );
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        TrollSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    } else {
      animation?.playOnce(
        TrollSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    }

    super.die();
  }
}
