import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';
import '/core/utils/category_visual.dart';
import '/core/utils/formato.dart';
import '/core/widgets/cart_action_button.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/product_image_tile.dart';
import '/features/cart/cart_provider.dart';
import '/features/shell/navigation_controller.dart';
import '/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  static const _messageDuration = Duration(seconds: 3);
  static const _fadeDuration = Duration(milliseconds: 220);

  Timer? _messageTimer;
  bool _showMessage = false;

  @override
  void dispose() {
    _messageTimer?.cancel();
    super.dispose();
  }

  void _addToCart() {
    context.read<CartProvider>().add(widget.product);
    HapticFeedback.selectionClick();

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
    context.read<NavigationController>().goToCart();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final visual = CategoryVisual.of(product.category);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Detalle de producto'),
        actions: const [
          CartActionButton(icon: Icons.shopping_cart),
          SizedBox(width: 4),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 232,
                        width: double.infinity,
                        child: ProductImageTile(
                          category: product.category,
                          iconSize: 88,
                          borderRadius: AppRadius.xlAll,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.orangeTint,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  visual.icon,
                                  size: 14,
                                  color: AppColors.orangeDeep,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  product.category,
                                  style: const TextStyle(
                                    fontFamily: AppTheme.bodyFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.orangeDeep,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6EC),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  size: 13,
                                  color: AppColors.success,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Disponible',
                                  style: TextStyle(
                                    fontFamily: AppTheme.bodyFont,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.success,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 10,
                        runSpacing: 2,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(
                            formatoPrecio(product.price),
                            style: const TextStyle(
                              fontFamily: AppTheme.displayFont,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.6,
                              color: AppColors.primaryOrange,
                            ),
                          ),
                          Text(
                            'Precio unitario',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _InfoCard(
                        title: 'Descripción',
                        child: Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(height: 1.55),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _InfoCard(
                        title: 'Detalles',
                        child: Column(
                          children: [
                            _DetailRow(
                              label: 'Categoría',
                              value: product.category,
                            ),
                            const SizedBox(height: 10),
                            _DetailRow(
                              label: 'Código',
                              value: 'PROD-${product.id.padLeft(3, '0')}',
                            ),
                            const SizedBox(height: 10),
                            const _DetailRow(
                              label: 'Venta',
                              value: 'Mostrador',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _PurchaseBar(price: product.price, onAdd: _addToCart),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: bottomInset + 126,
            child: IgnorePointer(
              ignoring: !_showMessage,
              child: ExcludeSemantics(
                excluding: !_showMessage,
                child: Semantics(
                  liveRegion: _showMessage,
                  child: AnimatedOpacity(
                    opacity: _showMessage ? 1 : 0,
                    duration: _fadeDuration,
                    curve: Curves.easeOut,
                    child: AnimatedSlide(
                      offset: _showMessage
                          ? Offset.zero
                          : const Offset(0, 0.25),
                      duration: _fadeDuration,
                      curve: Curves.easeOut,
                      child: Material(
                        color: AppColors.charcoal,
                        elevation: 8,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline_rounded,
                                size: 20,
                                color: AppColors.brandOrange,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Producto agregado a la venta',
                                  style: TextStyle(
                                    fontFamily: AppTheme.bodyFont,
                                    fontSize: 13.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: _openCart,
                                child: const Text(
                                  'Ver venta',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.brandOrangeLight,
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
          ),
        ],
      ),
    );
  }
}

class _PurchaseBar extends StatelessWidget {
  final double price;
  final VoidCallback onAdd;

  const _PurchaseBar({required this.price, required this.onAdd});

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
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: AppColors.inkMuted),
                ),
                const Spacer(),
                Text(
                  formatoPrecio(price),
                  style: const TextStyle(
                    fontFamily: AppTheme.displayFont,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Agregar a la venta',
                icon: Icons.add_shopping_cart_rounded,
                onPressed: onAdd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodySmall),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: AppTheme.bodyFont,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}
