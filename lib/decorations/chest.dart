import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/decorations/decoration_sprite_sheet.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';

class Chest extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClose = false;

  Sprite? chest, chestOpen;

  Chest(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.chest,
          position: position,
          size: Vector2(16, 32),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16, 16),
            align: Vector2(0, 16),
          )
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeComponentType<GameHero>(
      observed: (player) {
        if (!_playerIsClose) {
          _playerIsClose = true;
          sprite = chestOpen;
        }
      },
      notObserved: () {
        _playerIsClose = false;
        sprite = chest;
      },
      radiusVision: tileSize.x,
    );
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    chest = await DecorationSpriteSheet.chest;
    chestOpen = await DecorationSpriteSheet.chestOpen;
    return super.onLoad();
  }

  void _showDialog() {
    showDialog(context: context, builder: (_) => AlertDialog(content: Text('Olá baú')));
  }

  @override
  void onTap() {
    if (_playerIsClose) {
      _showDialog();
    }
  }


}
