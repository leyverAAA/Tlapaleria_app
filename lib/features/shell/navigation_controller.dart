import 'package:flutter/foundation.dart';

/// Estado de navegación del shell principal (Inicio, Catálogo, Venta, Perfil).
class NavigationController extends ChangeNotifier {
  NavigationController([int initialIndex = 0]) : _index = initialIndex;

  int _index;

  int get index => _index;

  void select(int value) {
    if (value == _index) return;
    _index = value;
    notifyListeners();
  }

  void goToHome() => select(0);

  void goToCatalog() => select(1);

  void goToCart() => select(2);

  void goToProfile() => select(3);
}
