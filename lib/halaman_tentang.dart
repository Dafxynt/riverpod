import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: Text('Aplikasi ini menghitung volume dan luas permukaan bangun ruang.'),
      ),
    );
  }
}
