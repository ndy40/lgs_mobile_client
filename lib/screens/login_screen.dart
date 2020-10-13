import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/models/auth.dart';
import 'package:lgs_mobile_client/providers/auth.dart';
import 'package:lgs_mobile_client/screens/register_screen.dart';
import 'package:lgs_mobile_client/screens/shopping_list_screen.dart';
import 'package:lgs_mobile_client/styles.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginForm());
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();
  final LoginModel loginModel = new LoginModel();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    if (Provider.of<UserProvider>(context, listen: false).user.id != null) {
      pushShoppingScreen();
    }
  }

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
      child: Column(children: [
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
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
            )
          ],
        )
      ]),
    );
  }

  loginUser() async {
    try {
      final loginModel = LoginModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      _formKey.currentState.save();

      showSnackBar(_scaffold, message: "Processing...");

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.signIn(loginModel);

      switch (authProvider.loggedInStatus) {
        case Status.LoggedIn:
          _formKey.currentState.reset();
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);

          userProvider.setUser(authProvider.user);
          userProvider.setToken(authProvider.token);

          pushShoppingScreen();
          break;
        default:
          showSnackBar(_scaffold,
              message: authProvider.errors.description,
              type: MessageType.error);
      }
    } catch (e) {}
  }

  checkNotEmpty(value, fieldName) {
    if (value.isEmpty || null == value) {
      return "$fieldName cannot be empty";
    }

    return null;
  }

  pushShoppingScreen() {
    Navigator.pushReplacementNamed(
      context,
      ShoppingListScreen.routeName,
    );
  }
}
