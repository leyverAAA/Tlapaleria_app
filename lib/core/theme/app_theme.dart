import 'package:flutter/material.dart';

class AppColors {
  static const Color primario = Color.fromARGB(255, 191, 54, 12); // naranja quemado
  static const Color primarioClaro = Color.fromARGB(255, 255, 243, 224); // crema
  static const Color acento = Color.fromARGB(255, 55, 71, 79); // gris carbón
  static const Color textoPrincipal = Color.fromARGB(255, 33, 33, 33);
  static const Color textoSecundario = Color.fromARGB(255, 84, 110, 122);
  static const Color fondo = Color.fromARGB(255, 245, 245, 245);
  static const Color blanco = Colors.white;
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fondo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      primary: AppColors.primario,
      secondary: AppColors.acento,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.acento,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textoPrincipal,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textoPrincipal,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textoPrincipal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textoSecundario,
      ),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.primarioClaro,
      selectedColor: AppColors.primario,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(color: AppColors.textoPrincipal),
      side: BorderSide(color: AppColors.acento),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.textoPrincipal,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}