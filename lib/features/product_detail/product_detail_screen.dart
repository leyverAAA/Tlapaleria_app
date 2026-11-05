import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_button.dart';
import '../cart/inventory_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final product = context.watch<InventoryProvider>().products.firstWhere(
      (p) => p.id == productId,
    );
    final lowStock = product.isLowStock;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.inventory_2,
                size: 64,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(product.category),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(product.description),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gestión de stock',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Existencia: ${product.stock}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: lowStock
                                ? Colors.red
                                : colorScheme.onSurface,
                          ),
                        ),
                        if (lowStock) ...[
                          const SizedBox(width: 8),
                          const Text(
                            '(Stock bajo)',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ],
                    ),
                    Text('Mínimo recomendado: ${product.minStock}'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          onPressed: () => context
                              .read<InventoryProvider>()
                              .decreaseStock(product.id),
                          icon: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 12),
                        IconButton.filled(
                          onPressed: () => context
                              .read<InventoryProvider>()
                              .increaseStock(product.id),
                          icon: const Icon(Icons.add),
                        ),
                        const Spacer(),
                        Text(
                          lowStock ? 'Reabastecer' : 'OK',
                          style: TextStyle(
                            color: lowStock ? Colors.orange : Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Registrar entrada (+5)',
                icon: Icons.add_box,
                onPressed: () {
                  context.read<InventoryProvider>().increaseStock(
                    product.id,
                    5,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Stock actualizado')),
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
