import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/core/routes/app_routes.dart';
import '/core/theme/app_theme.dart';
import '/core/widgets/brand_header.dart';
import '/core/widgets/cart_action_button.dart';
import '/core/widgets/category_circle.dart';
import '/core/widgets/empty_state.dart';
import '/core/widgets/product_card.dart';
import '/core/widgets/section_header.dart';
import '/data/repositories/product_repository.dart';
import '/features/cart/cart_provider.dart';
import '/features/shell/navigation_controller.dart';
import '/models/product.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ProductRepository _repository = ProductRepository();
  final TextEditingController _searchController = TextEditingController();
  List<Product> _products = [];
  String _query = '';
  String? _category;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final products = await _repository.getProducts();
    if (!mounted) return;
    setState(() {
      _products = products;
      _loading = false;
    });
  }

  bool get _hasFilters => _query.trim().isNotEmpty || _category != null;

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _query = '';
      _category = null;
    });
  }

  void _addProduct(Product product) {
    context.read<CartProvider>().add(product);
    final navigation = context.read<NavigationController>();
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text('${product.name} agregado a la venta'),
          action: SnackBarAction(
            label: 'Ver venta',
            onPressed: () {
              messenger.hideCurrentSnackBar();
              navigation.goToCart();
            },
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Todos', ..._products.map((p) => p.category).toSet()];
    final query = _query.trim().toLowerCase();
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final categoryRowHeight = 88 + (textScale - 1).clamp(0.0, 1.2) * 26;

    final filtered = _products.where((p) {
      final matchesQuery =
          query.isEmpty || p.name.toLowerCase().contains(query);
      final matchesCategory = _category == null || p.category == _category;
      return matchesQuery && matchesCategory;
    }).toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusIcons,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            BrandHeader(
              eyebrow: 'Tlapalería App',
              title: 'Productos',
              trailing: const CartActionButton(
                icon: Icons.shopping_cart,
                color: Colors.white,
                badgeColor: AppColors.brandOrange,
                badgeTextColor: AppColors.charcoal,
              ),
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onChanged: (value) => setState(() => _query = value),
                style: const TextStyle(
                  fontFamily: AppTheme.bodyFont,
                  fontSize: 14,
                  color: AppColors.ink,
                ),
                decoration: InputDecoration(
                  hintText: 'Buscar producto...',
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search_rounded, size: 22),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Limpiar búsqueda',
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                          icon: const Icon(Icons.close_rounded, size: 20),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 2),
              child: SectionHeader(
                title: 'Categorías',
                actionLabel: 'Ver todas',
                onAction: () => setState(() => _category = null),
              ),
            ),
            SizedBox(
              height: categoryRowHeight,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected =
                      (category == 'Todos' && _category == null) ||
                      category == _category;
                  return CategoryCircle(
                    label: category,
                    selected: selected,
                    onTap: () {
                      setState(
                        () => _category = category == 'Todos' ? null : category,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 12, 2),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _loading
                          ? 'Cargando productos'
                          : '${filtered.length} producto${filtered.length == 1 ? '' : 's'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (_hasFilters && !_loading)
                    TextButton(
                      onPressed: _clearFilters,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 36),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      child: const Text('Limpiar'),
                    ),
                ],
              ),
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : filtered.isEmpty
                  ? EmptyState(
                      icon: Icons.search_off_rounded,
                      title: _hasFilters
                          ? 'Sin resultados'
                          : 'No hay productos disponibles',
                      message: _hasFilters
                          ? 'Prueba con otro nombre o cambia la categoría.'
                          : 'La lista de productos está vacía.',
                      actionLabel: _hasFilters ? 'Limpiar filtros' : null,
                      actionIcon: Icons.filter_alt_off_rounded,
                      onAction: _hasFilters ? _clearFilters : null,
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final scale = MediaQuery.textScalerOf(context).scale(1);
                        final useGrid =
                            constraints.maxWidth >= 380 && scale <= 1.1;

                        if (!useGrid) {
                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                            itemCount: filtered.length,
                            separatorBuilder: (_, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final product = filtered[index];
                              return ProductCard(
                                product: product,
                                horizontal: true,
                                onTap: () => _openDetail(product),
                                onAdd: () => _addProduct(product),
                              );
                            },
                          );
                        }

                        return GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 220,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                mainAxisExtent: 246,
                              ),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final product = filtered[index];
                            return ProductCard(
                              product: product,
                              onTap: () => _openDetail(product),
                              onAdd: () => _addProduct(product),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDetail(Product product) {
    Navigator.pushNamed(context, AppRoutes.detail, arguments: product);
  }
}
