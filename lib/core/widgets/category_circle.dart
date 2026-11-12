import 'package:flutter/material.dart';

import '/core/theme/app_theme.dart';
import '/core/utils/category_visual.dart';

/// Círculo de categoría al estilo del catálogo de referencia.
class CategoryCircle extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryCircle({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAll = label == 'Todos';
    final visual = CategoryVisual.of(label);
    final icon = isAll ? Icons.apps_rounded : visual.icon;

    return Semantics(
      button: true,
      selected: selected,
      label: 'Categoría $label',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.primaryOrange : null,
                  gradient: selected
                      ? null
                      : LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: visual.gradient,
                        ),
                  border: Border.all(
                    color: selected ? AppColors.primaryOrange : Colors.white,
                    width: 2,
                  ),
                  boxShadow: selected ? AppShadows.card : null,
                ),
                child: Icon(
                  icon,
                  size: 25,
                  color: selected ? Colors.white : visual.accent,
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                width: 84,
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.bodyFont,
                    fontSize: 11.5,
                    height: 1.2,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected
                        ? AppColors.primaryOrange
                        : AppColors.inkMuted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
