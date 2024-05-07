import 'package:flutter/material.dart';
import 'package:teskompetensi_alfiah/view/profile_page.dart';
import 'package:teskompetensi_alfiah/viewAdmin/order_page.dart';
import 'package:teskompetensi_alfiah/viewAdmin/product_page.dart';
import 'package:teskompetensi_alfiah/viewAdmin/user_admin.dart';
import 'package:teskompetensi_alfiah/viewAdmin/user_page.dart';
import 'view/cart_page.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = <Widget>[
      ProductListPage(),
      UserCRUDPage(),
      // AdminUserCRUDPage(),
      OrderCRUDPage(),
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
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Users',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'User Admin',
          // ),
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
