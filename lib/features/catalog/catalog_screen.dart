import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/product_card.dart';
import '../../data/repositories/product_repository.dart';
import '../cart/inventory_provider.dart';
import '../product_detail/product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ProductRepository _repository = ProductRepository();
  String _query = '';
  String? _category;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final products = await _repository.getProducts();
    if (!mounted) return;
    final provider = context.read<InventoryProvider>();
    if (provider.products.isEmpty) {
      provider.setProducts(products);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = context.watch<InventoryProvider>().products;
    final categories = ['Todos', ...allProducts.map((p) => p.category).toSet()];
    final filtered = allProducts.where((p) {
      final matchesQuery =
          _query.isEmpty || p.name.toLowerCase().contains(_query.toLowerCase());
      final matchesCategory = _category == null || p.category == _category;
      return matchesQuery && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final cat = categories[index];
                final selected =
                    (cat == 'Todos' && _category == null) || cat == _category;
                return ChoiceChip(
                  label: Text(cat),
                  selected: selected,
                  onSelected: (_) {
                    setState(() => _category = cat == 'Todos' ? null : cat);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : filtered.isEmpty
                ? const Center(child: Text('Sin resultados'))
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: filtered.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final product = filtered[index];
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
          ),
        ],
      ),
    );
  }
}
