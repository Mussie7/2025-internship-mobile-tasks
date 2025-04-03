import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_task/product.dart';

// Main widget for the product detail page
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? selectedSize; // Holds the currently selected shoe size
  // Sample product data
  Product product = Product(
    category: "Men's Shoes",
    imageAssetPath: 'assets/images/mens_shoe_2.jpg',
    description:
        "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    name: "Derby Leather Shoes",
    price: 120.0,
  );

  // Helper method to build a list of size cards
  List<GestureDetector> _buildSizeCards(BuildContext context) {
    int startingSize = 39; // Starting shoe size
    int endingSize = 45; // Ending shoe size

    return List.generate(
      endingSize - startingSize + 1, // Number of cards
      (index) {
        int size = startingSize + index;
        bool isSelected = size == selectedSize; // Check if this size is selected

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = isSelected ? null : size; // Toggle selection
              debugPrint('Selected size: $size'); // Debug print for selected size
            });
          },
          child: Card(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            child: Container(
              width: 50,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                size.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Full screen width
      height: MediaQuery.of(context).size.height, // Full screen height
      padding: const EdgeInsets.only(bottom: 20.0), // Margin for the bottom
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          // Product image with back button
          Stack(
            children: [
              Image.asset(
                product.imageAssetPath,
                height: MediaQuery.of(context).size.height * 0.35, // 35% of screen height
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 60.0, // Position from the top
                left: 20.0, // Position from the left
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Semi-transparent background
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_back_ios_new_rounded, color: Theme.of(context).primaryColor, size: 18.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Spacing
          // Product details section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: DefaultTextStyle(
                style: TextStyle(decoration: TextDecoration.none, color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Category and rating row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.category, style: GoogleFonts.poppins(fontSize: 13.0, color: Color(0xFFAAAAAA))),
                        Row(
                          children: [
                            Icon(Icons.star_rate_rounded, color: Color(0xFFFFD700), size: 20.0), // Star icon
                            SizedBox(width: 2.0), // Spacing
                            Text(
                              "(${product.rating.toString()})", // Product rating
                              style: GoogleFonts.sora(color: Color(0xFFAAAAAA), fontSize: 13.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15), // Spacing
                    // Product name and price row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name, // Product name
                          style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Text(
                          '\$${product.price.toString()}', // Product price
                          style: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15), // Spacing
                    // Size selection section
                    Text("Size:", style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 15), // Spacing
                    SizedBox(
                      height: 60, // Height of the size cards
                      child: ListView(scrollDirection: Axis.horizontal, children: _buildSizeCards(context)),
                    ),
                    const SizedBox(height: 15), // Spacing
                    // Product description
                    Text(
                      product.description,
                      textAlign: TextAlign.justify, // Justified text alignment
                      style: GoogleFonts.poppins(fontSize: 13.0, fontWeight: FontWeight.w500, color: Color(0xFF666666)),
                    ),
                    Spacer(), // Spacer to push the button to the bottom
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            debugPrint("Delete button pressed"); // Action for delete button
                          },
                          style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFFF1313), width: 1.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("DELETE", style: GoogleFonts.poppins(fontSize: 13, color: Color(0xFFFF1313))),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            debugPrint("Update button pressed"); // Action for update button
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("UPDATE", style: GoogleFonts.poppins(fontSize: 13, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
