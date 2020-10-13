import 'package:lgs_mobile_client/models/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
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

  clear() async {
    removeUser();
    removeToken();
  }
}
