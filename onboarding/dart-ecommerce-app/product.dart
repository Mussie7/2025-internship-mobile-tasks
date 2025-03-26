import 'dart:io';

// Product class definition
// Represents a product with an ID, name, description, and price.
class Product {
  final int id;
  final String name, description;
  final double price;

  Product({required this.id, required this.name, required this.description, required this.price});

  // Creates a new product instance with updated fields.
  Product copyWith({String? name, String? description, double? price}) {
    return Product(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  // Displays the product details in the console.
  void display() {
    print('-----------------------------------');
    print('Product ID: $id');
    print('Name: $name');
    print('Description: $description');
    print('Price: \$${price.toStringAsFixed(2)}');
    print('-----------------------------------');
  }
}

// ProductManager class definition
// Manages a collection of products, including adding, editing, deleting, and retrieving products.
class ProductManager {
  int _productCount = 0;
  final List<Product> _products = [];

  // Adds a new product to the list with a unique ID.
  // Parameters:
  // - name: The name of the product.
  // - description: A brief description of the product.
  // - price: The price of the product.
  void addProduct(String name, String description, double price) {
    _productCount++;
    Product product = Product(id: _productCount, name: name, description: description, price: price);
    _products.add(product);
    _printSuccess('Product added successfully!');
    product.display();
  }

  // Edits the details of an existing product by its ID.
  // Skips fields that are left empty or null.
  // Parameters:
  // - id: The ID of the product to edit.
  // - name: (Optional) The new name of the product.
  // - description: (Optional) The new description of the product.
  // - price: (Optional) The new price of the product.
  void editProduct(int id, {String? name, String? description, double? price}) {
    Product? product = getProductById(id);
    if (product == null) {
      _printError('Product not found.');
      return;
    }
    Product updatedProduct = product.copyWith(name: name, description: description, price: price);
    _products[_products.indexWhere((p) => p.id == id)] = updatedProduct;
    _printSuccess('Product updated successfully!');
    updatedProduct.display();
  }

  // Deletes a product from the list by its ID.
  // Parameters:
  // - id: The ID of the product to delete.
  void deleteProduct(int id) {
    Product? product = getProductById(id);
    if (product == null) {
      _printError('Product not found.');
      return;
    }
    _products.removeWhere((p) => p.id == id);
    _printSuccess('Product deleted successfully!');
    product.display();
  }

  // Retrieves a product by its ID.
  // Returns the product if found, or null if no product matches the ID.
  // Parameters:
  // - id: The ID of the product to retrieve.
  Product? getProductById(int id) {
    for (Product product in _products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  // Retrieves the list of all products.
  // Returns a list of all products in the collection.
  List<Product> getAllProducts() {
    return List.unmodifiable(_products);
  }

  // Prompts the user to enter a product ID and validates the input.
  int? _inputId() {
    print('Enter product ID: ');
    int? id = int.tryParse(stdin.readLineSync()!);
    if (id == null) {
      _printError('Invalid ID. Please enter a non-null, integer value.');
      return null;
    }
    return id;
  }

  // Gets valid price input
  double? _validatePriceInput() {
    print('Enter product price: ');
    double? price = double.tryParse(stdin.readLineSync()!);
    if (price == null || price < 0) {
      _printError('Invalid price. Please enter a valid positive number.');
      return null;
    }
    return price;
  }

  // Prints a success message to the console.
  void _printSuccess(String message) {
    print('\x1B[32m$message\x1B[0m'); // Green text for success
  }

  // Prints an error message to the console.
  void _printError(String message) {
    print('\x1B[31m$message\x1B[0m'); // Red text for errors
  }

  // Runs the main E-Commerce application.
  // Displays a menu and processes user input to manage products.
  void ecommerceApp() {
    // Main loop: Displays the menu and processes user input until the user exits.
    while (true) {
      // Display menu
      print('E-Commerce App');
      print('1. Add Product');
      print('2. Show Products');
      print('3. Show Product by ID');
      print('4. Edit Product by ID');
      print('5. Delete Product by ID');
      print('6. Exit');
      print('Enter your choice: ');

      int? choice = int.tryParse(stdin.readLineSync()!);

      // Perform action based on choice
      // Option 1: Add a new product to the list.
      if (choice == 1) {
        print('Enter product name: ');
        String name = stdin.readLineSync()!;
        // Ensure the product name is not empty before adding the product.
        if (name.isEmpty) {
          _printError('Product name cannot be empty');
          _printError('Adding product unsuccessful');
          continue;
        }

        print('Enter product description: ');
        String description = stdin.readLineSync()!;
        // Ensure the product description is not empty before adding the product.
        if (description.isEmpty) {
          _printError('Product description cannot be empty');
          _printError('Adding product unsuccessful');
          continue;
        }

        double? price = _validatePriceInput();
        // Ensure the product price is a valid numeric value before adding the product.
        if (price == null) {
          _printError('Adding product unsuccessful');
          continue;
        }

        addProduct(name, description, price);
      }
      // Option 2: Display all products in the list.
      else if (choice == 2) {
        // Handle the case where no products exist in the list.
        if (_products.isEmpty) {
          _printError('No products found');
          continue;
        }
        for (Product product in _products) {
          product.display();
        }
      }
      // Option 3: Display the details of a product by its ID.
      else if (choice == 3) {
        int? id = _inputId();
        // Handle the case where the product with the given ID does not exist.
        if (id == null) continue;
        Product? product = getProductById(id);
        if (product == null) {
          _printError('Product not found');
        } else {
          product.display();
        }
      }
      // Option 4: Edit the details of a product by its ID.
      else if (choice == 4) {
        int? id = _inputId();
        // Handle the case where the product with the given ID does not exist.
        if (id == null) continue;
        if (getProductById(id) == null) {
          _printError('Product not found');
          continue;
        }

        print('Enter product name (leave empty to skip): ');
        String name = stdin.readLineSync()!;
        print('Enter product description (leave empty to skip): ');
        String description = stdin.readLineSync()!;
        print('Enter product price (leave empty to skip): ');
        double? price = double.tryParse(stdin.readLineSync()!);
        
        editProduct(id, name: name.isNotEmpty ? name : null, description: description.isNotEmpty ? description : null, price: price);
      }
      // Option 5: Delete a product by its ID.
      else if (choice == 5) {
        int? id = _inputId();
        // Handle the case where the product with the given ID does not exist.
        if (id == null) continue;
        deleteProduct(id);
      }
      // Option 6: Exit the application.
      else if (choice == 6) {
        _printSuccess('Exiting...');
        break;
      }
      // Validate the user's menu choice to ensure it is a valid integer.
      else {
        _printError('Invalid choice');
      }
    }
  }
}

// Entry point of the application. Starts the E-Commerce app.
void main() {
  ProductManager().ecommerceApp();
}