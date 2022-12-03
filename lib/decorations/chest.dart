import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/sprite_sheets/decoration_sprite_sheet.dart';
import 'package:game_island/decorations/potion.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';

class Chest extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClose = false;
  bool _open = false;

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
            size: Vector2(16, 12),
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
        if (!_playerIsClose && !_open) {
          _playerIsClose = true;
          sprite = chestOpen;
        }
      },
      notObserved: () {
        if (!_open) {
          _playerIsClose = false;
          sprite = chest;
        }
      },
      radiusVision: tileSize.x + 4,
      angle: 2,
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
    if (_playerIsClose && !_open) {
      // _showDialog();
      _open = true;
      gameRef.add(Potion(transform.position.translate(tileSize.x, 0)));
    }
  }
}
