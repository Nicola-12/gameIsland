import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/main.dart';

class Light extends GameDecoration with Lighting {
  Light(Vector2 position)
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


  }
}
