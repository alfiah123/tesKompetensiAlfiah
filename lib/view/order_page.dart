import 'package:flutter/material.dart';
import '../model/modelOrders.dart';
import '../repository/order_repository.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesanan',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: OrderRepository.orders.length,
        itemBuilder: (context, index) {
          final order = OrderRepository.orders[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Pesanan: ${order.orderNumber}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: 'SFPro',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Tanggal: ${order.date}',
                      style: TextStyle(fontFamily: 'SFPro'),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Total Harga: Rp ${order.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontFamily: 'SFPro'),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Status: ${order.status}',
                      style: TextStyle(fontFamily: 'SFPro'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
