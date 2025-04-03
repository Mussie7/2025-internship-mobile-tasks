import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // For image uploading
import 'dart:io';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // Variables to store user input
  File? _imageFile; // For storing the uploaded image
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // For form validation

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Store the picked image
      });
    }
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
        title: Text('Add Product', style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image upload section
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(10)),
                          child:
                              _imageFile == null
                                  ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/iconsax-svg/Svg/All/linear/image.svg',
                                          height: 40,
                                          width: 40,
                                        ),
                                        SizedBox(height: 25),
                                        Text(
                                          'upload image',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF3E3E3E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : Image.file(_imageFile!, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'name',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3E3E3E),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Name input
                      TextFormField(
                        controller: _nameController,
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
                            return 'Please enter the product name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        'category',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3E3E3E),
                        ),
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
                      Text(
                        'price',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3E3E3E),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Price input
                      TextFormField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF3F3F3), // Background fill color
                          filled: true, // Enables the filled background
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ), // Removes all borders including the underline
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust spacing
                          suffixIcon: Icon(
                            Icons.attach_money_rounded,
                            color: Color(0xFF3E3E3E),
                            size: 18.0,
                          ), // Suffix icon for currency
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the price';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        'description',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3E3E3E),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Description input
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF3F3F3), // Background fill color
                          filled: true, // Enables the filled background
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ), // Removes all borders including the underline
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust spacing
                        ),
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      // Spacer(),
                      SizedBox(height: 20),
                      // Submit button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process the product data here
                            debugPrint('Product Added: ${_nameController.text}');
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text('Product Added Successfully.')));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "ADD",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Delete button
                      OutlinedButton(
                        onPressed: () {
                          // Handle product deletion
                          setState(() {
                            _imageFile = null;
                            _nameController.clear();
                            _categoryController.clear();
                            _priceController.clear();
                            _descriptionController.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Deleted')));
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 1.0), // Border color
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: Text(
                          'DELETE',
                          style: GoogleFonts.poppins(fontSize: 12, color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
