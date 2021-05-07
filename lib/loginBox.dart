import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginBox extends StatefulWidget {
  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: Colors.transparent,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: constraints.maxHeight * 0.2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SizedBox.expand(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Mobile number or email address',
                          border: OutlineInputBorder(),
                        ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SizedBox.expand(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                      child: const Text('Login'),
                      onPressed: (){}),
                )
              ]);
        }));
  }
}
