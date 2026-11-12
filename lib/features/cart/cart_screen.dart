import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';
import '/core/utils/formato.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/empty_state.dart';
import '/core/widgets/product_image_tile.dart';
import '/core/widgets/quantity_stepper.dart';
import '/features/shell/navigation_controller.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Future<void> _confirmClear(BuildContext context, CartProvider cart) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('¿Vaciar la venta?'),
        content: Text(
          'Se quitarán ${cart.itemCount} '
          'artículo${cart.itemCount == 1 ? '' : 's'} de la venta actual.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sí, vaciar'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      cart.clear();
    }
  }

  Future<void> _checkout(BuildContext context, CartProvider cart) async {
    final total = cart.total;
    final itemCount = cart.itemCount;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar cobro'),
        content: Text(
          'Se cobrará un total de ${formatoPrecio(total)} por '
          '$itemCount artículo${itemCount == 1 ? '' : 's'}.\n\n'
          'Esta venta es simulada y no se guardará en el historial.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final navigation = context.read<NavigationController>();
    final messenger = ScaffoldMessenger.of(context);
    cart.clear();
    navigation.goToHome();
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Venta cobrada (simulada): ${formatoPrecio(total)}'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final navigation = context.read<NavigationController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Venta actual'),
        actions: [
          if (cart.items.isNotEmpty) ...[
            IconButton(
              tooltip: 'Agregar más productos',
              onPressed: navigation.goToCatalog,
              icon: const Icon(Icons.add_shopping_cart_rounded),
            ),
            IconButton(
              tooltip: 'Vaciar venta',
              onPressed: () => _confirmClear(context, cart),
              icon: const Icon(Icons.delete_outline_rounded),
            ),
          ],
          const SizedBox(width: 4),
        ],
      ),
      body: cart.items.isEmpty
          ? EmptyState(
              icon: Icons.shopping_cart_outlined,
              title: 'No hay productos en la venta',
              message: 'Agrega productos del catálogo para comenzar.',
              actionLabel: 'Ver productos',
              actionIcon: Icons.storefront_outlined,
              onAction: navigation.goToCatalog,
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return _CartItemCard(
                        productName: item.product.name,
                        category: item.product.category,
                        unitPrice: item.product.price,
                        quantity: item.quantity,
                        subtotal: item.subtotal,
                        onIncrease: () => cart.add(item.product),
                        onDecrease: () => cart.decrease(item.product),
                        onRemove: () => cart.remove(item.product),
                      );
                    },
                  ),
                ),
                _CheckoutBar(
                  itemCount: cart.itemCount,
                  total: cart.total,
                  onCheckout: () => _checkout(context, cart),
                ),
              ],
            ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final String productName;
  final String category;
  final double unitPrice;
  final int quantity;
  final double subtotal;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const _CartItemCard({
    required this.productName,
    required this.category,
    required this.unitPrice,
    required this.quantity,
    required this.subtotal,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 68,
                height: 68,
                child: ProductImageTile(
                  category: category,
                  iconSize: 28,
                  borderRadius: AppRadius.mdAll,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${formatoPrecio(unitPrice)} c/u',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Quitar producto',
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline_rounded, size: 21),
                color: AppColors.inkMuted,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              QuantityStepper(
                quantity: quantity,
                onIncrease: onIncrease,
                onDecrease: onDecrease,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    formatoPrecio(subtotal),
                    style: const TextStyle(
                      fontFamily: AppTheme.displayFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
            ],
          ),
        ],
      ),
    );
  }
}

class _CheckoutBar extends StatelessWidget {
  final int itemCount;
  final double total;
  final VoidCallback onCheckout;

  const _CheckoutBar({
    required this.itemCount,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 20,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Total', style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                Flexible(
                  child: Text(
                    '$itemCount artículo${itemCount == 1 ? '' : 's'}',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                formatoPrecio(total),
                style: const TextStyle(
                  fontFamily: AppTheme.displayFont,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  color: AppColors.primaryOrange,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Cobrar (simulado)',
                icon: Icons.payments_outlined,
                onPressed: onCheckout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
