import 'package:flutter/cupertino.dart';


class User {

  final String userName;
  final String phnNo;
  final String emailId;
  final String password;

  User({
    @required this.userName,
    @required this.phnNo,
    @required this.emailId,
    @required this.password
  });
}


class UserCheck
{
  final String emailId;
  final String password;

  UserCheck({
    @required this.emailId,
    @required this.password
  });
  
}