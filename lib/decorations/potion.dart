import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/sprite_sheets/decoration_sprite_sheet.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';

class Potion extends GameDecoration with Lighting, Sensor {
  Potion(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.potion,
          position: position,
          size: Vector2(8, 8),
        ) {
    setupLighting(
      LightingConfig(
        radius: 4,
        color: Colors.red.withOpacity(0.6),
      ),
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is GameHero) {
      component.addLife(20);
      removeFromParent();
    }
  }

  @override
  void onMount() {
    final Vector2 initialPosition = position.translate(0, tileSize.y);
    final double trailX = tileSize.x * Random().nextDouble();
    final double trailY = tileSize.x / 2;

    generateValues(
      const Duration(milliseconds: 500),
      end: 0.5,
      onChange: (value) {
        double newX = Curves.decelerate.transform(value);
        double newY = Curves.bounceInOut.transform(value);
       position = initialPosition.translate(trailX * newX, newY * trailY);
      },
    ).start();

    super.onMount();
  }
}
