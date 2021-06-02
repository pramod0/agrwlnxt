import 'package:agrwlnxt/Authentication/registrationBox.dart';
import 'package:flutter/material.dart';
import 'package:agrwlnxt/Authentication/loginBox.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin;

  @override
  void initState() {
    super.initState();
    _isLogin = true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool _keyboardIsOpen = mediaQuery.viewInsets.bottom != 0;

    double _screenHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    double _screenWidth = mediaQuery.size.width -
        mediaQuery.padding.left -
        mediaQuery.padding.right;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: _screenHeight,
              width: _screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/Login-Background.jpg'),
                    fit: BoxFit.cover),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: constraints.maxHeight * 0.11,
                          width: constraints.maxWidth * 0.7,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            'assets/Images/logo.png',
                            fit: BoxFit.contain,
                          )),
                      Container(
                          height: constraints.maxHeight * 0.45,
                          width: constraints.maxWidth * 0.9,
                          child: Card(
                            elevation: 4,
                            color: Colors.transparent,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      _isLogin ? LoginBox() : RegistrationBox(),
                                ),
                              ),
                            ),
                          )),
                    ]);
              })),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !_keyboardIsOpen,
        child: FloatingActionButton.extended(
         backgroundColor: Colors.transparent,
         elevation: 4, 
          label: Text(
            _isLogin
                ? 'Don\'t have an Account ? Sign up'
                : 'Have an account ? Login now !',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
              FocusScope.of(context).unfocus();
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}