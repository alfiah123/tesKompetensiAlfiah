import 'package:flutter/material.dart';
import '../model/modelOrders.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderItem order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pesanan',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Pesanan:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '${order.orderNumber}',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tanggal:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '${order.date}',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Harga:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Rp ${order.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Status:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: 'SFPro',
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '${order.status}',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'SFPro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
