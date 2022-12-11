import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/sprite_sheets/decoration_sprite_sheet.dart';

class Torch extends GameDecoration with Lighting {
  Torch(Vector2 position)
      : super.withAnimation(
          position: position,
          size: Vector2(16, 16),
          animation: DecorationSpriteSheet.torch,
        ) {
    setupLighting(
      LightingConfig(
        radius: 20,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
      ),
    );
  }
}
