import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lgs_mobile_client/authentication/screens.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/screens/AddShoppingListScreen.dart';

final routes = [
  GetPage(name: RegistrationScreen.routeName, page: () => RegistrationScreen()),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(
      name: ResetPasswordScreen.routeName, page: () => ResetPasswordScreen()),
  GetPage(name: Home.routeName, page: () => Home(), binding: HomeBindings()),
  GetPage(
      name: AddShoppingListScreen.routeName,
      page: () => AddShoppingListScreen(),
      binding: AddShoppingBinding()),
];

class AddShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddShoppingListController());
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}
