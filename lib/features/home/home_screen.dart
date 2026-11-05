import 'package:flutter/material.dart';

import 'package:tlapaleria_app/core/theme/app_theme.dart';
import 'package:tlapaleria_app/core/widgets/custom_button.dart';
import 'package:tlapaleria_app/features/cart/cart_action.dart';
import 'package:tlapaleria_app/features/cart/cart_screen.dart';
import 'package:tlapaleria_app/features/catalog/catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _abrirCatalogo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CatalogScreen()),
    );
  }

  void _abrirCarrito(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.hardware_outlined),
            SizedBox(width: AppSpacing.sm),
            Text('Tlapalería App'),
          ],
        ),
        actions: const [CartAction()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [AppColors.primario, AppColors.acento],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Todo para tu obra',
                      style: textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Herramientas, pinturas y materiales para cualquier proyecto',
                      style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              CustomButton(
                texto: 'Ver catálogo',
                icono: Icons.store,
                anchoCompleto: true,
                onPressed: () => _abrirCatalogo(context),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('Accesos rápidos', style: textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: _AccesoRapido(
                      icono: Icons.storefront_outlined,
                      etiqueta: 'Productos',
                      onTap: () => _abrirCatalogo(context),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _AccesoRapido(
                      icono: Icons.shopping_cart_outlined,
                      etiqueta: 'Carrito',
                      onTap: () => _abrirCarrito(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.primarioClaro,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.primario),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        'Busca por nombre o filtra por categoría, agrega al carrito y simula tu compra.',
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccesoRapido extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final VoidCallback onTap;

  const _AccesoRapido({
    required this.icono,
    required this.etiqueta,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.blanco,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28, color: AppColors.primario),
            const SizedBox(height: AppSpacing.lg),
            Text(etiqueta, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}