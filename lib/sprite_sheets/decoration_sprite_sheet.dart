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

  static FutureOr<SpriteAnimation> get torch => SpriteAnimation.load(
        'torch.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(32, 32),
          stepTime: 0.15,
          amountPerRow: 3,
          texturePosition: Vector2(0, 0),
        ),
      );

  static FutureOr<SpriteAnimation> get acidTrap async => SpriteAnimation.variableSpriteList(
        [
          ...(await trap).frames.map((e) => e.sprite),
          ...(await acid).frames.map((e) => e.sprite),
        ],
        stepTimes: [
          ...(await trap).frames.map((e) => e.stepTime),
          ...(await acid).frames.map((e) => e.stepTime),
        ],
      );

  static FutureOr<SpriteAnimation> get trap => SpriteAnimation.load(
        'maps/dungeon/traps_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(16, 64),
        ),
      );

  static FutureOr<SpriteAnimation> get acid => SpriteAnimation.load(
        'maps/dungeon/acid_.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(16, 16),
          amountPerRow: 4,
        ),
      );

  static FutureOr<Sprite> get upDoor => Sprite.load(
        'maps/dungeon/dungeonDecoration_1.png',
        srcPosition: Vector2(464, 176),
        srcSize: Vector2(16, 16),
      );

  static FutureOr<Sprite> get bottomDoor => Sprite.load(
        'maps/dungeon/dungeonDecoration_1.png',
        srcPosition: Vector2(464, 192),
        srcSize: Vector2(16, 16),
      );

  static FutureOr<Sprite> get button => Sprite.load(
        'maps/dungeon/traps_.png',
        srcSize: Vector2(16, 16),
        srcPosition: Vector2(112, 32),
      );
}
