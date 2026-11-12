import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/features/cart/cart_screen.dart';
import '/features/catalog/catalog_screen.dart';
import '/features/home/home_screen.dart';
import '/features/profile/profile_screen.dart';
import 'app_bottom_nav.dart';
import 'navigation_controller.dart';

/// Contenedor principal con pestañas persistentes.
class AppShell extends StatefulWidget {
  final int initialIndex;

  const AppShell({super.key, this.initialIndex = 0});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final NavigationController _navigation;

  @override
  void initState() {
    super.initState();
    _navigation = context.read<NavigationController>();
    _navigation.addListener(_hideSnackBar);
    if (widget.initialIndex != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _navigation.select(widget.initialIndex);
      });
    }
  }

  @override
  void dispose() {
    _navigation.removeListener(_hideSnackBar);
    super.dispose();
  }

  void _hideSnackBar() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<NavigationController>();

    return PopScope(
      canPop: navigation.index == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        navigation.goToHome();
      },
      child: Scaffold(
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: IndexedStack(
            index: navigation.index,
            children: const [
              HomeScreen(),
              CatalogScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNav(
          currentIndex: navigation.index,
          onSelected: navigation.select,
        ),
      ),
    );
  }
}
