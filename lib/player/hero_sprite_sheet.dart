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

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'attacks/attack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static FutureOr<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'attacks/attack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16)
        ),
      );

  static FutureOr<SpriteAnimation> get attackBottom => SpriteAnimation.load(
        'attacks/attack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static FutureOr<SpriteAnimation> get attackTop => SpriteAnimation.load(
        'attacks/attack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
