import 'package:flutter/material.dart';
import 'package:tictactoe_game/tictactoe_tile.dart';

import 'ai_game_screen.dart';

class TicTacToeBoard extends StatelessWidget {
  final List<Player> board;
  final Function(int) onTileTap;

  TicTacToeBoard(
      {required this.board, required this.onTileTap, required List tiles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: board.length,
      itemBuilder: (context, index) {
        return TicTacToeTile(
          player: board[index],
          onTap: () {
            onTileTap(index);
          },
        );
      },
    );
  }
}
