import 'package:chopper/chopper.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'services.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient $client]) => _$AuthService($client);

  @Post(path: '/authentication_token')
  Future<Response<Token>> authenticate(@Body() Login login);

  @Post(path: '/api/users/reset_password')
  Future<Response> resetPassword(@Body() Email email);

  @Post(path: '/refresh_token')
  Future<Response<Token>> refreshToken(@Body() RefreshToken token);

  @Post(path: '/api/users/register')
  Future<Response<User>> register(@Body() RegistrationModel body);
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
