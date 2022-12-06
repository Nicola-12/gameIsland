import 'dart:async';

import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet {
  static FutureOr<Sprite> get chest => Sprite.load(
        'maps/forest/forestDecoration_0.png',
        srcPosition: Vector2(32, 96),
        srcSize: Vector2(16, 32),
      );

  static FutureOr<Sprite> get chestOpen => Sprite.load(
        'maps/forest/forestDecoration_0.png',
        srcPosition: Vector2(48, 96),
        srcSize: Vector2(16, 32),
      );

  static FutureOr<Sprite> get potion => Sprite.load(
        'shiny_potions.png',
        srcPosition: Vector2(32, 0),
        srcSize: Vector2(16, 16),
      );
}
