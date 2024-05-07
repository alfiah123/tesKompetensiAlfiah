import 'package:flutter/material.dart';

class AdminUserCRUDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Manage Admin Users', style: TextStyle(fontFamily: 'SFPro')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Admin User CRUD Page'),
      ),
    );
  }
}
