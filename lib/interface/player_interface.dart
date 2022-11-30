import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

class PlayerInterface extends StatefulWidget {
  static const String overlayKey = 'playerInterface';

  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  final BonfireGame game;

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late async.Timer _lifeTime;
  late double currentWidth;

  double life = 0;

  @override
  void initState() {
    _lifeTime = async.Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    currentWidth = widget.game.player?.maxLife ?? 100;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 10),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: widget.game.player?.maxLife,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  width: currentWidth,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _verifyLife(async.Timer timer) {
    if (life != widget.game.player?.life) {
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life / (widget.game.player?.maxLife ?? 0);
        currentWidth = (widget.game.player?.maxLife ?? 0) * percent;
      });
    }
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }
}
