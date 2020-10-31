import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lgs_mobile_client/authentication/screens.dart';
import 'package:lgs_mobile_client/shopping/screens.dart';

final routes = [
  GetPage(name: RegistrationScreen.routeName, page: () => RegistrationScreen()),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(
      name: ResetPasswordScreen.routeName, page: () => ResetPasswordScreen()),
  GetPage(
    name: ShoppingListScreen.routeName,
    page: () => ShoppingListScreen(),
  ),
];
