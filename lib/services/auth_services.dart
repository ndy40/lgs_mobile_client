import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/models/auth.dart';
import 'package:lgs_mobile_client/services/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final _loginPath = '/authentication_token';

  final _refreshToken = '/refresh_token';

  final _registrationPath = '/api/users/register';

  final _resetPassword = '/api/users/reset_password';

  final ApiClient apiClient;

  AuthService({this.apiClient});

  static AuthService init() {
    return AuthService(apiClient: ApiClient());
  }

  Future<Token> signIn(LoginModel login) async {
    final payload = {'username': login.email, 'password': login.password};
    final response = await apiClient.post(_loginPath, data: payload);

    return Token.fromJson(response.data);
  }

  Future<User> register(RegistrationModel model) async {
    final response =
        await apiClient.post(_registrationPath, data: model.getJson());
    return User.fromJson(response.data);
  }

  Future<Token> refreshToken(String refreshToken) async {
    final response = await apiClient
        .post(_refreshToken, data: {'refreshToken': refreshToken});
    return Token.fromJson(response.data);
  }

  resetPassword(String email) async {
    Response response =
        await apiClient.post(_resetPassword, data: {'email': email});
    return response.statusCode == 204;
  }
}

class UserPreference extends GetxService {
  Future<UserPreference> init() async {
    return this;
  }

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
