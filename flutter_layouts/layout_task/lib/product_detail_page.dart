import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_task/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product product = Product(
    category: "Men's Shoes",
    imageAssetPath: 'assets/images/mens_shoe_2.jpg',
    description:
        "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    name: "Derby Leather Shoes",
    price: 120.0,
  );

  List<Card> _buildSizeCards(BuildContext context) {
    int startingSize = 39;
    int endingSize = 45;

    return List.generate(
      endingSize - startingSize + 1, // Number of cards
      (index) {
        int size = startingSize + index;
        return Card(
          color: Colors.white,
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Text(size.toString(), style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Image.asset(
            product.imageAssetPath,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: DefaultTextStyle(
              style: TextStyle(decoration: TextDecoration.none, color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.category, style: GoogleFonts.poppins(fontSize: 13.0, color: Color(0xFFAAAAAA))),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded, color: Color(0xFFFFD700), size: 20.0),
                          SizedBox(width: 2.0),
                          Text(
                            "(${product.rating.toString()})",
                            style: GoogleFonts.sora(color: Color(0xFFAAAAAA), fontSize: 13.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      Text(
                        '\$${product.price.toString()}',
                        style: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text("Size:", style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: ListView(scrollDirection: Axis.horizontal, children: _buildSizeCards(context)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.description,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(fontSize: 13.0, fontWeight: FontWeight.w500, color: Color(0xFF666666)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
