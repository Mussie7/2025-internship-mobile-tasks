import 'package:test/test.dart';
import '../product.dart'; // Adjust the import based on your file structure

void main() {
  group('ProductManager', () {
    late ProductManager productManager;

    setUp(() {
      productManager = ProductManager();
    });

    test('Should add a product successfully', () {
      productManager.addProduct('Laptop', 'Gaming laptop', 1200.0);
      expect(productManager.getAllProducts().length, 1);
      expect(productManager.getAllProducts()[0].name, 'Laptop');
    });

    test('Should retrieve a product by ID', () {
      productManager.addProduct('Phone', 'Smartphone', 800.0);
      Product? product = productManager.getProductById(1);
      expect(product, isNotNull);
      expect(product!.name, 'Phone');
    });

    test('Should return null when retrieving a non-existent product', () {
      expect(productManager.getProductById(99), isNull);
    });

    test('Should edit a product correctly', () {
      productManager.addProduct('Tablet', 'Android tablet', 500.0);
      productManager.editProduct(1, name: 'Updated Tablet', price: 550.0);
      Product? product = productManager.getProductById(1);
      expect(product!.name, 'Updated Tablet');
      expect(product.price, 550.0);
    });

    test('Should delete a product successfully', () {
      productManager.addProduct('Headphones', 'Wireless headphones', 200.0);
      productManager.deleteProduct(1);
      expect(productManager.getAllProducts().length, 0);
    });
  });
}
