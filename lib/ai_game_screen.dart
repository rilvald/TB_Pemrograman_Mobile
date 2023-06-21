import 'package:flutter/material.dart';
import 'package:tictactoe_game/tictactoe_board.dart';
import 'package:tictactoe_game/tictactoe_tile.dart';

enum Player { x, o, none }

class AIGameScreen extends StatefulWidget {
  @override
  _AIGameScreenState createState() => _AIGameScreenState();
}

class _AIGameScreenState extends State<AIGameScreen> {
  late List<Player> _board;
  late Player _currentPlayer;
  late bool _isGameOver;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

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
            TicTacToeBoard(
              board: _board,
              onTileTap: _makeMove,
              tiles: [],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }

  void _makeMove(int index) {
    if (!_isGameOver && _board[index] == Player.none) {
      setState(() {
        _board[index] = _currentPlayer;
        _currentPlayer = _currentPlayer == Player.x ? Player.o : Player.x;
        if (_isWin(Player.x) || _isWin(Player.o) || _isDraw()) {
          _isGameOver = true;
        }

        if (!_isGameOver && _currentPlayer == Player.o) {
          _makeAIMove();
        }
      });
    }
  }

  void _makeAIMove() {
    int bestScore = -9999;
    int bestMove = -1;

    for (int i = 0; i < _board.length; i++) {
      if (_board[i] == Player.none) {
        _board[i] = Player.o;

        int score = _minimax(_board, 0, false);
        _board[i] = Player.none;

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    _makeMove(bestMove);
  }

  int _minimax(List<Player> board, int depth, bool isMaximizing) {
    if (_isWin(Player.x)) {
      return -1;
    } else if (_isWin(Player.o)) {
      return 1;
    } else if (_isDraw()) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -9999;

      for (int i = 0; i < board.length; i++) {
        if (board[i] == Player.none) {
          board[i] = Player.o;

          int score = _minimax(board, depth + 1, false);
          board[i] = Player.none;

          if (score > bestScore) {
            bestScore = score;
          }
        }
      }

      return bestScore;
    } else {
      int bestScore = 9999;

      for (int i = 0; i < board.length; i++) {
        if (board[i] == Player.none) {
          board[i] = Player.x;

          int score = _minimax(board, depth + 1, true);
          board[i] = Player.none;

          if (score < bestScore) {
            bestScore = score;
          }
        }
      }

      return bestScore;
    }
  }

  bool _isWin(Player player) {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      if (_board[combination[0]] == player &&
          _board[combination[1]] == player &&
          _board[combination[2]] == player) {
        return true;
      }
    }

    return false;
  }

  bool _isDraw() {
    return !_board.contains(Player.none);
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, Player.none);
      _currentPlayer = Player.x;
      _isGameOver = false;
    });
  }
}
