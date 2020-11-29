import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lgs_mobile_client/common/utils.dart';

part 'models.g.dart';

enum Status {
  Registered,
  NotRegistered,
  LoggedIn,
  NotLoggedIn,
  ErrorLoggedIn,
  ErrorRegister
}

@JsonSerializable()
class Email implements ConvertToJsonInterface {
  String email;

  Email();

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmailToJson(this);
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

@JsonSerializable()
class Login implements ConvertToJsonInterface {
  @JsonKey(name: 'username')
  final String email;
  final String password;

  const Login({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  Login copyWith({String email, String password}) {
    return Login(email: email ?? this.email, password: password ?? this.password);
  }
}

@JsonSerializable()
class Token implements ConvertToJsonInterface {
  String token;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  Token({this.token, this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  bool isEmpty() {
    return token == null || token.isEmpty;
  }
}

@JsonSerializable()
class RefreshToken implements ConvertToJsonInterface {
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  RefreshToken({this.refreshToken});

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

enum RegistrationStatus { initial, successful, error }
