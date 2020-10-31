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
