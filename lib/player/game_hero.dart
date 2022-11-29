import 'package:bonfire/bonfire.dart';
import 'package:game_island/main.dart';
import 'package:game_island/player/hero_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
          position: position,
          size: tileSize,
          animation: SimpleDirectionAnimation(
            idleRight: HeroSpriteSheet.idleRight,
            idleLeft: HeroSpriteSheet.idleLeft,
            runRight: HeroSpriteSheet.runRight,
            runLeft: HeroSpriteSheet.runLeft,
          ),
          speed: 50,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2(8, 5), align: Vector2(4, 11))
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: tileSize,
      sizePush: tileSize.x / 2,
      animationRight: HeroSpriteSheet.attackRight,
    );
  }
}
