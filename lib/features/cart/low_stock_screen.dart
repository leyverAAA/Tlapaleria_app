import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/product_card.dart';
import '../product_detail/product_detail_screen.dart';
import 'inventory_provider.dart';

class LowStockScreen extends StatelessWidget {
  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lowStock = context.watch<InventoryProvider>().lowStockProducts;

    return Scaffold(
      appBar: AppBar(title: const Text('Stock bajo')),
      body: lowStock.isEmpty
          ? const Center(child: Text('No hay productos con stock bajo'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: lowStock.length,
              separatorBuilder: (_, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final product = lowStock[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(productId: product.id),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
