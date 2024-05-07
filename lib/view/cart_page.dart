import 'package:flutter/material.dart';
import 'payment_page.dart';
import '../repository/cart_repository.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    CartRepository.cartItems.forEach((item) {
      total += item.price * item.quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: CartRepository.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = CartRepository.cartItems[index];
                  return ListTile(
                    title: Text(
                      cartItem.productName,
                      style: TextStyle(fontFamily: 'SFPro'),
                    ),
                    subtitle: Text(
                      'Price: \Rp${cartItem.price.toStringAsFixed(2)}',
                      style: TextStyle(fontFamily: 'SFPro'),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (cartItem.quantity > 1) {
                                cartItem.quantity--;
                              } else {
                                CartRepository.cartItems.removeAt(index);
                              }
                            });
                          },
                        ),
                        Text(
                          '${cartItem.quantity.toString()}',
                          style: TextStyle(fontFamily: 'SFPro'),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              cartItem.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Total:',
                style: TextStyle(fontFamily: 'SFPro'),
              ),
              trailing: Text(
                '\Rp${total.toStringAsFixed(2)}',
                style: TextStyle(fontFamily: 'SFPro'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Checkout',
              style: TextStyle(fontFamily: 'SFPro'),
            ),
          ),
        ),
      ),
    );
  }
}
