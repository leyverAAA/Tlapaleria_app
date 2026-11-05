import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/cart/cart_provider.dart';
import '../routes/app_routes.dart';

/// Botón reutilizable para acceder a la venta actual con contador.
/// Mantiene la navegación consistente en las pantallas POS.
class CartActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const CartActionButton({
    super.key,
    this.icon = Icons.point_of_sale,
    this.tooltip = 'Venta actual',
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = context.watch<CartProvider>().itemCount;
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
      tooltip: tooltip,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon),
          if (itemCount > 0)
            Positioned(
              right: -4,
              top: -4,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: colorScheme.error,
                child: Text(
                  '$itemCount',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
