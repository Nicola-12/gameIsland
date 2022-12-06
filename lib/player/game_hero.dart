import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_island/main.dart';
import 'package:game_island/sprite_sheets/hero_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
  bool canMove = true;

  GameHero(Vector2 position)
      : super(
          position: position,
          size: tileSize,
          animation: SimpleDirectionAnimation(
            idleRight: HeroSpriteSheet.idleRight,
            runRight: HeroSpriteSheet.runRight,
          ),
          speed: 50,
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

    setupLighting(LightingConfig(
      radius: tileSize.x * 0.7,
      color: Colors.transparent,
    ));
  }

  @override
  void joystickAction(JoystickActionEvent event) async {
    if (event.event == ActionEvent.DOWN && (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      await _executeAttack();
    }
    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  @override
  Future<void> receiveDamage(AttackFromEnum attacker, double damage, identify) async {
    canMove = false;

    if (lastDirectionHorizontal == Direction.left) {
      await animation?.playOnce(
        HeroSpriteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    } else {
      await animation?.playOnce(
        HeroSpriteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() async {
    if (lastDirectionHorizontal == Direction.left) {
      await animation?.playOnce(
        HeroSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    } else {
      await animation?.playOnce(
        HeroSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    }

    super.die();
  }

  FutureOr<void> _executeAttack() async {
    simpleAttackMelee(
      damage: 20,
      size: tileSize.copyWith(x: 8, y: 8),
      sizePush: tileSize.x / 2,
      animationRight: HeroSpriteSheet.attackRight,
    );

    await Future.delayed(const Duration(milliseconds: 2000));
  }
}
