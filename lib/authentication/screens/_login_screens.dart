import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/bloc/authentication.dart';
import 'package:lgs_mobile_client/authentication/bloc/authentication_bloc.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/styles.dart';

import '_registration_screen.dart';
import '_reset_password.dart';

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
              child: buildLoginForm(context),
            )),
      ),
    );
  }

  buildLoginForm(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state.state == LoginFormState.submissionInProgress) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text('Processing ...'),
              ));
          } else if (state.state == LoginFormState.success) {
            Get.find<UserPreferenceService>().saveToken(state.token);
            context.read<AuthenticationBloc>().add(AuthenticationStateChanged(
                status: AuthenticatedState(token: state.token)));
          }
        },
        child: Container(
          padding: EdgeInsets.all(15.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _UsernameInput(),
            spaceSizeBox(),
            _PasswordInput(),
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
                  child: _LoginButton(),
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
        ));
  }

  checkNotEmpty(value, fieldName) {
    if (value.isEmpty || null == value) {
      return "$fieldName cannot be empty";
    }

    return null;
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
        previous.login.email != current.login.email,
        builder: (context, state) {
          return TextFormField(
            key: const Key('LoginForm_usernameInput_textField'),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lgsPrimaryColour)),
              hintText: 'Email',
            ),
            validator: (value) => checkNotEmpty(value, 'Email'),
            onChanged: (value) =>
                context.read<LoginCubit>().emailUpdated(value),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
        previous.login.password != current.login.password,
        builder: (context, state) {
          return TextFormField(
            key: const Key('loginForm_passwordInput_textField'),
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lgsPrimaryColour)),
              hintText: 'Password',
            ),
            validator: (value) => checkNotEmpty(value, 'Password'),
            onChanged: (value) =>
                context.read<LoginCubit>().passwordUpdated(value),
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.state != current.state,
        builder: (context, state) {
            return state.state == LoginFormState.submissionInProgress
                ? const CircularProgressIndicator()
                : appRaisedButton("SIGN IN", () {
                      context.read<LoginCubit>().authenticate();
                  });
        }
        );
  }
}
