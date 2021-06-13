import 'package:agrwlnxt/Authentication/forgotPasswdBox.dart';
import 'package:agrwlnxt/Authentication/userClass.dart';
import 'package:agrwlnxt/Quiz-Folder/quiz_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:email_validator/email_validator.dart';

class LoginBox extends StatefulWidget {
  String _userid;
  String _passWord;
  String _username;

  LoginBox() {
    this._userid = null;
    this._passWord = null;
    this._username = null;
  }

  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible;
  int _loginMsg;
  bool _loginMsgVisible;
  bool _flag;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _loginMsgVisible = false;
    _loginMsg = null;
  }

  void successfullLogin(
      BuildContext context, UserCheck userCheck, String userName) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => QuizScreen(widget._userid,widget._username)));
  }

  Future<bool> checkExistence(UserCheck userCheck) {
    FirebaseFirestore.instance.collection('/Users').snapshots().listen((data) {
      
      var userDoc = data.docs.singleWhere(
        (element) {
          return (element['email-Id'] == '${userCheck.emailId}' && element['password'] == '${userCheck.password}');
        }, 
        orElse: () {
          return data.docs.first;
        }
      );

      _flag = (userDoc['email-Id'] == userCheck.emailId) ? true : false;
      widget._username = userDoc['Name'];

    });
    return Future.delayed(Duration(seconds: 5), () {
      return _flag;
    });
  }

  void _login(BuildContext context) async {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      var userCheck =
          new UserCheck(emailId: widget._userid, password: widget._passWord);

      showDialog(
        context: context,
        barrierDismissible: false,
        child: AlertDialog(
            title: Text('Please Wait..'),
            content: SizedBox(
              height: 70,
              child: Center(child: CircularProgressIndicator()),
            )),
      );

      var check = await checkExistence(userCheck);

      Navigator.of(context).pop();

      check
          ? successfullLogin(context, userCheck, widget._username)
          : _loginMsg = 1;

      setState(() {
        _loginMsgVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => !EmailValidator.validate(value, true)
                        ? 'please enter valid an email id'
                        : null,
                    onSaved: (value) {
                      widget._userid = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
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
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value) {
                      widget._passWord = value;
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                useSafeArea: true,
                                builder: (context) => ForgotPasswordBox());
                          },
                        ),
                        FlatButton(
                          child: const Text('Login',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () => _login(context),
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Visibility(
                visible: _loginMsgVisible,
                child: Center(
                    child: _loginMsg == null
                        ? CircularProgressIndicator()
                        : Text('Invalid email address or Password',
                            style: TextStyle(color: Colors.red))))
          ],
        ),
      ),
    );
  }
}

/*
      FirebaseFirestore.instance.collection('/Users').snapshots()
        .listen((data){
          data.docs.forEach((element) {
            (element['email-Id'] == '${widget._userid}' && element['password'] == '${widget._passWord}')
              ? successfullLogin(context)
              : _loginMsg = 1;
        });
      });
*/
