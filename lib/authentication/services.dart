import 'dart:async';

import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/exceptions.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/repositories.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferenceService extends GetxService {
  Future<bool> saveUser(User user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt('id', user.id);
    preferences.setString('email', user.email);
    preferences.setString('firstName', user.firstName);
    preferences.setString('lastName', user.lastName);

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return User(
        id: preferences.getInt('id'),
        email: preferences.getString('email'),
        firstName: preferences.getString('firstName'),
        lastName: preferences.getString('lastName'));
  }

  void removeUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove('id');
    preferences.remove('email');
    preferences.remove('firstName');
    preferences.remove('lastName');
  }

  saveToken(Token token) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('token', token.token);
    preferences.setString('refreshToken', token.refreshToken);

    return true;
  }

  Future<String> getAccessToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  Future<Token> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return Token(
        token: preferences.getString('token'),
        refreshToken: preferences.getString('refreshToken'));
  }

  removeToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('refreshToken');
  }

  Future<void> clear() async {
    removeUser();
    removeToken();
  }
}

class AuthService {
  final authRepository = apiClient.getService<AuthRepository>();

  Future<Token> authenticate(Login login) async {
    final response = await authRepository.authenticate(login);

    if (response.body is Token) {
      return response.body;
    }

    throw AuthenticationFailedException();
  }

  Future<bool> resetPassword(Email email) async {
    final response = await authRepository.resetPassword(email);
    return response.statusCode == 204;
  }

  Future<Token> refreshToken(RefreshToken token) async {
    final response = await authRepository.refreshToken(token);
    return response.body;
  }

  Future<User> register(RegistrationModel registrationModel) async {
    final response = await authRepository.register(registrationModel);
    return response.body;
  }
}
