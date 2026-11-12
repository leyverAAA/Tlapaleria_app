import 'package:flutter/material.dart';

import '/core/theme/app_theme.dart';
import '/core/utils/category_visual.dart';

/// Tile ilustrado que representa un producto a partir de su categoría.
///
/// Deja el espacio listo para recibir fotografía real más adelante sin
/// cambiar la estructura de las tarjetas.
class ProductImageTile extends StatelessWidget {
  final String category;
  final double iconSize;
  final BorderRadius borderRadius;
  final bool showMark;

  const ProductImageTile({
    super.key,
    required this.category,
    this.iconSize = 48,
    this.borderRadius = AppRadius.lgAll,
    this.showMark = true,
  });

  @override
  Widget build(BuildContext context) {
    final visual = CategoryVisual.of(category);

    return ClipRRect(
      borderRadius: borderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: visual.gradient,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (showMark)
              Positioned(
                right: -iconSize * 0.35,
                bottom: -iconSize * 0.35,
                child: Icon(
                  visual.icon,
                  size: iconSize * 2.1,
                  color: visual.accent.withValues(alpha: 0.08),
                ),
              ),
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: 26,
                height: 4,
                decoration: BoxDecoration(
                  color: visual.accent.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            Center(
              child: Icon(visual.icon, size: iconSize, color: visual.accent),
            ),
          ],
        ),
      ),
    );
  }
}
