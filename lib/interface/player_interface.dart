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
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade400,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Image.asset('assets/images/heart.png'),
                ),
              ],
            ),
            Container(
              width: widget.game.player?.maxLife,
              height: 15,
              decoration: BoxDecoration(
                color: const Color.fromARGB(204, 0, 0, 0),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.shade400,
                    spreadRadius: 1.5,
                  )
                ],
              ),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.centerLeft,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: currentWidth,
                    height: 15,
                    color: Colors.redAccent,
                  ),
                ],
              ),
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
