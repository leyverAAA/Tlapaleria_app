class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String description;
  final String image;
  final int stock;
  final int minStock;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.stock,
    required this.minStock,
  });

  Product copyWith({int? stock}) {
    return Product(
      id: id,
      name: name,
      price: price,
      category: category,
      description: description,
      image: image,
      stock: stock ?? this.stock,
      minStock: minStock,
    );
  }

  bool get isLowStock => stock <= minStock;
}
