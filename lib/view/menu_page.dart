import 'package:flutter/material.dart';
import 'package:teskompetensi_alfiah/view/productdetail_page.dart';
import '../model/modelProducts.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = 'Semua';
  final List<Product> products = [
    Product(
      productName: 'Nasi Goreng',
      description: 'Nasi goreng dengan bumbu rempah khas Indonesia.',
      price: 15000,
      imageUrl:
          'https://nilaigizi.com/assets/images/produk/produk_1578041377.jpg',
      jenisMakanan: 'Makanan',
    ),
    Product(
      productName: 'Es Teh Manis',
      description: 'Es teh manis dengan tambahan es serut.',
      price: 5000,
      imageUrl:
          'https://nilaigizi.com/assets/images/produk/produk_1578041377.jpg',
      jenisMakanan: 'Minuman',
    ),
  ];

  List<Product> filteredProducts() {
    if (selectedCategory == 'Semua') {
      return products;
    } else {
      return products
          .where((product) => product.jenisMakanan == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page', style: TextStyle(fontFamily: 'SFPro')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Makanan',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Semua';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedCategory == 'Semua'
                        ? Colors.black
                        : Colors.grey,
                  ),
                  child: Text('Semua', style: TextStyle(fontFamily: 'SFPro')),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Makanan';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedCategory == 'Makanan'
                        ? Colors.black
                        : Colors.grey,
                  ),
                  child: Text('Makanan', style: TextStyle(fontFamily: 'SFPro')),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = 'Minuman';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedCategory == 'Minuman'
                        ? Colors.black
                        : Colors.grey,
                  ),
                  child: Text(
                    'Minuman',
                    style: TextStyle(fontFamily: 'SFPro'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: filteredProducts().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: filteredProducts()[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          filteredProducts()[index].imageUrl,
                          height: 120.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredProducts()[index].productName,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SFPro',
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                filteredProducts()[index].description,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontFamily: 'SFPro',
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Rp ${filteredProducts()[index].price.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SFPro',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
