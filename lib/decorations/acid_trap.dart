import 'package:bonfire/bonfire.dart';
import 'package:game_island/player/game_hero.dart';
import 'package:game_island/sprite_sheets/decoration_sprite_sheet.dart';

class AcidTrap extends GameDecoration with Sensor, ObjectCollision {
  AcidTrap(Vector2 position)
      : super.withAnimation(
          size: Vector2(32, 32),
          position: position,
          animation: DecorationSpriteSheet.acidTrap,
        ) {
    setupSensorArea(
      intervalCheck: 1200,
      areaSensor: [
        CollisionArea.rectangle(size: Vector2(16, 16), align: Vector2(8, 8)),
      ],
    );

    setupCollision(
      CollisionConfig(collisions: [CollisionArea.rectangle(size: Vector2(32, 10))]),
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is GameHero) {
      component.receiveDamage(AttackFromEnum.ENEMY, 5, null);
    }
  }
}
