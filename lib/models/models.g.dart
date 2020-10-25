// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) {
  return ShoppingItem()
    ..resource = json['@id'] as String
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..status = json['status'] as String
    ..quantity = json['quantity'] as int
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String);
}

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) {
  return ShoppingList(
    id: json['id'] as int,
    title: json['title'] as String,
    status: json['status'] as String,
    channelId: json['channelId'] as String,
    shoppingItems:
        const _ShoppingItemConverter().fromJson(json['shoppingItems'] as List),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  )..owner = json['owner'] as String;
}

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
  return RefreshToken()..refreshToken = json['refresh_token'] as String;
}

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };

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

HydraCollection<T> _$HydraCollectionFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return HydraCollection<T>()
    ..context = json['@context'] as String
    ..id = json['@id'] as String
    ..totalItems = json['hydra:totalItems'] as int
    ..members = (json['hydra:member'] as List)?.map(fromJsonT)?.toList()
    ..view = json['hydra:view'] == null
        ? null
        : HydraView.fromJson(json['hydra:view'] as Map<String, dynamic>);
}

HydraView _$HydraViewFromJson(Map<String, dynamic> json) {
  return HydraView()
    ..first = json['hydra:first'] as String
    ..last = json['hydra:last'] as String
    ..next = json['hydra:next'] as String;
}
