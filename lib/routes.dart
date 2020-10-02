import 'package:lgs_mobile_client/screens/login_screen.dart';
import 'package:lgs_mobile_client/screens/register_screen.dart';
import 'package:lgs_mobile_client/screens/shopping_list_screen.dart';

final routes = {
  RegistrationScreen.routeName: (context) => RegistrationScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ShoppingListScreen.routeName: (context) => ShoppingListScreen()
};
