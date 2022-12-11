import 'package:bonfire/bonfire.dart';
import 'package:game_island/sprite_sheets/decoration_sprite_sheet.dart';

class UpDoor extends GameDecoration {
  UpDoor(Vector2 position)
      : super.withSprite(
          position: position,
          size: Vector2(16, 16),
          sprite: DecorationSpriteSheet.upDoor,
        );
}
