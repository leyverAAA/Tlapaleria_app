import '../../models/product.dart';
import '../local/products_data.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return ProductsData.products;
  }
}
