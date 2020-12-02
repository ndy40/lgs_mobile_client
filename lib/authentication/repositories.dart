import 'package:chopper/chopper.dart';
import 'package:lgs_mobile_client/authentication/models.dart';

part 'repositories.chopper.dart';

@ChopperApi()
abstract class AuthRepository extends ChopperService {
  static AuthRepository create([ChopperClient $client]) =>
      _$AuthRepository($client);

  @Post(path: '/authentication_token')
  Future<Response<Token>> authenticate(@Body() Login login);

  @Post(path: '/api/users/reset_password')
  Future<Response> resetPassword(@Body() Email email);

  @Post(path: '/refresh_token')
  Future<Response<Token>> refreshToken(@Body() RefreshToken token);

  @Post(path: '/api/users/register')
  Future<Response<User>> register(@Body() RegistrationModel body);
}
