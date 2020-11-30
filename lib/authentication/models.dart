import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lgs_mobile_client/common/utils.dart';

part 'models.g.dart';
part 'models.freezed.dart';

enum Status {
  Registered,
  NotRegistered,
  LoggedIn,
  NotLoggedIn,
  ErrorLoggedIn,
  ErrorRegister
}

@freezed
abstract class Email with _$Email implements ConvertToJsonInterface {
  factory Email({@required String email}) = _Email;

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}

@JsonSerializable(createToJson: false)
class User {
  @JsonKey(name: '@id')
  String resource;
  int id;
  String email;
  String firstName;
  String lastName;

  bool get isEmpty => id == null;

  User(
      {int id,
      @required email,
      @required String firstName,
      @required String lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class RegistrationModel implements ConvertToJsonInterface {
  String firstName;
  String lastName;
  String email;
  String password;

  RegistrationModel({this.firstName, this.lastName, this.email, this.password});

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}

@freezed
abstract class Login with _$Login implements ConvertToJsonInterface  {
  const factory Login({@JsonKey(name: 'username') String email, String password}) = _Login;

  factory Login.fromJson(Map<String, dynamic> json ) => _$LoginFromJson(json);
}

@freezed
abstract class Token with _$Token implements ConvertToJsonInterface {
  const factory Token({String token, @JsonKey(name: 'refresh_token') String refreshToken}) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@freezed
abstract class RefreshToken with _$RefreshToken implements ConvertToJsonInterface {
  factory RefreshToken({@JsonKey(name: 'refresh_token') String refreshToken}) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);
}

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

enum RegistrationStatus { initial, successful, error }
