import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/routes/app_routes.dart';
import '/core/theme/app_theme.dart';
import '/features/cart/cart_provider.dart';
import '/features/shell/navigation_controller.dart';

/// Botón reutilizable para acceder a la venta actual con contador.
class CartActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final Color? color;
  final Color? badgeColor;
  final Color? badgeTextColor;

  const CartActionButton({
    super.key,
    this.icon = Icons.point_of_sale,
    this.tooltip = 'Venta actual',
    this.color,
    this.badgeColor,
    this.badgeTextColor,
  });

  void _openCart(BuildContext context) {
    final navigator = Navigator.of(context);
    final routeName = ModalRoute.of(context)?.settings.name;
    context.read<NavigationController>().goToCart();
    if (routeName == AppRoutes.detail) {
      navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = context.watch<CartProvider>().itemCount;
    final label = itemCount == 0
        ? tooltip
        : '$tooltip, $itemCount artículo${itemCount == 1 ? '' : 's'}';

    return IconButton(
      onPressed: () => _openCart(context),
      tooltip: label,
      style: color == null
          ? null
          : IconButton.styleFrom(
              foregroundColor: color,
              backgroundColor: Colors.white.withValues(alpha: 0.10),
              shape: const CircleBorder(),
            ),
      icon: Badge.count(
        count: itemCount,
        isLabelVisible: itemCount > 0,
        backgroundColor: badgeColor ?? AppColors.primaryOrange,
        textColor: badgeTextColor ?? Colors.white,
        child: Icon(icon, color: color),
      ),
    );
  }
}
