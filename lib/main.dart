import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/decorations/bonfire_decoration.dart';
import 'package:game_island/enemies/troll.dart';
import 'package:game_island/interface/player_interface.dart';
import 'package:game_island/player/game_hero.dart';

Vector2 get tileSize => Vector2(16, 16);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // joystick: JoystickMoveToPosition(),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(color: Colors.orange.shade300),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orange.shade300,
            margin: const EdgeInsets.all(40),
          ),
        ],
      ),
      map: WorldMapByTiled(
        'maps/island.json',
        objectsBuilder: {
          'troll': (properties) => Troll(properties.position),
          'lamp': (properties) => BonfireDecoration(properties.position),
        },
      ),
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      player: GameHero(
        Vector2(19 * tileSize.x, 13 * tileSize.y),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 2.5,
        smoothCameraEnabled: true,
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
