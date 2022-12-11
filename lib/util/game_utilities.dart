import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/decorations/acid_trap.dart';
import 'package:game_island/decorations/bonfire_decoration.dart';
import 'package:game_island/decorations/bottom_door.dart';
import 'package:game_island/decorations/button.dart';
import 'package:game_island/decorations/chest.dart';
import 'package:game_island/decorations/light.dart';
import 'package:game_island/decorations/potion.dart';
import 'package:game_island/decorations/torch.dart';
import 'package:game_island/decorations/up_door.dart';
import 'package:game_island/enemies/skeleton.dart';
import 'package:game_island/enemies/troll.dart';
import 'package:game_island/game.dart';
import 'package:game_island/main.dart';

class GameUtilities {
  static GameMap getMapFromStage(GameStage stage) {
    switch (stage) {
      case GameStage.forestStage:
        return WorldMapByTiled(
          'maps/forest/island.json',
          objectsBuilder: {
            'troll': (properties) => Troll(properties.position),
            'lamp': (properties) => BonfireDecoration(properties.position),
            'chest': (properties) => Chest(properties.position),
            'potion': (properties) => Potion(properties.position),
          },
        );
      case GameStage.dungeon:
        return WorldMapByTiled(
          'maps/dungeon/dungeon_map.json',
          objectsBuilder: {
            'skeleton': (properties) => Skeleton(properties.position),
            'lamp': (properties) => BonfireDecoration(properties.position),
            'chest': (properties) => Chest(properties.position),
            'torch': (properties) => Torch(properties.position),
            'acid': (properties) => AcidTrap(properties.position),
            'up_door': (properties) => UpDoor(properties.position),
            'bottom_door': (properties) => BottomDoor(properties.position),
            'light': (properties) => Light(properties.position),
            'button': (properties) => Button(properties.position)
          },
        );
    }
  }

  static Vector2 getPlayerPosition(GameStage stage) {
    switch (stage) {
      case GameStage.forestStage:
        return Vector2(19 * tileSize.x, 13 * tileSize.y);

      case GameStage.dungeon:
        return Vector2(13 * tileSize.x, 17 * tileSize.y);
    }
  }

  static Color getColorGame(GameStage stage) {
    switch (stage) {
      case GameStage.forestStage:
        return Colors.black.withOpacity(0.3);
      case GameStage.dungeon:
        return Colors.black.withOpacity(0.8);
    }
  }
}
