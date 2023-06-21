import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> board;
  late String currentPlayer;
  late bool gameOver;
  late int scoreX;
  late int scoreO;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
    currentPlayer = 'X';
    gameOver = false;
    scoreX = 0;
    scoreO = 0;
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && !gameOver) {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWinner(row, col)) {
          showWinnerDialog();
          gameOver = true;
          updateScore();
        } else if (checkDraw()) {
          showDrawDialog();
          gameOver = true;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool checkWinner(int row, int col) {
    // Check row
    if (board[row][0] == board[row][1] &&
        board[row][1] == board[row][2] &&
        board[row][0] != '') {
      return true;
    }
    // Check column
    if (board[0][col] == board[1][col] &&
        board[1][col] == board[2][col] &&
        board[0][col] != '') {
      return true;
    }
    // Check diagonal
    if ((board[0][0] == board[1][1] &&
            board[1][1] == board[2][2] &&
            board[0][0] != '') ||
        (board[0][2] == board[1][1] &&
            board[1][1] == board[2][0] &&
            board[0][2] != '')) {
      return true;
    }
    return false;
  }

  bool checkDraw() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col] == '') {
          return false;
        }
      }
    }
    return true;
  }

  void showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$currentPlayer wins!'),
              SizedBox(height: 10),
              Text('Scores: X - $scoreX, O - $scoreO'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.pop(context);
                startNewGame();
              },
            ),
          ],
        );
      },
    );
  }

  void showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('It\'s a draw!'),
              SizedBox(height: 10),
              Text('Scores: X - $scoreX, O - $scoreO'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.pop(context);
                startNewGame();
              },
            ),
          ],
        );
      },
    );
  }

  void updateScore() {
    if (currentPlayer == 'X') {
      setState(() {
        scoreX++;
      });
    } else {
      setState(() {
        scoreO++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Player: $currentPlayer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final int row = index ~/ 3;
                final int col = index % 3;
                return GestureDetector(
                  onTap: () => makeMove(row, col),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: board[row][col] == 'X'
                          ? Colors.red
                          : (board[row][col] == 'O'
                              ? Colors.blue
                              : Colors.white),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scores: X - $scoreX, O - $scoreO'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
