import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lgs_mobile_client/controllers/auth_controller.dart';
import 'package:lgs_mobile_client/screens/login_screen.dart';
import 'package:lgs_mobile_client/screens/register_screen.dart';
import 'package:lgs_mobile_client/screens/reset_password_screen.dart';
import 'package:lgs_mobile_client/screens/shopping_list_screen.dart';
import 'package:lgs_mobile_client/services/auth_services.dart';

final routes = [
  GetPage(name: RegistrationScreen.routeName, page: () => RegistrationScreen()),
  GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
      binding: AuthBindings()),
  GetPage(
      name: ResetPasswordScreen.routeName,
      page: () => ResetPasswordScreen(),
      bindings: [AuthBindings(), ResetPasswordBindings()]),
  GetPage(
    name: ShoppingListScreen.routeName,
    page: () => ShoppingListScreen(),
  ),
];

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService.init());
  }
}

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController(AuthService.init()));
  }
}
