import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home_pageAdmin.dart';
import '../model/modelProducts.dart';
import '../repository/product_repository.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  EditProductPage({
    required this.product,
  });

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current product data
    productNameController.text = widget.product.productName;
    priceController.text = widget.product.price.toString();
    descriptionController.text = widget.product.description;
    imageUrlController.text = widget.product.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: imageUrlController,
              decoration: InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String productName = productNameController.text;
                double price = double.parse(priceController.text);
                String description = descriptionController.text;
                String imageUrl = imageUrlController.text;

                Product updatedProduct = Product(
                  productName: productName,
                  description: description,
                  price: price,
                  imageUrl: imageUrl,
                  jenisMakanan: widget.product.jenisMakanan,
                );

                ProductRepository.updateProduct(widget.product, updatedProduct);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageAdmin()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
              child: Text('Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
