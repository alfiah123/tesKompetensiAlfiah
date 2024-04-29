import 'package:flutter/material.dart';
import 'package:teskompetensi_alfiah/view/register_page.dart';
import '../home_pageUser.dart';
import '../home_pageAdmin.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'SFPro',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Adress',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                String role = 'user';

                if (role == 'admin') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageAdmin()),
                  );
                } else if (role == 'user') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageUser()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid role. Please contact support.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'SFPro',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SFPro',
                    ),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'SFPro',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
