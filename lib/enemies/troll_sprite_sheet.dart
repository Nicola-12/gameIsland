import 'dart:async';

import 'package:bonfire/bonfire.dart';

class TrollSpriteSheet {
  static FutureOr<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  static FutureOr<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  static FutureOr<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  static FutureOr<SpriteAnimation> get runRight => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  static FutureOr<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 96),
        ),
      );

  static FutureOr<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(
        'troll_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 96),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
    'attacks/attack_effect_right.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16, 16),
    ),
  );
}
