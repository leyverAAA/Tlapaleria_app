import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';
import '/core/utils/formato.dart';
import '/core/widgets/brand_header.dart';
import '/core/widgets/cart_action_button.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/section_header.dart';
import '/features/cart/cart_provider.dart';
import '/features/shell/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _startNewSale(BuildContext context, CartProvider cart) async {
    final navigation = context.read<NavigationController>();
    if (cart.items.isEmpty) {
      navigation.goToCatalog();
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('¿Iniciar nueva venta?'),
        content: Text(
          'Se vaciará la venta actual con ${cart.itemCount} '
          'artículo${cart.itemCount == 1 ? '' : 's'} por '
          '${formatoPrecio(cart.total)}. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sí, vaciar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;
    cart.clear();
    navigation.goToCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final navigation = context.read<NavigationController>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusIcons,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            BrandHeader(
              eyebrow: 'Bienvenido',
              title: 'Punto de venta',
              trailing: const CartActionButton(
                icon: Icons.point_of_sale,
                color: Colors.white,
                badgeColor: AppColors.brandOrange,
                badgeTextColor: AppColors.charcoal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tu tlapalería en la palma de tu mano',
                    style: TextStyle(
                      fontFamily: AppTheme.bodyFont,
                      fontSize: 13.5,
                      height: 1.4,
                      color: Color(0xCCFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    width: 148,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: const LinearGradient(
                        colors: [AppColors.brandOrange, Color(0x00FF8A00)],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _QuickActions(
                    onExplore: navigation.goToCatalog,
                    onSearch: navigation.goToCatalog,
                    onSale: navigation.goToCart,
                    onCheckout: navigation.goToCart,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SectionHeader(title: 'Tu venta'),
                  const SizedBox(height: 10),
                  if (cart.items.isEmpty)
                    _StartSaleCard(onStart: () => _startNewSale(context, cart))
                  else
                    _CurrentSaleCard(
                      itemCount: cart.itemCount,
                      total: cart.total,
                      onContinue: navigation.goToCart,
                      onNewSale: () => _startNewSale(context, cart),
                    ),
                  const SizedBox(height: 20),
                  const _TipCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  final VoidCallback onExplore;
  final VoidCallback onSearch;
  final VoidCallback onSale;
  final VoidCallback onCheckout;

  const _QuickActions({
    required this.onExplore,
    required this.onSearch,
    required this.onSale,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.floating,
      ),
      child: Row(
        children: [
          _QuickAction(
            icon: Icons.storefront_outlined,
            label: 'Explorar',
            onTap: onExplore,
          ),
          _QuickAction(
            icon: Icons.search_rounded,
            label: 'Buscar',
            onTap: onSearch,
          ),
          _QuickAction(
            icon: Icons.receipt_long_outlined,
            label: 'Mi venta',
            onTap: onSale,
          ),
          _QuickAction(
            icon: Icons.credit_card_outlined,
            label: 'Cobrar',
            onTap: onCheckout,
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orangeTint,
                ),
                child: Icon(icon, size: 21, color: AppColors.primaryOrange),
              ),
              const SizedBox(height: 7),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: AppTheme.bodyFont,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartSaleCard extends StatelessWidget {
  final VoidCallback onStart;

  const _StartSaleCard({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return _SaleCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _SaleIcon(icon: Icons.point_of_sale_outlined),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No hay venta en curso',
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Empieza una venta nueva y agrega productos del catálogo.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Nueva venta',
              icon: Icons.add_shopping_cart_rounded,
              onPressed: onStart,
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentSaleCard extends StatelessWidget {
  final int itemCount;
  final double total;
  final VoidCallback onContinue;
  final VoidCallback onNewSale;

  const _CurrentSaleCard({
    required this.itemCount,
    required this.total,
    required this.onContinue,
    required this.onNewSale,
  });

  @override
  Widget build(BuildContext context) {
    return _SaleCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _SaleIcon(icon: Icons.receipt_long_outlined),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Venta en curso',
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                '$itemCount artículo${itemCount == 1 ? '' : 's'}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'TOTAL ACTUAL',
            style: Theme.of(context).textTheme.labelSmall
                ?.copyWith(letterSpacing: 1.1, color: AppColors.inkMuted),
          ),
          const SizedBox(height: 2),
          Text(
            formatoPrecio(total),
            style: const TextStyle(
              fontFamily: AppTheme.displayFont,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
              color: AppColors.primaryOrange,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Continuar venta',
              icon: Icons.arrow_forward_rounded,
              onPressed: onContinue,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: onNewSale,
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Nueva venta'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaleCardShell extends StatelessWidget {
  final Widget child;

  const _SaleCardShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.card,
      ),
      child: child,
    );
  }
}

class _SaleIcon extends StatelessWidget {
  final IconData icon;

  const _SaleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orangeTint,
      ),
      child: Icon(icon, size: 24, color: AppColors.primaryOrange),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryOrange, Color(0xFF7C2D12)],
        ),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.16),
            ),
            child: const Icon(
              Icons.bolt_rounded,
              size: 23,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cobra en segundos',
                  style: TextStyle(
                    fontFamily: AppTheme.displayFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Agrega productos con el botón + y revisa el total antes de cobrar.',
                  style: TextStyle(
                    fontFamily: AppTheme.bodyFont,
                    fontSize: 12.5,
                    height: 1.45,
                    color: Color(0xE6FFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
