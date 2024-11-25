import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: AppTheme.lightTheme,
    );
  }
}
