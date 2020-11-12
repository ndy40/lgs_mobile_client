import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/common/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  static const icon = Icons.settings;

  static const title = 'Setting';

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();

    return Center(
      child: Column(
        children: [
          Text('Settings Page'),
          appRaisedButton('Sign Out', () {
            controller.signOut();
          }),
        ],
      ),
    );
  }
}
