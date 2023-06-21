import 'package:flutter/material.dart';
import 'package:tictactoe_game/game_screen.dart';
import 'package:tictactoe_game/cara_bermain.dart';
import 'package:tictactoe_game/informasi_pengembang.dart';
import 'package:tictactoe_game/ai_game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Mulai Game'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaraBermainScreen()),
                );
              },
              child: Text('Cara Bermain'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InformasiPengembangScreen()),
                );
              },
              child: Text('About Game'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AIGameScreen()),
                );
              },
              child: Text('Melawan AI'),
            ),
          ],
        ),
      ),
    );
  }
}
