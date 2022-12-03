import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_island/game.dart';

class GameIslandController extends GameComponent {
  GameIslandController(this.stage);

  bool endGame = false;
  bool gameOver = false;

  final GameStage stage;

  @override
  void update(double dt) {
    if (checkInterval('end_game', 500, dt)) {
      if (gameRef.livingEnemies().isEmpty && !endGame) {
        endGame = true;

        _showDialog('Map cleared!!', 'Next stage', () => _goToStage(GameStage.nextStage));
      }
    }

    if (checkInterval('game_over', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;

        _showDialog('GAME OVER', 'Try again', () => _goToStage(stage));
      }
    }
    super.update(dt);
  }

  void _goToStage(GameStage stage) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Game(stage: GameStage.nextStage),
      ),
      (route) => false,
    );
  }

  void _showDialog(String content, String buttonText, Function() onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            )
          ],
        );
      },
    );
  }
}
