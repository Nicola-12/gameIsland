import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/decorations/decoration_sprite_sheet.dart';
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
}
