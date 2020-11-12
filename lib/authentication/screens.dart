import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/repositories.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/styles.dart';

checkNotEmpty(value, fieldName) {
  if (value.isEmpty || null == value) {
    return "$fieldName cannot be empty";
  }

  return null;
}

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

      Get.showSnackbar(GetBar(
        message: 'Processing...',
      ));

      Token token = await controller.signIn(login);
      UserController userController = Get.find<UserController>();

      if (token == null) {
        Get.showSnackbar(GetBar(
          title: 'Login Error',
          message: 'Login unsuccessful',
          duration: Duration(seconds: 5),
        ));
      } else if (userController.status == Status.LoggedIn) {
        _formKey.currentState.reset();
        Get.toNamed(Home.routeName);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  checkNotEmpty(value, fieldName) {
    if (value.isEmpty || null == value) {
      return "$fieldName cannot be empty";
    }

    return null;
  }
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

  void _submit() async {
    final user = RegistrationModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    final authProvider = apiClient.getService<AuthRepository>();
    final response = await authProvider.register(user);

    if (response.body.isEmpty) {
      showSnackBar(_scaffold, message: 'Error registering');
    } else {
      _formKey.currentState.reset();

      showSnackBar(_scaffold,
          message: "Registration successful. An activation email has been sent",
          type: MessageType.successful);

      Navigator.pushNamed(context, LoginScreen.routeName);
    }
  }
}

class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  static const routeName = '/reset_password';

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceSizeBox(),
                Text('Enter email and a reset link will be sent to you.'),
                spaceSizeBox(),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lgsPrimaryColour)),
                    hintText: 'Email',
                  ),
                  validator: (value) => checkNotEmpty(value, 'Email'),
                ),
                spaceSizeBox(),
                Row(
                  children: [
                    Expanded(
                      child: appRaisedButton('Reset email', () async {
                        if (_formKey.currentState.validate() &&
                            GetUtils.isEmail(emailController.text.trim())) {
                          _formKey.currentState.save();

                          String message =
                              'Password reset link has been emailed';
                          try {
                            await controller
                                .resetPassword(emailController.text.trim());
                          } on DioErrorType catch (e) {
                            message = 'Error sending email';
                          }

                          Get.showSnackbar(GetBar(
                            title: 'Password reset',
                            message: message,
                            duration: Duration(seconds: 5),
                          ));
                        }
                      }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
