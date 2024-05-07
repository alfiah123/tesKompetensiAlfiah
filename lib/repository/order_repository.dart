import '../model/modelOrders.dart';

class OrderRepository {
  static List<OrderItem> orders = [
    OrderItem(
      orderNumber: 'ORD001',
      date: '30 April 2024',
      totalAmount: 25000,
      status: 'Dikirim',
    ),
    OrderItem(
      orderNumber: 'ORD002',
      date: '25 April 2024',
      totalAmount: 35000,
      status: 'Dikirim',
    ),
    OrderItem(
      orderNumber: 'ORD003',
      date: '20 April 2024',
      totalAmount: 40000,
      status: 'Dibatalkan',
    ),
  ];
}
