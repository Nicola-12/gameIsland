
import 'package:flutter/material.dart';
import 'package:game_island/game.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/maps/forest/island.png',
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'GAME ISLAND',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'Common Pixel',
                    fontSize: 30,
                    letterSpacing: 10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(Game.route(), (route) => false),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    boxShadow: [BoxShadow(color: Colors.blueAccent)],
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  width: 100,
                  height: 70,
                  child: Image.asset('assets/images/start.png', width: 100, height: 70, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
