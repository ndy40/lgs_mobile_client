import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/Authentication/screens.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/services.dart';
import 'package:lgs_mobile_client/routes.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/screens.dart';
import 'package:lgs_mobile_client/themes.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

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
        future: Get.find<UserPreference>().getToken(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!tokenIsValid(snapshot.data)) {
                UserPreference().clear();
                return LoginScreen();
              }
              return ShoppingListScreen();
          }
        },
      ),
    );
  }
}

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

initServices() async {
  await Get.putAsync(() => Future(() => UserPreference()), permanent: true);
  await Get.putAsync(() => Future(() => UserController()), permanent: true);
  await Get.putAsync(() => Future(() => ShoppingListController()),
      permanent: true);
}
