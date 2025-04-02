import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_task/product.dart';
import 'package:layout_task/product_detail_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20.0),

          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
              color: const Color(0xFFCCCCCC),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mar 27, 2025',
              style: GoogleFonts.syne(fontWeight: FontWeight.w200, fontSize: 12.0, color: Color(0xFFAAAAAA)),
            ),
            SizedBox(height: 2.0),
            Text.rich(
              TextSpan(
                text: 'Hello, ',
                style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w300),
                children: [TextSpan(text: 'John', style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.bold))],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                debugPrint('Notification button tapped');
              },
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/iconsax-svg/Svg/All/outline/notification-bing.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Available Products", style: GoogleFonts.poppins(fontSize: 21.0, fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {
                    debugPrint("search button pressed");
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1),
                    ),
                    padding: EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      'assets/icons/iconsax-svg/Svg/Category/Search/vuesax/outline/search-normal-1.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '',
        shape: ShapeBorder.lerp(CircleBorder(), StadiumBorder(), 0.5),
        child: SvgPicture.asset(
          'assets/icons/iconsax-svg/Svg/All/outline/add.svg',
          width: 44,
          height: 44,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
