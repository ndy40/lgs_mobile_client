import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';

part 'models.g.dart';

abstract class ConvertToJsonInterface {
  Map<String, dynamic> toJson();
}

@JsonSerializable(createToJson: false)
class ShoppingItem implements ConvertToJsonInterface {
  static const pickedStatus = 'PICKED';
  static const notPickedStatus = 'NOT_PICKED';
  static const statuses = [pickedStatus, notPickedStatus];

  @JsonKey(name: '@id')
  String resource;
  int id;
  String name;
  String status;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  ShoppingItem();

  factory ShoppingItem.fromJson(Map data) => _$ShoppingItemFromJson(data);

  Map<String, dynamic> toJson() {
    return {
      'name': id,
      'status': name,
      'quantity': quantity,
    };
  }
}

@JsonSerializable(createToJson: false)
class ShoppingList implements ConvertToJsonInterface {
  static const draftStatus = 'DRAFT';
  static const templateStatus = 'TEMPLATE';
  static const publishedStatus = 'PUBLISHED';
  static const closedStatus = 'CLOSED';

  int id;
  String status;
  String channelId;
  String title;
  String owner;
  DateTime createdAt;
  DateTime updatedAt;

  @_ShoppingItemConverter()
  List<ShoppingItem> shoppingItems;

  ShoppingList(
      {this.id,
      this.title,
      this.status,
      this.channelId,
      this.shoppingItems,
      this.createdAt,
      this.updatedAt});

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'channelId': channelId,
      'shoppingItems': [for (var item in shoppingItems) item.resource]
    };
  }
}

@JsonSerializable()
class Token implements ConvertToJsonInterface {
  String token;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  Token({@required this.token, @required this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class RefreshToken implements ConvertToJsonInterface {
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  RefreshToken();

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
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
  String email;
  String password;

  Login({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

T convertFromJson<T>(Object json) {
  Object data;
  switch (T) {
    case ShoppingList:
      data = ShoppingList.fromJson(json);
      break;
    case ShoppingItem:
      data = ShoppingList.fromJson(json);
      break;
  }

  return data;
}

class _ShoppingItemConverter
    implements JsonConverter<List<ShoppingItem>, List<dynamic>> {
  const _ShoppingItemConverter();

  @override
  List<ShoppingItem> fromJson(List<dynamic> json) {
    //todo: check to make sure we get a Map<String, String> and we perform a get for it instead.
    final items = <ShoppingItem>[];
    for (var item in json) {
      getItem(item as String).then((value) => items.add(value.body));
    }

    return items;
  }

  @override
  List<dynamic> toJson(List<ShoppingItem> object) {
    return [
      for (var item in object) '/api/shopping_items/' + item.id.toString()
    ];
  }
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class HydraCollection<T> {
  @JsonKey(name: '@context')
  String context;

  @JsonKey(name: '@id')
  String id;

  @JsonKey(name: 'hydra:totalItems')
  int totalItems;

  @JsonKey(name: 'hydra:member')
  @_HydraMemberConverter()
  List<T> members;

  @JsonKey(name: 'hydra:view')
  HydraView view;

  HydraCollection();

  factory HydraCollection.fromJson(Map<String, dynamic> json) =>
      _$HydraCollectionFromJson(json, convertFromJson);
}

@JsonSerializable(createToJson: false)
class HydraView {
  @JsonKey(name: 'hydra:first')
  String first;

  @JsonKey(name: 'hydra:last')
  String last;

  @JsonKey(name: 'hydra:next')
  String next;

  HydraView();

  factory HydraView.fromJson(Map<String, dynamic> json) =>
      _$HydraViewFromJson(json);
}

class _HydraMemberConverter<T>
    implements JsonConverter<List<T>, List<Map<String, dynamic>>> {
  const _HydraMemberConverter();

  @override
  List<T> fromJson(List<Map<String, dynamic>> members) {
    final data = [];
    for (var json in members) {
      if (T is ShoppingList) {
        data.add(ShoppingList.fromJson(json));
      }
    }

    return data;
  }

  @override
  List<Map<String, dynamic>> toJson(List<T> objList) {
    final data = [];

    for (var item in objList) {
      if (item is ShoppingList) {
        data.add(item.toJson());
      }
    }
    return data;
  }
}
