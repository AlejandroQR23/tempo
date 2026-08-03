import 'package:flutter/material.dart';
import 'package:tempo/screens/timer.dart';
import 'package:tempo/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempo',
      theme: AppTheme.dark,
      home: const Timer(),
    );
  }
}
