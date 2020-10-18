import 'package:get/get.dart';
import 'package:lgs_mobile_client/models/auth.dart';
import 'package:lgs_mobile_client/providers/auth.dart';
import 'package:lgs_mobile_client/screens/login_screen.dart';
import 'package:lgs_mobile_client/services/auth_services.dart';

class AuthController extends GetxController {
  AuthService authService = AuthService.init();
  UserPreference userPref = Get.find<UserPreference>();
  UserController userController = Get.find<UserController>();

  Future<dynamic> signIn(LoginModel login) async {
    try {
      final token = await authService.signIn(login);
      userPref.saveToken(token);
      userController.setToken(token);
      userController.status = Status.LoggedIn;
    } catch (e) {
      print(e);
    }
  }

  signOut() {
    userPref.clear();
    userController.clear();
    Get.toNamed(LoginScreen.routeName);
  }
}

class ResetPasswordController extends GetxController {
  AuthService service;

  ResetPasswordController(this.service);

  resetPassword(String email) async {
    return await service.resetPassword(email);
  }
}

class UserController extends GetxController {
  Rx<User> _user = User().obs;

  Rx<Status> _status = Status.NotLoggedIn.obs;

  set status(Status status) => _status.value = status;

  Rx<Token> _token = Token().obs;

  User get user => _user.value;

  Status get status => _status.value;

  Token get token => _token.value;

  @override
  void onInit() {
    Get.find<UserPreference>().getUser().then((value) => setUser(value));
  }

  setUser(User user) async {
    if (!await Get.find<UserPreference>().saveUser(user)) {
      throw Exception("Error saving user");
    }

    _user.value = user;
  }

  setToken(Token token) async {
    if (!await Get.find<UserPreference>().saveToken(token)) {
      throw Exception('Error saving token');
    }

    _token.value = token;
  }

  clear() {
    _user.value = User();
    _status.value = Status.NotLoggedIn;
    _token.value = Token();
  }
}
