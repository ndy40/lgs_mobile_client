import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/common/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(), permanent: true);

    return Center(
      child: Column(
        children: [
          Text('Settings Page'),
          appRaisedButton('Sign Out', () {
            Get.find<AuthController>().signOut();
          }),
        ],
      ),
    );
  }
}
