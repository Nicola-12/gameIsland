import 'dart:async';

import 'package:bonfire/bonfire.dart';

class HeroSpriteSheet {
  static FutureOr<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  static FutureOr<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  static FutureOr<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  static FutureOr<SpriteAnimation> get runRight => SpriteAnimation.load(
        'fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );
}
