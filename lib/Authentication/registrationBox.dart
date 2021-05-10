import 'package:flutter/material.dart';

class RegistrationBox extends StatefulWidget {
  @override
  _RegistrationBoxState createState() => _RegistrationBoxState();
}

class _RegistrationBoxState extends State<RegistrationBox> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible;
  String _passwdCheck;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void _singUp() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Full Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  print(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone.No',
                  hintText: 'Enter your mobile number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 10) {
                    return 'Please enter valid phone number';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  print(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Id',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty || !value.contains('@gmail.com')) {
                    return 'Please enter valid email address';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  print(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Set Password',
                  hintText: 'at least 7 characters',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 7) {
                    return 'Password must be at least 7 characters long';
                  } else {
                    _passwdCheck = value;
                    return null;
                  }
                },
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Re-enter your Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != _passwdCheck) {
                    return 'password doesn\'t match';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                onSaved: (value) {
                  print(value);
                },
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 6),
                child: RaisedButton(
                    child: const Text('Sing Up'), onPressed: _singUp))
          ],
        ));
  }
}
