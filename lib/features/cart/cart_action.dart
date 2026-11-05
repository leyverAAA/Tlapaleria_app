import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tlapaleria_app/features/cart/cart_provider.dart';
import 'package:tlapaleria_app/features/cart/cart_screen.dart';

/// Icono del carrito con contador para la AppBar.
/// Usa watch para redibujarse cuando cambia la cantidad.
class CartAction extends StatelessWidget {
  const CartAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cantidad = context.watch<CartProvider>().cantidadTotal;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          tooltip: 'Carrito',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: Text(
              '$cantidad',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}