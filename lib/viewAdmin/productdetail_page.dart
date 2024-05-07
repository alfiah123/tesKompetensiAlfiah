import 'package:flutter/material.dart';
import '../home_pageAdmin.dart';
import '../model/modelProducts.dart';
import '../repository/product_repository.dart';
import 'edit_product.dart';

class ProductDetailPageAdmin extends StatelessWidget {
  final Product product;

  ProductDetailPageAdmin({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.productName,
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  product.imageUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Harga: Rp ${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductPage(product: product),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Edit Product',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'SFPro',
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                ProductRepository.deleteProduct(product);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageAdmin()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Hapus Produk',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'SFPro',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
