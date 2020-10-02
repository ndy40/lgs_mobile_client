import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/models/auth.dart';
import 'package:lgs_mobile_client/providers/auth.dart';
import 'package:lgs_mobile_client/screens/login_screen.dart';
import 'package:lgs_mobile_client/styles.dart';
import 'package:provider/provider.dart';

checkNotEmpty(value, fieldName) {
  if (value.isEmpty || null == value) {
    return "$fieldName cannot be empty";
  }

  return null;
}

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Center(
          child: SingleChildScrollView(
              child: Form(key: _formKey, child: getFormFields(context)))),
    );
  }

  doSubmit() {
    if (_formKey.currentState.validate()) {
      showSnackBar(_scaffold,
          message: "Processing ...", duration: const Duration(seconds: 5));
    }
    _submit();
  }

  Widget getFormFields(context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              controller: this.firstNameController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: lgsPrimaryColour)),
                hintText: 'First Name',
              ),
              validator: (value) => checkNotEmpty(value, 'First Name')),
          spaceSizeBox(),
          TextFormField(
            controller: this.lastNameController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lgsPrimaryColour)),
              hintText: 'Last Name',
            ),
            validator: (value) => checkNotEmpty(value, 'Last Name'),
          ),
          spaceSizeBox(),
          TextFormField(
            controller: this.emailController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lgsPrimaryColour)),
              hintText: 'Email',
            ),
            validator: (value) => checkNotEmpty(value, 'Email'),
          ),
          spaceSizeBox(),
          TextFormField(
            controller: this.passwordController,
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lgsPrimaryColour)),
              hintText: 'Password',
            ),
            validator: (value) => checkNotEmpty(value, 'Password'),
          ),
          spaceSizeBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: appRaisedButton('Register', doSubmit)),
            ],
          ),
          spaceSizeBox(),
          Row(children: [
            Text('Already have an account?'),
            TextButton(
              child: Text('Sign In'),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            )
          ])
        ],
      ),
    );
  }

  void _submit() {
    final user = RegistrationModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final status = authProvider.signUp(user);

    switch (status) {
      case Status.Registered:
        _formKey.currentState.reset();

        showSnackBar(_scaffold,
            message:
                "Registration successful. An activation email has been sent",
            type: MessageType.successful);

        Navigator.pushNamed(context, LoginScreen.routeName);
        break;
      default:
        showSnackBar(_scaffold,
            message: authProvider.errors.description, type: MessageType.error);
    }
  }
}
