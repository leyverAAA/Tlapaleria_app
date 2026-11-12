import 'package:flutter/material.dart';

import '/core/theme/app_theme.dart';

/// Lenguaje visual por categoría: ícono, degradado y color de acento.
///
/// Se usa como sustituto de fotografía de producto mientras el catálogo
/// no cuente con imágenes propias, manteniendo cada categoría reconocible.
class CategoryVisual {
  final IconData icon;
  final List<Color> gradient;
  final Color accent;

  const CategoryVisual({
    required this.icon,
    required this.gradient,
    required this.accent,
  });

  static CategoryVisual of(String category) {
    switch (category.trim().toLowerCase()) {
      case 'herramientas':
        return const CategoryVisual(
          icon: Icons.handyman_outlined,
          gradient: [Color(0xFFFFF3E4), Color(0xFFFFDCA8)],
          accent: AppColors.primaryOrange,
        );
      case 'medición':
      case 'medicion':
        return const CategoryVisual(
          icon: Icons.straighten_rounded,
          gradient: [Color(0xFFEAF4F7), Color(0xFFCFE5EC)],
          accent: Color(0xFF0F6B80),
        );
      case 'fijación':
      case 'fijacion':
        return const CategoryVisual(
          icon: Icons.push_pin_outlined,
          gradient: [Color(0xFFF2F2F7), Color(0xFFDEDEEA)],
          accent: Color(0xFF4C4C68),
        );
      case 'protección':
      case 'proteccion':
        return const CategoryVisual(
          icon: Icons.health_and_safety_outlined,
          gradient: [Color(0xFFEFF6EC), Color(0xFFD8E9CC)],
          accent: Color(0xFF3F6212),
        );
      case 'pinturas':
        return const CategoryVisual(
          icon: Icons.format_paint_outlined,
          gradient: [Color(0xFFFFF0E8), Color(0xFFFFCDB3)],
          accent: Color(0xFFB45309),
        );
      case 'ferretería':
      case 'ferreteria':
        return const CategoryVisual(
          icon: Icons.build_outlined,
          gradient: [Color(0xFFF5F5F4), Color(0xFFE3E1DE)],
          accent: Color(0xFF44403C),
        );
      case 'construcción':
      case 'construccion':
        return const CategoryVisual(
          icon: Icons.engineering_outlined,
          gradient: [Color(0xFFFFF7DB), Color(0xFFFFE39A)],
          accent: Color(0xFFA16207),
        );
      default:
        return const CategoryVisual(
          icon: Icons.inventory_2_outlined,
          gradient: [Color(0xFFFFF1E0), Color(0xFFFFE0BC)],
          accent: AppColors.primaryOrange,
        );
    }
  }
}
