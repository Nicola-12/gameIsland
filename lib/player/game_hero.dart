import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_island/main.dart';
import 'package:game_island/sprite_sheets/hero_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting, TapGesture {
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
        collisions: [CollisionArea.rectangle(size: Vector2(8, 5), align: Vector2(4, 11))],
      ),
    );

    setupLighting(LightingConfig(
      radius: tileSize.x * 1.5,
      color: Colors.transparent,
    ));
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      _executeAttack();
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
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;

    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        HeroSpriteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    } else {
      animation?.playOnce(
        HeroSpriteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        HeroSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    } else {
      animation?.playOnce(
        HeroSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () => removeFromParent(),
      );
    }

    super.die();
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: tileSize,
      sizePush: tileSize.x / 2,
      animationRight: HeroSpriteSheet.attackRight,
    );
  }

  @override
  void onTap() {
    if (FollowerWidget.isVisible('identify')) {
      FollowerWidget.remove('identify');
    } else {
      FollowerWidget.show(
        identify: 'identify',
        context: context,
        target: this,
        align: Offset(0, 40),
        child: Card(
          child: Column(
            children: [
              Icon(Icons.add),
              Text('data'),
            ],
          ),
        ),
      );
    }
  }
}
