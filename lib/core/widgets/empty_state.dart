import 'package:flutter/material.dart';

import 'package:tlapaleria_app/core/theme/app_theme.dart';
import 'package:tlapaleria_app/core/widgets/custom_button.dart';

/// Mensaje para pantallas sin contenido (búsqueda sin resultados, carrito vacío).
class EmptyState extends StatelessWidget {
  final IconData icono;
  final String mensaje;
  final String? textoBoton;
  final VoidCallback? onPressed;

  const EmptyState({
    super.key,
    required this.icono,
    required this.mensaje,
    this.textoBoton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 64, color: AppColors.textoSecundario),
            const SizedBox(height: AppSpacing.md),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (textoBoton != null && onPressed != null) ...[
              const SizedBox(height: AppSpacing.lg),
              CustomButton(texto: textoBoton!, onPressed: onPressed!),
            ],
          ],
        ),
      ),
    );
  }
}