import 'package:flutter/material.dart';

import '../../models/product.dart';

class InventoryProvider extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  List<Product> get lowStockProducts =>
      _products.where((p) => p.isLowStock).toList();

  int get lowStockCount => lowStockProducts.length;

  void setProducts(List<Product> products) {
    _products
      ..clear()
      ..addAll(products);
    notifyListeners();
  }

  void updateStock(String productId, int newStock) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index == -1) return;
    _products[index] = _products[index].copyWith(
      stock: newStock < 0 ? 0 : newStock,
    );
    notifyListeners();
  }

  void increaseStock(String productId, [int amount = 1]) {
    final product = _products.firstWhere((p) => p.id == productId);
    updateStock(productId, product.stock + amount);
  }

  void decreaseStock(String productId, [int amount = 1]) {
    final product = _products.firstWhere((p) => p.id == productId);
    updateStock(productId, product.stock - amount);
  }
}
