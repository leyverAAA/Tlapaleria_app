import 'package:flutter/material.dart';

/// Botón reutilizable. Su estilo viene del elevatedButtonTheme del tema global.
class CustomButton extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final VoidCallback onPressed;
  final bool anchoCompleto;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
    this.anchoCompleto = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget boton = icono != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icono),
            label: Text(texto),
          )
        : ElevatedButton(onPressed: onPressed, child: Text(texto));

    if (anchoCompleto) {
      return SizedBox(width: double.infinity, child: boton);
    }
    return boton;
  }
}