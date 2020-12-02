// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_$_Email _$_$_EmailFromJson(Map<String, dynamic> json) {
  return _$_Email(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$_$_EmailToJson(_$_Email instance) => <String, dynamic>{
      'email': instance.email,
    };

_$_Login _$_$_LoginFromJson(Map<String, dynamic> json) {
  return _$_Login(
    email: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_LoginToJson(_$_Login instance) => <String, dynamic>{
      'username': instance.email,
      'password': instance.password,
    };

_$_Token _$_$_TokenFromJson(Map<String, dynamic> json) {
  return _$_Token(
    token: json['token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$_$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };

_$_RefreshToken _$_$_RefreshTokenFromJson(Map<String, dynamic> json) {
  return _$_RefreshToken(
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$_$_RefreshTokenToJson(_$_RefreshToken instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };
