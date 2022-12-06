import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';

class BonfireDecoration extends GameDecoration with Lighting, Sensor, ObjectCollision {
  BonfireDecoration(Vector2 position)
      : super(
          position: position,
          size: tileSize,
        ) {
    setupLighting(
      LightingConfig(
        radius: tileSize.x * 1.5,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
      ),
    );

    setupSensorArea(
      areaSensor: [
        CollisionArea.circle(radius: 8),
      ],
      intervalCheck: 1000,
    );
  }

  @override
  void onContact(GameComponent component) async {
    if (component is GameHero) {
      await component.receiveDamage(AttackFromEnum.ENEMY, 5, null);
    }
  }
}
