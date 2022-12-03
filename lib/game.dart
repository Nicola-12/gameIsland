import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/controllers/game_island_controller.dart';
import 'package:game_island/decorations/bonfire_decoration.dart';
import 'package:game_island/decorations/chest.dart';
import 'package:game_island/decorations/potion.dart';
import 'package:game_island/enemies/troll.dart';
import 'package:game_island/interface/player_interface.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';

enum GameStage { forestStage, nextStage }

class Game extends StatefulWidget {
  const Game({Key? key, this.stage = GameStage.forestStage}) : super(key: key);

  final GameStage stage;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // joystick: JoystickMoveToPosition(),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(color: Colors.orange.shade200),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orange.shade200,
            margin: const EdgeInsets.all(40),
          ),
        ],
      ),
      map: WorldMapByTiled(
        'maps/island.json',
        objectsBuilder: {
          'troll': (properties) => Troll(properties.position),
          'lamp': (properties) => BonfireDecoration(properties.position),
          'chest': (properties) => Chest(properties.position),
          'potion': (properties) => Potion(properties.position),
        },
      ),
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        GameIslandController(widget.stage),
      ],
      player: GameHero(
        Vector2(19 * tileSize.x, 13 * tileSize.y),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 2.5,
        // smoothCameraEnabled: true,
        sizeMovementWindow: Vector2(tileSize.x * 3, tileSize.y * 3),
      ),
      lightingColorGame: Colors.black.withOpacity(0.8),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(game: game),
      },
      // showCollisionArea: true,
    );
  }
}
