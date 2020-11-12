import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/screens.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/common/services.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/routes.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/themes.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServices();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBindings(),
      title: 'Flutter Demo',
      theme: appTheme,
      getPages: routes,
      home: FutureBuilder(
        future: Get.find<UserPreferenceService>().getToken(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!tokenIsValid(snapshot.data)) {
                UserPreferenceService().clear();
                return LoginScreen();
              }
              return Home();
          }
        },
      ),
    );
  }
}

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    final authService = Get.put(AuthService());
    final userPref = Get.put(UserPreferenceService());
    Get.put(AuthController(authService, userPref));
  }
}

initServices() {
  Get.lazyPut<UserPreferenceService>(() => UserPreferenceService());
  Get.lazyPut<UserController>(() => UserController(), fenix: true);
  Get.lazyPut<ShoppingListController>(() => ShoppingListController(),
      fenix: true);
  Get.lazyPut<HomeController>(() => HomeController());
}
