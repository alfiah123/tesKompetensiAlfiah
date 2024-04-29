import 'package:flutter/material.dart';
import 'view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi pemesanan',
      theme: ThemeData(
        primaryColor: Colors.black,
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SFPro',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          bodyText1: TextStyle(
              fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black),
          button: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          labelStyle: TextStyle(color: Colors.black),
          prefixStyle: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
            textStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
          ),
        ),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
