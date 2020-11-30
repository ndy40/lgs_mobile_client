import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/settings/screens.dart';
import 'package:lgs_mobile_client/shopping/screens/active_shopping_screen.dart';
import 'package:lgs_mobile_client/shopping/screens/shopping_list_screen.dart';
import 'package:lgs_mobile_client/shopping/screens/socials_screen.dart';

class HomeController extends GetxController {
  RxString _index = ''.obs;

  RxInt selectedIndex = 0.obs;

  String get currentIndex =>
      _index.value.isEmpty ? MyShoppingLists.routeName : _index.value;

  List<Widget> screens;

  set current(String index) {
    if (!index.isNullOrBlank) {
      _index.value = index;
    } else
      _index.value = MyShoppingLists.routeName;
  }

  List<Widget> actionButtons(BuildContext context) {
    if (screen is HasActionButtons) {
      return (screen as HasActionButtons).getActionButtons(context);
    }

    return null;
  }

  @override
  void onInit() {
    screens = _screens.values.toList();
  }

  RxMap<String, Widget> _screens = {
    ActiveShopping.routeName: ActiveShopping(),
    MyShoppingLists.routeName: MyShoppingLists(),
    Socials.routeName: Socials(),
    SettingsScreen.routeName: SettingsScreen()
  }.obs;

  Widget get screen => _screens.values.toList()[selectedIndex.value];
}
