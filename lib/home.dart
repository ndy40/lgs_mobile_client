import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/styles.dart';

class Home extends StatelessWidget {
  static const routeName = '/';

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text("Lets Go Shopping", style: appTextOnPrimary)),
          ),
          body: controller.screen,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle_fill,
                  ),
                  label: "Active"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt,
                ),
                label: "List",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people_alt,
                  ),
                  label: "Social"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Settings"),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
