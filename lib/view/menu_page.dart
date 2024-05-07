import 'package:flutter/material.dart';
import 'package:teskompetensi_alfiah/view/productdetail_page.dart';
import '../model/modelProducts.dart';
import '../repository/product_repository.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = 'Semua';

  List<Product> filteredProducts() {
    if (selectedCategory == 'Semua') {
      return ProductRepository.products;
    } else {
      return ProductRepository.products
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
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
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
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              filteredProducts()[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
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
