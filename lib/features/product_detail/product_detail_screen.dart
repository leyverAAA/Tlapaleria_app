import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_button.dart';
import '../../models/product.dart';
import '../cart/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.hardware, size: 72, color: colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(product.category),
            const SizedBox(height: 12),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Agregar al carrito',
                icon: Icons.add_shopping_cart,
                onPressed: () {
                  context.read<CartProvider>().add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto agregado')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
