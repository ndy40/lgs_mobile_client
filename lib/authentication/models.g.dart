// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) {
  return Email()..email = json['email'] as String;
}

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'email': instance.email,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    email: json['email'],
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  )..resource = json['@id'] as String;
}

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) {
  return RegistrationModel(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegistrationModelToJson(RegistrationModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    email: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.email,
      'password': instance.password,
    };

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    token: json['token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) {
  return RefreshToken(
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };
