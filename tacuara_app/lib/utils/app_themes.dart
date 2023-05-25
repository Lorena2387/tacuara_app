import 'package:flutter/material.dart';

class AppThemes {
  static const primaryColor = Color(0xFF1B5E20);
  static const secundaryColor = Color(0xFFf7f6f4);
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0Xff1b5e20),
      seedColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.black87,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
  );
}
