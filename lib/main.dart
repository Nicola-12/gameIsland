import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/controllers/game_island_controller.dart';
import 'package:game_island/controllers/transition_controller.dart';
import 'package:game_island/decorations/bonfire_decoration.dart';
import 'package:game_island/decorations/chest.dart';
import 'package:game_island/decorations/potion.dart';
import 'package:game_island/enemies/troll.dart';
import 'package:game_island/game.dart';
import 'package:game_island/interface/player_interface.dart';
import 'package:game_island/pages/home_page.dart';
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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: TransitionController(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
