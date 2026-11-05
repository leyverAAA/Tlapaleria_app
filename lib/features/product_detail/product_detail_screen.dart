import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tlapaleria_app/core/theme/app_theme.dart';
import 'package:tlapaleria_app/core/utils/formato.dart';
import 'package:tlapaleria_app/core/widgets/custom_button.dart';
import 'package:tlapaleria_app/features/cart/cart_action.dart';
import 'package:tlapaleria_app/features/cart/cart_provider.dart';
import 'package:tlapaleria_app/features/cart/cart_screen.dart';
import 'package:tlapaleria_app/models/product.dart';

/// Recibe el Product como argumento desde el catálogo.
class ProductDetailScreen extends StatelessWidget {
  final Product producto;

  const ProductDetailScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
        actions: const [CartAction()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'producto-${producto.id}',
                child: Image.asset(
                  producto.rutaImagen,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primarioClaro,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(producto.nombre, style: textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    formatoPrecio(producto.precio),
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppColors.primario,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Chip(label: Text(producto.categoria)),
                  const SizedBox(height: AppSpacing.md),
                  Text('Descripción', style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(producto.descripcion, style: textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            CustomButton(
              texto: 'Agregar al carrito',
              icono: Icons.add_shopping_cart,
              anchoCompleto: true,
              onPressed: () {
                context.read<CartProvider>().agregar(producto);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${producto.nombre} agregado al carrito')),
                );
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            CustomButton(
              texto: 'Ir al carrito',
              icono: Icons.shopping_cart_outlined,
              anchoCompleto: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}