
import 'package:bonfire/bonfire.dart';
import 'package:game_island/decorations/bonfire_decoration.dart';
import 'package:game_island/decorations/chest.dart';
import 'package:game_island/decorations/potion.dart';
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
}
