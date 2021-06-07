import 'package:agrwlnxt/Authentication/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrawal Guide',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.lightBlue,
        buttonColor: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}


