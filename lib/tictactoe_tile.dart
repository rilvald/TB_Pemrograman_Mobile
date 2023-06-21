import 'package:flutter/material.dart';
import 'package:tictactoe_game/ai_game_screen.dart';

class TicTacToeTile extends StatelessWidget {
  final String? symbol;
  final VoidCallback onTap;

  TicTacToeTile({this.symbol, required this.onTap, required Player player});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            symbol ?? '',
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }
}
