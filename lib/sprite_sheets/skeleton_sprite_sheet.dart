import 'dart:async';

import 'package:bonfire/bonfire.dart';

class SkeletonSpriteSheet {
  static FutureOr<SpriteAnimation> get idleRight => SpriteAnimation.load(
    'skeleton.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.3,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 24),
    ),
  );

  static FutureOr<SpriteAnimation> get runRight => SpriteAnimation.load(
    'skeleton.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 48),
    ),
  );

}
