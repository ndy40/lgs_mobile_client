import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/styles.dart';

class Home extends StatelessWidget {
  static const routeName = '/';

  RxList<String> titleLists =
      ['Active', 'Shopping List', 'Socials', 'Settings'].obs;

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Container(
                margin: EdgeInsets.only(left: 5.5),
                child: Text(titleLists.value[controller.selectedIndex.value],
                    style: appTextOnPrimary.copyWith(
                        fontSize: 20.0, fontWeight: FontWeight.bold))),
            actions: controller.actionButtons(context),
          ),
          body: Obx(() => controller.screen),
          bottomNavigationBar: buildBottomNavigatiom(
              controller.selectedIndex.value,
              (index) => controller.selectedIndex.value = index),
        ));
  }

  buildBottomNavigatiom(int currentIndex, void onTab(int index)) {
    return BottomNavigationBar(
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
      onTap: onTab,
      type: BottomNavigationBarType.fixed,
    );
  }
}
