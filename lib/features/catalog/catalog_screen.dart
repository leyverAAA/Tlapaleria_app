import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/product_card.dart';
import '../../data/repositories/product_repository.dart';
import '../../models/product.dart';
import '../cart/cart_provider.dart';
import '../cart/cart_screen.dart';
import '../product_detail/product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ProductRepository _repository = ProductRepository();
  List<Product> _products = [];
  List<Product> _filtered = [];
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
    setState(() {
      _products = products;
      _filtered = products;
      _loading = false;
    });
  }

  void _applyFilters() {
    setState(() {
      _filtered = _products.where((p) {
        final matchesQuery =
            _query.isEmpty ||
            p.name.toLowerCase().contains(_query.toLowerCase());
        final matchesCategory = _category == null || p.category == _category;
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().itemCount;
    final categories = ['Todos', ..._products.map((p) => p.category).toSet()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8,
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _query = value;
                _applyFilters();
              },
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
                    _category = cat == 'Todos' ? null : cat;
                    _applyFilters();
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final product = _filtered[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(product: product),
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
