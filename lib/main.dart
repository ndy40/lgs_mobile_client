import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/bloc/authentication.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/repositories.dart';
import 'package:lgs_mobile_client/authentication/screens/screens.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/controller.dart';
import 'package:lgs_mobile_client/home.dart';
import 'package:lgs_mobile_client/routes.dart';
import 'package:lgs_mobile_client/shopping/bloc/shopping_lists_bloc.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/services.dart';
import 'package:lgs_mobile_client/themes.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServices();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  runApp(MyApp(apiClient.getService<AuthRepository>()));
}

class MyApp extends StatelessWidget {
  final AuthRepository repo;
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get navigatorKey => _navigatorKey.currentState;

  MyApp(this.repo);

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: repo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(AuthService())
          ),
          BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) => AuthenticationBloc(repo)..add(AuthenticationStateChanged(status: AuthenticationUnknownState()))),
          BlocProvider<ShoppingListsBloc>(
          create: (context) => ShoppingListsBloc(service: ShoppingListService()),),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Flutter Demo',
          theme: appTheme,
          routes: routes,
          builder: (context, child) => BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is UnAuthenticatedState) {
                  Get.toNamed(LoginScreen.routeName);
                }
              },
              child: child,
            )
        )
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

void initServices() {
  final service = Get.put(ShoppingListService());
  Get.lazyPut<UserPreferenceService>(() => UserPreferenceService());
  Get.lazyPut<UserController>(() => UserController(), fenix: true);
  Get.lazyPut<ShoppingListController>(() => ShoppingListController(service),
      fenix: true);
  Get.lazyPut<HomeController>(() => HomeController());
  final authService = Get.put(AuthService());
  final userPref = Get.put(UserPreferenceService());
  Get.put(AuthController(authService, userPref));
  final shoppingListService = Get.put(ShoppingListService());
  Get.lazyPut(() => ShoppingListController(shoppingListService));
  Get.put(HomeController(), permanent: true);
}
