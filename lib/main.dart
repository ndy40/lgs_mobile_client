import 'package:flutter/material.dart';
import 'package:lgs_mobile_client/models/auth.dart';
import 'package:lgs_mobile_client/providers/auth.dart';
import 'package:lgs_mobile_client/routes.dart';
import 'package:lgs_mobile_client/screens/login_screen.dart';
import 'package:lgs_mobile_client/screens/shopping_list_screen.dart';
import 'package:lgs_mobile_client/services/client_service.dart';
import 'package:lgs_mobile_client/services/local_storage.dart';
import 'package:lgs_mobile_client/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<Token> getToken() async => UserPreference().getToken();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      routes: routes,
      home: FutureBuilder(
        future: getToken(),
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
