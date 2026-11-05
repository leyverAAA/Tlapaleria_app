import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/routes/app_routes.dart';
import '/core/widgets/custom_button.dart';
import '/models/product.dart';
import '../cart/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  static const _messageDuration = Duration(seconds: 2);
  static const _fadeDuration = Duration(milliseconds: 250);

  Timer? _messageTimer;
  bool _showMessage = false;

  @override
  void dispose() {
    _messageTimer?.cancel();
    super.dispose();
  }

  void _addToCart() {
    context.read<CartProvider>().add(widget.product);

    // Reinicia el tiempo si se agregan varios productos seguidos para que el
    // aviso no se quede encimado ni se acumule.
    _messageTimer?.cancel();
    setState(() => _showMessage = true);
    _messageTimer = Timer(_messageDuration, () {
      if (!mounted) return;
      setState(() => _showMessage = false);
    });
  }

  void _openCart() {
    _messageTimer?.cancel();
    setState(() => _showMessage = false);
    Navigator.pushNamed(context, AppRoutes.cart);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de producto')),
      body: Stack(
        children: [
          Padding(
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
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    label: 'Agregar a la venta',
                    icon: Icons.add_shopping_cart,
                    onPressed: _addToCart,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 88,
            child: IgnorePointer(
              ignoring: !_showMessage,
              child: ExcludeSemantics(
                excluding: !_showMessage,
                child: AnimatedOpacity(
                  opacity: _showMessage ? 1 : 0,
                  duration: _fadeDuration,
                  curve: Curves.easeOut,
                  child: AnimatedSlide(
                    offset: _showMessage ? Offset.zero : const Offset(0, 0.25),
                    duration: _fadeDuration,
                    curve: Curves.easeOut,
                    child: Material(
                      color: colorScheme.inverseSurface,
                      elevation: 6,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: colorScheme.onInverseSurface,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Producto agregado a la venta',
                                style: TextStyle(
                                  color: colorScheme.onInverseSurface,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _openCart,
                              child: Text(
                                'Ver venta',
                                style: TextStyle(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
