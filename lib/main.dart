import 'package:flutter/material.dart';
import 'package:saude_em_dia_2/components/home_view.dart';

void main() {
  runApp(SaudeEmDiaApp());
}

class SaudeEmDiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde em Dia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
