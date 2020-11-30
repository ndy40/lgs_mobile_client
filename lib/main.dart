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
import 'package:lgs_mobile_client/settings/bloc/signout_cubit.dart';
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

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  AuthRepository repo;
  NavigatorState get navigatorKey => _navigatorKey.currentState;
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    repo = apiClient.getService<AuthRepository>();
    authenticationBloc = AuthenticationBloc(repo);
    super.initState();
  }

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
              create: (BuildContext context) => authenticationBloc..add(AuthenticationStateChanged(status: AuthenticationUnknownState()))),
          BlocProvider<ShoppingListsBloc>(
          create: (context) => ShoppingListsBloc(service: ShoppingListService()),),
          BlocProvider<SignoutCubit>(create: (context) => SignoutCubit(authService: AuthService())),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Flutter Demo',
          theme: appTheme,
          routes: routes,
          builder: (context, child) => BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is UnAuthenticatedState) {
                  navigatorKey.pushReplacementNamed(LoginScreen.routeName);
                } else if (state is AuthenticatedState) {
                  navigatorKey.pushReplacementNamed(Home.routeName);
                }
              },
              child: child,
            )
        )
      ),
    );
  }

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
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
