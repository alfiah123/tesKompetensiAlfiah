import 'package:flutter/material.dart';
import 'package:teskompetensi_alfiah/view/menu_page.dart';
import 'package:teskompetensi_alfiah/view/order_page.dart';
import 'package:teskompetensi_alfiah/view/profile_page.dart';
import 'view/cart_page.dart';

class HomePageUser extends StatefulWidget {
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = <Widget>[
      MenuPage(),
      CartPage(),
      OrdersPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
