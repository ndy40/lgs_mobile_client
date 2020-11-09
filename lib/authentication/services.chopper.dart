// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AuthService extends AuthService {
  _$AuthService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthService;

  @override
  Future<Response<Token>> authenticate(Login login) {
    final $url = '/authentication_token';
    final $body = login;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Token, Token>($request);
  }

  @override
  Future<Response<dynamic>> resetPassword(Email email) {
    final $url = '/api/users/reset_password';
    final $body = email;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Token>> refreshToken(RefreshToken token) {
    final $url = '/refresh_token';
    final $body = token;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Token, Token>($request);
  }

  @override
  Future<Response<User>> register(RegistrationModel body) {
    final $url = '/api/users/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<User, User>($request);
  }
}
