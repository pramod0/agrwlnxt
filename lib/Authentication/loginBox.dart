import 'package:agrwlnxt/Authentication/forgotpasswordBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void _login() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Mobile number or email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return 'User Not found';
            },
            onSaved: (value) {
              print(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return 'Invalid password';
              // find in database and compare using firebase
            },
            onSaved: (value) {
              print(value);
            },
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    'Forgot password ?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      useSafeArea: true,
                      builder: (context) => ForgotPasswordBox()
                    );
                  },
                ),
                RaisedButton(child: const Text('Login'), onPressed: _login)
              ],
            )),
      ]),
    );
  }
}
