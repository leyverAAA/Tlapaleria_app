import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF8C00),
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xFFFF8C00),
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFFFFE0B2),
          onPrimaryContainer: const Color(0xFF7A3E00),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFFFF3E0),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
