import 'package:agrwlnxt/Authentication/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:agrwlnxt/Authentication/registrationBox.dart';

void main() {
  runApp(MyApp());
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
      routes: {'Registration-form': (ctx) => RegistrationBox()},
    );
  }
}


