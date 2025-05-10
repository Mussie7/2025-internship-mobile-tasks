import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_task/product.dart';
import 'package:layout_task/product_detail_page.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final _searchController = TextEditingController();
  final _categoryController = TextEditingController(); // Holds the selected category
  double _minPrice = 0; // Minimum price for slider
  double _maxPrice = 1000; // Maximum price for slider

  // Search logic placeholder
  void _performSearch() {
    String query = _searchController.text;
    debugPrint('Search initiated for: $query');
    // Add logic to filter products based on query
  }

  // Show bottom sheet for filters
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'category',
                style: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500, color: Color(0xFF3E3E3E)),
              ),
              SizedBox(height: 10),
              // Category input
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF3F3F3), // Background fill color
                  filled: true, // Enables the filled background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ), // Removes all borders including the underline
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust spacing
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Price slider
              Text('Price Range:'),
              RangeSlider(
                values: RangeValues(_minPrice, _maxPrice),
                min: 0,
                max: 1000,
                divisions: 100,
                labels: RangeLabels('$_minPrice', '$_maxPrice'),
                onChanged: (values) {
                  setState(() {
                    _minPrice = values.start;
                    _maxPrice = values.end;
                  });
                },
              ),
              SizedBox(height: 16),
              // Apply button
              ElevatedButton(
                onPressed: () {
                  debugPrint('Filters applied: ${_categoryController.text}, $_minPrice-$_maxPrice');
                  Navigator.of(context).pop(); // Close the bottom sheet
                  // Add logic to filter products based on category and price range
                },
                child: Text(
                  "APPLY",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Card> _buildListCards(BuildContext context) {
    List<Product> products = [
      Product(
        category: "Men's Shoes",
        imageAssetPath: 'assets/images/mens_shoe_1.jpg',
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        name: "Derby Leather Shoes",
        price: 120.0,
      ),
      Product(
        category: "Men's Shoes",
        imageAssetPath: 'assets/images/mens_shoe_2.jpg',
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        name: "Derby Leather Shoes",
        price: 120.0,
      ),
      Product(
        category: "Men's Shoes",
        imageAssetPath: 'assets/images/mens_shoe_3.jpg',
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        name: "Derby Leather Shoes",
        price: 120.0,
      ),
    ];

    if (products.isEmpty) {
      return const <Card>[];
    }

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.asset(product.imageAssetPath, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      Text(
                        '\$${product.price.toString()}',
                        style: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.category, style: GoogleFonts.poppins(fontSize: 10.0, color: Color(0xFFAAAAAA))),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded, color: Color(0xFFFFD700), size: 20.0),
                          SizedBox(width: 2.0),
                          Text(
                            "(${product.rating.toString()})",
                            style: GoogleFonts.sora(color: Color(0xFFAAAAAA), fontSize: 10.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
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
        centerTitle: true,
        title: Text('Search Product', style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar and Filter Button Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF666666),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
                        onPressed: _performSearch, // Call search logic
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(12.0), minimumSize: Size(24, 24)),
                  onPressed: _showFilterBottomSheet, // Show the filter bottom sheet
                  child: Icon(Icons.filter_list, color: Colors.white, size: 24.0),
                ),
              ],
            ),
            SizedBox(height: 24.0), // Spacing between search bar and product list
            // Product List
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children:
                    _buildListCards(context).map((card) {
                      return InkWell(
                        // Handle the tap event here, e.g., navigate to a detail page
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
                          debugPrint("Card tapped");
                        },
                        child: card,
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
