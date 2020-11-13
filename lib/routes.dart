import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lgs_mobile_client/authentication/screens.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/screens/AddShoppingListScreen.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

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
    final service = Get.put<ShoppingListService>(ShoppingListService());
    Get.put(AddShoppingListController(service));
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    final shoppingListService = Get.put(ShoppingListService());
    Get.lazyPut(() => ShoppingListController(shoppingListService));
    Get.put(HomeController(), permanent: true);
  }
}
