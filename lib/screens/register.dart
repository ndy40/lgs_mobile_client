import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Form(key: _formkey, child: getContent())),
    );
  }
}

getContent() {
  final spacing = 20.0;

  return Container(
    padding: EdgeInsets.all(25.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'First Name',
          ),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Last Name'),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Email'),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
          obscuringCharacter: '*',
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, spacing, 0, spacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: const RaisedButton(
                  onPressed: null,
                  child: Text('Register'),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
