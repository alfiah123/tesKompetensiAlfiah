import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home_pageAdmin.dart';
import '../model/modelProducts.dart';
import '../repository/product_repository.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController jenisMakananController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedJenisMakanan = 'Makanan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product', style: TextStyle(fontFamily: 'SFPro')),
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
            DropdownButtonFormField<String>(
              value: selectedJenisMakanan,
              onChanged: (newValue) {
                setState(() {
                  selectedJenisMakanan = newValue!;
                });
              },
              items: <String>['Makanan', 'Minuman']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Jenis Makanan',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String productName = productNameController.text;
                double price = double.parse(priceController.text);
                String imageUrl = imageUrlController.text;
                String description = descriptionController.text;

                Product myProduct = Product(
                  productName: productName,
                  description: description,
                  price: price,
                  imageUrl: imageUrl,
                  jenisMakanan: selectedJenisMakanan,
                );

                ProductRepository.addProduct(myProduct);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageAdmin()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
