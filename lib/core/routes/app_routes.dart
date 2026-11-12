import 'package:flutter/material.dart';

import '/features/product_detail/product_detail_screen.dart';
import '/features/shell/app_shell.dart';
import '/features/splash/splash_screen.dart';
import '/models/product.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const catalog = '/catalog';
  static const detail = '/detail';
  static const cart = '/cart';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    home: (_) => const AppShell(initialIndex: 0),
    catalog: (_) => const AppShell(initialIndex: 1),
    cart: (_) => const AppShell(initialIndex: 2),
    profile: (_) => const AppShell(initialIndex: 3),
  };

  static List<Route<dynamic>> onGenerateInitialRoutes(String initialRoute) {
    final builder = routes[initialRoute];
    if (builder != null) {
      return [
        MaterialPageRoute(
          builder: builder,
          settings: RouteSettings(name: initialRoute),
        ),
      ];
    }
    return [onUnknownRoute(RouteSettings(name: initialRoute))];
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final product = settings.arguments;
      if (product is Product) {
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
          settings: settings,
        );
      }
      return _errorRoute(
        'No se recibió un producto válido para la pantalla de detalle.',
        settings: settings,
      );
    }
    return null;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return _errorRoute(
      'No encontramos la pantalla "${settings.name ?? ''}".',
      settings: settings,
    );
  }

  static Route<dynamic> _errorRoute(String message, {RouteSettings? settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Navegación')),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.explore_off_outlined, size: 56),
                const SizedBox(height: 12),
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () =>
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(home, (route) => false),
                  icon: const Icon(Icons.home_outlined),
                  label: const Text('Volver al inicio'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
