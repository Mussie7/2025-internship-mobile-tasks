import 'dart:io';

// Product class definition
class Product {
  final int id;
  String name, description;
  double price;

  Product({required this.id, required this.name, required this.description, required this.price});

  void setName(String name) {
    this.name = name;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setPrice(double price) {
    this.price = price;
  }

  void display() {
    print('Product ID: $id');
    print('Name: $name');
    print('Description: $description');
    print('Price: $price');
  }
}

// ProductManager class definition
class ProductManager {
  int productCount = 0;
  List<Product> products = [];

  // Add product to the list
  void addProduct(String name, String description, double price) {
    productCount++;
    Product product = Product(id: productCount, name: name, description: description, price: price);
    products.add(product);
  }

  // Edit product by id
  void editProduct(int id, {String? name, String? description, double? price}) {
    Product product = products.firstWhere((element) => element.id == id);
    if (name != null && !name.isEmpty) product.setName(name);
    if (description != null && !description.isEmpty) product.setDescription(description);
    if (price != null) product.setPrice(price);
  }

  // Delete product by id
  void deleteProduct(int id) {
    products.removeWhere((element) => element.id == id);
  }

  // Get product by id
  Product? getProductById(int id) {
    for (Product product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  // Get all products
  List<Product> getAllProducts() {
    return products;
  }
}

void ecommerceApp() {
  ProductManager productManager = ProductManager();

  while (true) {
    // Display menu
    print('------------------------------------------------------------');
    print('E-Commerce App');
    print('1. Add Product');
    print('2. Show Products');
    print('3. Show Product by ID');
    print('4. Edit Product by ID');
    print('5. Delete Product by ID');
    print('6. Exit');
    print('Enter your choice: ');
    print('------------------------------------------------------------');

    int? choice = int.tryParse(stdin.readLineSync()!);

    // Perform action based on choice
    if (choice == 1) {
      // Add product
      print('Enter product name: ');
      String name = stdin.readLineSync()!;
      if (name.isEmpty) {
        print('Product name cannot be empty');
        print('Adding product unsuccessful');
        continue;
      }

      print('Enter product description: ');
      String description = stdin.readLineSync()!;
      if (description.isEmpty) {
        print('Product description cannot be empty');
        print('Adding product unsuccessful');
        continue;
      }

      print('Enter product price: ');
      double? price = double.tryParse(stdin.readLineSync()!);
      if (price == null) {
        print('Price cannot be null or non-numeric');
        print('Adding product unsuccessful');
        continue;
      }

      productManager.addProduct(name, description, price);
      print('Product added successfully');
      productManager.getAllProducts().last.display();
    } else if (choice == 2) {
      // Show products
      List<Product> products = productManager.getAllProducts();
      if (products.isEmpty) {
        print('No products found');
        continue;
      }
      for (Product product in products) {
        product.display();
        print('------------------------------------------------------------');
      }
    } else if (choice == 3) {
      // Show product by ID
      print('Enter product ID: ');
      int id = int.parse(stdin.readLineSync()!);
      Product? product = productManager.getProductById(id);
      if (product == null) {
        print('Product not found');
        continue;
      }
      product.display();
    } else if (choice == 4) {
      // Edit product by ID
      print('Enter product ID: ');
      int id = int.parse(stdin.readLineSync()!);
      if (productManager.getProductById(id) == null) {
        print('Product not found');
        continue;
      }
      print('Enter product name (leave empty to skip): ');
      String name = stdin.readLineSync()!;
      print('Enter product description (leave empty to skip): ');
      String description = stdin.readLineSync()!;
      print('Enter product price (leave empty to skip): ');
      double? price = double.tryParse(stdin.readLineSync()!);
      productManager.editProduct(id, name: name, description: description, price: price);
      print('Product updated successfully');
      productManager.getProductById(id)!.display();
    } else if (choice == 5) {
      // Delete product by ID
      print('Enter product ID: ');
      int id = int.parse(stdin.readLineSync()!);
      if (productManager.getProductById(id) == null) {
        print('Product not found');
        continue;
      }
      Product? product = productManager.getProductById(id);
      productManager.deleteProduct(id);
      print('Product deleted successfully');
      product!.display();
    } else if (choice == 6) {
      // Exit
      print('Exiting...');
      break;
    } else {
      print('Invalid choice');
    }
  }
}

void main() {
  ecommerceApp();
}
