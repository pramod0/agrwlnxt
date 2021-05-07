import 'package:flutter/material.dart';
import 'package:agrwlnxt/loginBox.dart';
import 'package:agrwlnxt/registrationForm.dart';

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
      home: LoginPage(),
      routes: {'Registration-form': (ctx) => RegistrationForm()},
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void registrationForm(BuildContext context) {
    Navigator.of(context).pushNamed('Registration-form');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            height: mediaQuery.size.height,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Images/Login-Background.jpg'),
                  fit: BoxFit.cover),
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        height: constraints.maxHeight * 0.15,
                        width: constraints.maxWidth * 0.8,
                        child: Image.asset('assets/Images/Agrawal-image.png')),
                    Container(
                        height: constraints.maxHeight * 0.45,
                        width: constraints.maxWidth,
                        color: Colors.transparent,
                        child: LoginBox()),
                    Container(
                      height: constraints.maxHeight * 0.1,
                      width: constraints.maxWidth,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text('Don\'t have an Account ? Sing up'),
                        onPressed: () => registrationForm(context),
                      ),
                    )
                  ]);
            })),
      ),
    );
  }
}
