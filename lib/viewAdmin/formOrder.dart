import 'package:flutter/material.dart';
import '../model/modelProducts.dart';

class OrderFormPage extends StatefulWidget {
  final Product? product;

  OrderFormPage({this.product});

  @override
  _OrderFormPageState createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _productNameController.text = widget.product!.productName;
      _quantityController.text = '1'; // Default quantity
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product != null ? 'Edit Order' : 'Add Order',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _productNameController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data (e.g., save to database)
                    String productName = _productNameController.text;
                    int quantity = int.parse(_quantityController.text);
                    // Do something with the data, e.g., save it to database
                    // You can add your logic here for adding or editing orders
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontFamily: 'SFPro'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
