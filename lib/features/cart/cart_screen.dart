import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tlapaleria_app/core/theme/app_theme.dart';
import 'package:tlapaleria_app/core/utils/formato.dart';
import 'package:tlapaleria_app/core/widgets/custom_button.dart';
import 'package:tlapaleria_app/core/widgets/empty_state.dart';
import 'package:tlapaleria_app/features/cart/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch: la pantalla se redibuja cuando cambia el carrito.
    final carrito = context.watch<CartProvider>();
    final items = carrito.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: items.isEmpty
          ? EmptyState(
              icono: Icons.shopping_cart_outlined,
              mensaje: 'Tu carrito está vacío',
              textoBoton: 'Seguir comprando',
              onPressed: () => Navigator.pop(context),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return _ItemCarrito(item: items[index]);
                    },
                  ),
                ),
                _ResumenCompra(total: carrito.total),
              ],
            ),
    );
  }
}

class _ItemCarrito extends StatelessWidget {
  final CartItem item;

  const _ItemCarrito({required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final producto = item.producto;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.blanco,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                producto.rutaImagen,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    formatoPrecio(producto.precio),
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    formatoPrecio(item.subtotal),
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.primario,
                    ),
                  ),
                ],
              ),
            ),
            // read: los botones solo ejecutan acciones, no necesitan redibujarse.
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  tooltip: 'Quitar uno',
                  onPressed: () => context.read<CartProvider>().quitar(producto),
                ),
                Text('${item.cantidad}', style: textTheme.titleMedium),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  tooltip: 'Agregar uno',
                  onPressed: () =>
                      context.read<CartProvider>().agregar(producto),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ResumenCompra extends StatelessWidget {
  final double total;

  const _ResumenCompra({required this.total});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.blanco,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: textTheme.titleMedium),
                Text(
                  formatoPrecio(total),
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.primario,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CustomButton(
              texto: 'Simular compra',
              icono: Icons.check_circle_outline,
              anchoCompleto: true,
              onPressed: () {
                context.read<CartProvider>().vaciar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Compra simulada con éxito! Gracias por tu preferencia.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}