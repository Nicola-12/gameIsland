import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/controllers/game_island_controller.dart';
import 'package:game_island/interface/player_interface.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/game_hero.dart';
import 'package:game_island/util/game_utilities.dart';

enum GameStage { forestStage, dungeon }

class Game extends StatefulWidget {
  static Route route({GameStage stage = GameStage.dungeon}) => MaterialPageRoute(
        builder: (context) => Game(stage: stage),
      );

  const Game({Key? key, this.stage = GameStage.dungeon}) : super(key: key);

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
        directional: JoystickDirectional(
          color: Colors.orange.shade200,
          spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
          spriteKnobDirectional: Sprite.load('joystick_knob.png'),
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            size: 70,
            sprite: Sprite.load('joystick_attack.png'),
            color: Colors.orange.shade200,
            margin: const EdgeInsets.only(bottom: 60, right: 40),
          ),
        ],
      ),
      map: GameUtilities.getMapFromStage(widget.stage),
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        GameIslandController(widget.stage),
      ],
      player: GameHero(GameUtilities.getPlayerPosition(widget.stage)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 2.5,
        // smoothCameraEnabled: true,
        sizeMovementWindow: Vector2(tileSize.x * 3, tileSize.y * 3),
      ),
      lightingColorGame: Colors.black.withOpacity(0.4),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(game: game),
      },
      showCollisionArea: true,
    );
  }
}
