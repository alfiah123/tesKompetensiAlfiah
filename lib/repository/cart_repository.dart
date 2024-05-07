import '../model/modelCart.dart';

class CartRepository {
  static List<CartItem> cartItems = [];

  static double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
