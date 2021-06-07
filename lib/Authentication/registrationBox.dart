import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationBox extends StatefulWidget {

  String _userName;
  String _phnNo;
  String _emailId;
  String _password;
  var _id;
  final Function registrationDone;

  RegistrationBox(this.registrationDone){

    this._userName = null;
    this._phnNo = null;
    this._emailId = null;
    this._password = null;
    this._id = null;
  }

  @override
  _RegistrationBoxState createState() => _RegistrationBoxState();
}

class _RegistrationBoxState extends State<RegistrationBox> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible;
  String _passwdCheck;
  bool _flag;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _flag = false;
  }

  void openDialoge(BuildContext context , String title){
    showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        builder: (_)=>AlertDialog(
          title: Text('Registration'),
          content: Text(title),
          elevation: 20,
          actions: [
            FlatButton(
              child: Text('Okay',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              onPressed: (){
                widget.registrationDone();
                Navigator.of(context).pop();
              }
            ),
          ],
        )
    );
  }

  Future <bool> checkExistence() {
    
FirebaseFirestore.instance.collection('/Users').snapshots()
      .listen((data) { 
        data.docs.singleWhere((element){
          return _flag = (element['email-Id'] == '${widget._emailId}' ? true : false);
        });
      });
       
    return Future.delayed(
      Duration(seconds: 2),
      () => _flag);
    
  }

  void _singUp() async {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();

      var check = await checkExistence();
      if(check)
      {
        openDialoge(context, 'User already exist with this email id');
      }
      else{
        setState(() {
          widget._id = FirebaseFirestore.instance.collection('/Users').add({
            'Name': widget._userName,
            'email-Id':widget._emailId,
            'password': widget._password,
            'phnNo': widget._phnNo,
          });
          widget._id == null ?  openDialoge(context, 'sorry,\nsomething went Wrong.. Try again later') : openDialoge(context, 'Welcome to Agrawal-Next,\n Login to continue');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Form(
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
                    validator: (value) => value.isEmpty
                        ? 'Please enter your name'
                        : (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                .hasMatch(value))
                            ? 'Invalid name'
                            : null,
                    onSaved: (value) {
                      widget._userName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone.No',
                      hintText: 'Enter your mobile number',
                      prefixText: '+91',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(value) ||
                                value.length == 0)
                            ? 'Invalid phone number'
                            : null,
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      widget._phnNo = value;
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => !EmailValidator.validate(value, true)
                        ? 'Invalid email id'
                        : null,
                    onSaved: (value) {
                      widget._emailId = value;
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
                      _passwdCheck = value;
                      return value.length < 7
                          ? 'Password must be at least 7 characters long'
                          : null;
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
                    validator: (value) => value != _passwdCheck
                        ? 'password doesn\'t match'
                        : null,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value) {
                      widget._password = value;
                    },
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 6),
                    child: FlatButton(child: const Text('Sign Up',style: TextStyle(color:Colors.white)), onPressed:_singUp,color: Theme.of(context).primaryColor,)
                )
              ],
            )),
      ),
    );
  }
}

