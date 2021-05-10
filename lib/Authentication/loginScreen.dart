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

    return Scaffold(
      body: SafeArea(
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
      floatingActionButton: TextButton(
        child: Text(
          _isLogin ? 'Don\'t have an Account ? Sign up' : 'Have an account ? Login now !',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
