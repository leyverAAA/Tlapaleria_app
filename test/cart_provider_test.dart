import 'package:flutter_test/flutter_test.dart';

import 'package:tlapaleria_app/features/cart/cart_provider.dart';
import 'package:tlapaleria_app/models/product.dart';

const Product _product = Product(
  id: 'test',
  name: 'Producto de prueba',
  price: 10.0,
  category: 'Pruebas',
  description: 'Producto para probar el carrito.',
  image: 'assets/images/Logo.png',
);

void main() {
  group('CartProvider', () {
    test('agrega productos y calcula el total', () {
      final cart = CartProvider();

      cart.add(_product);
      cart.add(_product);

      expect(cart.items.length, 1);
      expect(cart.itemCount, 2);
      expect(cart.total, 20.0);
    });

    test('decrementa y elimina el producto al llegar a cero', () {
      final cart = CartProvider();

      cart.add(_product);
      cart.decrease(_product);

      expect(cart.items, isEmpty);
      expect(cart.itemCount, 0);
      expect(cart.total, 0.0);
    });

    test('remove y clear dejan la venta vacía', () {
      final cart = CartProvider();

      cart.add(_product);
      cart.remove(_product);

      expect(cart.items, isEmpty);

      cart.add(_product);
      cart.clear();

      expect(cart.items, isEmpty);
      expect(cart.total, 0.0);
    });
  });
}
