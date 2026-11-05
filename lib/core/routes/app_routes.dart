import 'package:flutter/material.dart';

import '../../features/cart/cart_screen.dart';
import '../../features/catalog/catalog_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/product_detail/product_detail_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../models/product.dart';

/// Rutas con nombre para una navegación centralizada y clara.
/// La lógica se mantiene simple (Navigator + Provider), estilo base.
class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const catalog = '/catalog';
  static const detail = '/detail';
  static const cart = '/cart';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    home: (_) => const HomeScreen(),
    catalog: (_) => const CatalogScreen(),
    cart: (_) => const CartScreen(),
  };

  /// Maneja rutas que requieren argumentos (p. ej. detalle recibe [Product]).
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final product = settings.arguments;
      if (product is Product) {
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
          settings: settings,
        );
      }
      return _errorRoute('Producto no válido para la pantalla de detalle.');
    }
    return null;
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Navegación')),
        body: Center(child: Text(message)),
      ),
    );
  }
}
