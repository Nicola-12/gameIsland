import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/main.dart';

class BonfireDecoration extends GameDecoration with Lighting {
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
  }
}
