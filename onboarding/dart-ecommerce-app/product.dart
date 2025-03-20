import 'dart:io';

// Product class definition
// Represents a product with an ID, name, description, and price.
class Product {
  final int id;
  String name, description;
  double price;

  Product({required this.id, required this.name, required this.description, required this.price});

  // Updates the name of the product.
  void setName(String name) {
    this.name = name;
  }

  // Updates the description of the product.
  void setDescription(String description) {
    this.description = description;
  }

  // Updates the price of the product.
  void setPrice(double price) {
    this.price = price;
  }

  // Displays the product details in the console.
  void display() {
    print('Product ID: $id');
    print('Name: $name');
    print('Description: $description');
    print('Price: $price');
  }
}

// ProductManager class definition
// Manages a collection of products, including adding, editing, deleting, and retrieving products.
class ProductManager {
  int productCount = 0;
  List<Product> products = [];

  // Adds a new product to the list with a unique ID.
  // Parameters:
  // - name: The name of the product.
  // - description: A brief description of the product.
  // - price: The price of the product.
  void addProduct(String name, String description, double price) {
    productCount++;
    Product product = Product(id: productCount, name: name, description: description, price: price);
    products.add(product);
  }

  // Edits the details of an existing product by its ID.
  // Skips fields that are left empty or null.
  // Parameters:
  // - id: The ID of the product to edit.
  // - name: (Optional) The new name of the product.
  // - description: (Optional) The new description of the product.
  // - price: (Optional) The new price of the product.
  void editProduct(int id, {String? name, String? description, double? price}) {
    Product product = products.firstWhere((element) => element.id == id);
    if (name != null && !name.isEmpty) product.setName(name);
    if (description != null && !description.isEmpty) product.setDescription(description);
    if (price != null) product.setPrice(price);
  }

  // Deletes a product from the list by its ID.
  // Parameters:
  // - id: The ID of the product to delete.
  void deleteProduct(int id) {
    products.removeWhere((element) => element.id == id);
  }

  // Retrieves a product by its ID.
  // Returns the product if found, or null if no product matches the ID.
  // Parameters:
  // - id: The ID of the product to retrieve.
  Product? getProductById(int id) {
    for (Product product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  // Retrieves the list of all products.
  // Returns a list of all products in the collection.
  List<Product> getAllProducts() {
    return products;
  }
}

// Function to get product ID from user input
// Prompts the user to enter a product ID and validates the input.
// Returns the ID as an integer if valid, or null if invalid.
Function inputId = () {
  print('Enter product ID: ');
  int? id = int.tryParse(stdin.readLineSync()!);
  if (id == null) {
    print('Invalid ID. Please enter a non-null, integer value.');
    return null;
  }
  return id;
};

// Runs the main E-Commerce application.
// Displays a menu and processes user input to manage products.
void ecommerceApp() {
  ProductManager productManager = ProductManager();

  // Main loop: Displays the menu and processes user input until the user exits.
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
    // Option 1: Add a new product to the list.
    if (choice == 1) {
      print('Enter product name: ');
      String name = stdin.readLineSync()!;
      // Ensure the product name is not empty before adding the product.
      if (name.isEmpty) {
        print('Product name cannot be empty');
        print('Adding product unsuccessful');
        continue;
      }

      print('Enter product description: ');
      String description = stdin.readLineSync()!;
      // Ensure the product description is not empty before adding the product.
      if (description.isEmpty) {
        print('Product description cannot be empty');
        print('Adding product unsuccessful');
        continue;
      }

      print('Enter product price: ');
      double? price = double.tryParse(stdin.readLineSync()!);
      // Ensure the product price is a valid numeric value before adding the product.
      if (price == null) {
        print('Price cannot be null or non-numeric');
        print('Adding product unsuccessful');
        continue;
      }

      productManager.addProduct(name, description, price);
      print('Product added successfully');
      productManager.getAllProducts().last.display();
    }
    // Option 2: Display all products in the list.
    else if (choice == 2) {
      List<Product> products = productManager.getAllProducts();
      // Handle the case where no products exist in the list.
      if (products.isEmpty) {
        print('No products found');
        continue;
      }
      for (Product product in products) {
        product.display();
        print('------------------------------------------------------------');
      }
    } 
    // Option 3: Display the details of a product by its ID.
    else if (choice == 3) {
      int? id = inputId();
      // Handle the case where the product with the given ID does not exist.
      if (id == null) {
        continue;
      }
      Product? product = productManager.getProductById(id);
      if (product == null) {
        print('Product not found');
        continue;
      }
      product.display();
    } 
    // Option 4: Edit the details of a product by its ID.
    else if (choice == 4) {
      int? id = inputId();
      // Handle the case where the product with the given ID does not exist.
      if (id == null) {
        continue;
      }
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
    }
    // Option 5: Delete a product by its ID.
    else if (choice == 5) {
      int? id = inputId();
      // Handle the case where the product with the given ID does not exist.
      if (id == null) {
        continue;
      }
      if (productManager.getProductById(id) == null) {
        print('Product not found');
        continue;
      }
      Product? product = productManager.getProductById(id);
      productManager.deleteProduct(id);
      print('Product deleted successfully');
      product!.display();
    } 
    // Option 6: Exit the application.
    else if (choice == 6) {
      print('Exiting...');
      break;
    }
    // Validate the user's menu choice to ensure it is a valid integer.
    else {
      print('Invalid choice');
    }
  }
}

// Entry point of the application. Starts the E-Commerce app.
void main() {
  ecommerceApp();
}