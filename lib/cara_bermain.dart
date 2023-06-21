import 'package:flutter/material.dart';

class CaraBermainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Bermain'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cara Bermain Tic-Tac-Toe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Tic-Tac-Toe adalah permainan yang dimainkan di atas papan kotak berukuran 3x3. Dua pemain bergantian menempatkan simbol mereka (X atau O) pada kotak-kotak papan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Tujuan permainan adalah untuk menempatkan tiga simbol yang sama secara horizontal, vertikal, atau diagonal.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Permainan berakhir jika salah satu pemain berhasil mendapatkan tiga simbol yang sama secara berurutan atau jika seluruh kotak pada papan telah terisi tanpa ada pemenang.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Selamat bermain!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
