import 'package:flutter/material.dart';
import 'package:tictactoe_game/home_screen.dart';
import 'package:tictactoe_game/informasi_pengembang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/informasi_pengembang': (context) => InformasiPengembangScreen(),
      },
    );
  }
}
