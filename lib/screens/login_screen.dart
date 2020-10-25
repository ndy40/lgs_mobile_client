import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/controllers/auth_controller.dart';
import 'package:lgs_mobile_client/models/models.dart';
import 'package:lgs_mobile_client/providers/auth.dart';
import 'package:lgs_mobile_client/screens/register_screen.dart';
import 'package:lgs_mobile_client/screens/reset_password_screen.dart';
import 'package:lgs_mobile_client/screens/shopping_list_screen.dart';
import 'package:lgs_mobile_client/styles.dart';

class LoginScreen extends GetWidget<AuthController> {
  static const routeName = '/login';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: buildLoginForm(),
          ),
        ),
      ),
    );
  }

  buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            FlatButton(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Get.toNamed(ResetPasswordScreen.routeName);
              },
            )
          ],
        ),
        spaceSizeBox(height: 15.4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: appRaisedButton("SIGN IN", loginUser),
            )
          ],
        ),
        spaceSizeBox(),
        Row(
          children: [
            Text("Don't have an account?"),
            TextButton(
              child: Text('Register'),
              onPressed: () {
                Get.toNamed(RegistrationScreen.routeName);
              },
            )
          ],
        )
      ]),
    );
  }

  loginUser() async {
    try {
      final login = Login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      _formKey.currentState.save();

      showSnackBar(_scaffold, message: "Processing...");

      await controller.signIn(login);
      UserController userController = Get.find<UserController>();

      switch (userController.status) {
        case Status.LoggedIn:
          _formKey.currentState.reset();
          Get.toNamed(ShoppingListScreen.routeName);
          break;
        default:
          Get.showSnackbar(GetBar(
            title: 'Login Error',
            message: 'Login failed',
            duration: Duration(seconds: 5),
          ));
      }
    } catch (e) {}
  }

  checkNotEmpty(value, fieldName) {
    if (value.isEmpty || null == value) {
      return "$fieldName cannot be empty";
    }

    return null;
  }
}
