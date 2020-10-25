import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/models/models.dart';
import 'package:lgs_mobile_client/services/auth_services.dart';
import 'package:lgs_mobile_client/services/http_client.dart';

const _loginPath = '/authentication_token';
const _registrationPath = '/api/users/register';
const _refreshToken = '/refresh_token';

enum Status {
  Registered,
  NotRegistered,
  LoggedIn,
  NotLoggedIn,
  ErrorLoggedIn,
  ErrorRegister
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registerStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registerStatus => _registerStatus;

  User _user;
  User get user => _user;

  ErrorMessage _errors;
  ErrorMessage get errors => _errors;

  Token _token;

  Token get token => _token;

  signIn(Login Login) async {
    try {
      final response = await ApiClient().post(_loginPath,
          data: {"username": Login.email, "password": Login.password});

      _token = Token.fromJson(response.data);

      _loggedInStatus = Status.LoggedIn;

      Get.find<UserPreference>().saveToken(token);
    } on DioError catch (e) {
      _loggedInStatus = Status.NotLoggedIn;
      setError(e);
    }

    notifyListeners();
    return _loggedInStatus;
  }

  signUp(RegistrationModel model) async {
    try {
      final response =
          await ApiClient().post(_registrationPath, data: model.toJson());
      final data = response.data;
      _user = User(
          id: data['id'],
          email: data['email'],
          firstName: data['firstName'],
          lastName: data['lastName']);
      _registerStatus = Status.Registered;
    } on DioError catch (e) {
      _registerStatus = Status.NotRegistered;
      setError(e);
    }
    notifyListeners();
    return _registerStatus;
  }

  refreshToken(String refreshToken) async {
    try {
      final response = await ApiClient()
          .post(_refreshToken, data: {"refresh_token": refreshToken});
      final data = response.data;
      _token = Token.fromJson(data);
      _loggedInStatus = Status.LoggedIn;
      Get.find<UserPreference>().saveToken(_token);
    } on DioError catch (e) {
      _loggedInStatus = Status.NotLoggedIn;
      setError(e);
    }

    notifyListeners();
  }

  setError(DioError e) {
    _errors = ErrorMessage(e.response.data);
  }
}

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get user => _user;

  Token _token;

  Token get token => _token;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setToken(Token token) {
    _token = token;
    notifyListeners();
  }
}
