class Product {
  const Product({
    required this.category,
    required this.imageAssetPath,
    required this.description,
    required this.name,
    required this.price,
  });

  final String category;
  final String imageAssetPath;
  final String description;
  final String name;
  final double price;
  final double rating = 4.0;
}
