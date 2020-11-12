import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/screens.dart';
import 'package:lgs_mobile_client/authentication/services.dart';

class AuthController extends GetxController {
  AuthService _authService;
  UserPreferenceService _userPreferenceService;

  UserController userController = Get.find<UserController>();

  AuthController(this._authService, this._userPreferenceService);

  Future<Token> signIn(Login login) async {
    final token = await _authService.authenticate(login);

    if (!token.token.isNull) {
      _userPreferenceService.saveToken(token);
      userController.status = Status.LoggedIn;
    }

    return token;
  }

  signOut() {
    _userPreferenceService.clear();
    userController.clear();
    Get.toNamed(LoginScreen.routeName);
  }
}

class ResetPasswordController extends GetxController {
  AuthService authService = Get.find<AuthService>();

  Future<bool> resetPassword(String email) async {
    return await authService.resetPassword(Email()..email = email);
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
    Get.find<UserPreferenceService>().getUser().then((value) => setUser(value));
  }

  setUser(User user) async {
    if (!await Get.find<UserPreferenceService>().saveUser(user)) {
      throw Exception("Error saving user");
    }

    _user.value = user;
  }

  setToken(Token token) async {
    if (!await Get.find<UserPreferenceService>().saveToken(token)) {
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
