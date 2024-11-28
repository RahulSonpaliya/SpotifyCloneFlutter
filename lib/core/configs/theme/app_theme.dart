import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTheme {
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
