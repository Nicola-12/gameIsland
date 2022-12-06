import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/sprite_sheets/troll_sprite_sheet.dart';
import 'package:game_island/main.dart';

class Troll extends SimpleEnemy with ObjectCollision, UseBarLife, AutomaticRandomMovement {
  bool canMove = true;

  Troll(Vector2 position)
      : super(
          position: position,
          size: tileSize,
          animation: SimpleDirectionAnimation(
            idleRight: TrollSpriteSheet.idleRight,
            runRight: TrollSpriteSheet.runRight,
          ),
          speed: 30,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(8, 5),
            align: Vector2(4, 11),
          ),
        ],
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
    if (canMove && !isDead) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) => _executeAttack(),
            radiusVision: tileSize.x * 2,
            margin: 4,
          );
        },
        notObserved: () => runRandomMovement(
          dt,
          speed: 10,
          maxDistance: 30,
        ),
      );
    }

    super.update(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) async {
    if (!isDead) {
      showDamage(
        damage,
        initVelocityTop: -2,
        gravity: 0.7,
        config: const TextStyle(
          fontSize: 9,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
        ),
      );

      if (lastDirectionHorizontal == Direction.left) {
        await animation?.playOnce(
          TrollSpriteSheet.receiveDamageLeft,
          onStart: () => canMove = false,
          runToTheEnd: true,
          onFinish: () => canMove = true,
        );
      } else {
        await animation?.playOnce(
          TrollSpriteSheet.receiveDamageRight,
          onStart: () => canMove = false,
          runToTheEnd: true,
          onFinish: () => canMove = true,
        );
      }
      super.receiveDamage(attacker, damage, identify);
    }
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 10,
      size: Vector2(8, 8),
      interval: 2000,
      sizePush: tileSize.x / 2,
      animationRight: TrollSpriteSheet.attackRight,
    );
  }

  @override
  void die() async {
    if (lastDirectionHorizontal == Direction.left) {
      await animation?.playOnce(
        TrollSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    } else {
      await animation?.playOnce(
        TrollSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    }

    super.die();
  }
}
