import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/inventory_provider.dart';
import '../cart/low_stock_screen.dart';
import '../catalog/catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lowStockCount = context.watch<InventoryProvider>().lowStockCount;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Gestión Tlapalería')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/Bienvenida.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Panel de gestión',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Controla el inventario y detecta productos con stock bajo.',
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                  ),
                  title: const Text('Productos con stock bajo'),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: lowStockCount > 0
                        ? Colors.red
                        : Colors.green,
                    child: Text(
                      '$lowStockCount',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LowStockScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CatalogScreen()),
                    );
                  },
                  icon: const Icon(Icons.inventory_2),
                  label: const Text('Ver inventario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
