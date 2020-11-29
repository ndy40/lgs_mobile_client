import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/widgets.dart';

import '../../styles.dart';
import '../controllers.dart';
import '_login_screens.dart';

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
                          } on DioErrorType {
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