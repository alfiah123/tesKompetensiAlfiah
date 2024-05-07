import 'package:flutter/material.dart';
import '../repository/user_repository.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun',
          style: TextStyle(fontFamily: 'SFPro'),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://static.thenounproject.com/png/642902-200.png'),
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                UserRepository.loggedInUser?.username ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFPro',
                ),
              ),
              SizedBox(height: 10),
              Text(
                UserRepository.loggedInUser?.address ?? '',
                style: TextStyle(fontSize: 18, fontFamily: 'SFPro'),
              ),
              SizedBox(height: 10),
              Text(
                UserRepository.loggedInUser?.role ?? '',
                style: TextStyle(fontSize: 18, fontFamily: 'SFPro'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  UserRepository.loggedInUser = null; // Clear loggedInUser
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  textStyle: TextStyle(fontSize: 18, fontFamily: 'SFPro'),
                ),
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
