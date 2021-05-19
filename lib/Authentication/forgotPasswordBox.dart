import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordBox extends StatefulWidget {
  @override
  _ForgotPasswordBoxState createState() => _ForgotPasswordBoxState();
}

class _ForgotPasswordBoxState extends State<ForgotPasswordBox> {
  bool _isCorrect;
  final _formKey = GlobalKey<FormFieldState>();
  String _userInput;
  int _flag;

  @override
  void initState() {
    super.initState();
    _isCorrect = false;
  }

  void _emailCheck() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();

      if (_userInput == 'urveshtrivedi123@gmail.com' ||
          _userInput ==
              '7738943702') //Here we will check in the database for user's emaill Id
      {
        _flag = 1;
        setState(() {
          _isCorrect = true;
        });
      } else {
        _flag = 0;
        setState(() {
          _isCorrect = true;
        });
      }
    } else {
      setState(() {
        _isCorrect = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Password Reset'),
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Enter your Registered \nphone number / email id -',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  child: TextFormField(
                    key: _formKey,
                    decoration: InputDecoration(
                        hintText: 'Enter here',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => !EmailValidator.validate(value, true)
                        ? (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                    .hasMatch(value) ||
                                value.length == 0)
                            ? 'Invalid input'
                            : null
                        : null,
                    onSaved: (value) {
                      _userInput = value;
                    },
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: TextButton(
                      child: const Text('Verify'), onPressed: _emailCheck)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: _isCorrect
                ? RichText(
                    text: TextSpan(
                        text: _flag == 1
                            ? 'We will send you the password reset link on'
                            : 'User Not found -',
                        style: TextStyle(color: Colors.black),
                        children: [
                        TextSpan(
                            text: ' $_userInput',
                            style: TextStyle(
                                color: _flag == 1 ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold))
                      ]))
                : null,
          )
        ],
      ),
      actions: [
        FlatButton(
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FlatButton(
            child: const Text('Send'),
            onPressed: (_flag == 1 && _isCorrect == true)
                ? () {
                    //here we will write the code to send the password reset link to the given emial id i.e _userInput
                    Navigator.of(context).pop();
                  }
                : null)
      ],
    );
  }
}
