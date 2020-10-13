import 'package:lgs_mobile_client/models/auth.dart';

class ShoppingItem {
  static const pickedStatus = 'PICKED';
  static const notPickedStatus = 'NOT_PICKED';
  static const statuses = [pickedStatus, notPickedStatus];

  int id;
  String name;
  String status;
  int quantity;
  User owner;
  DateTime createdAt;
  DateTime updatedAt;

  ShoppingItem.fromJson(Map data) {
    this.id = data['id'];
    this.name = data['name'];
    this.status = data['status'];
    this.quantity = data['quantity'];
    this.owner = data['owner'];
    this.createdAt = data['createdAt'];
    this.updatedAt = data['updatedAt'];
  }
}

class ShoppingList {
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

  List<ShoppingItem> shoppingItems;

  ShoppingList(
      {this.id,
      this.title,
      this.status,
      this.channelId,
      this.owner,
      this.shoppingItems,
      this.createdAt,
      this.updatedAt});

  factory ShoppingList.fromJson(Map<String, dynamic> data) {
    return ShoppingList(
        id: data['id'],
        title: data['title'],
        channelId: data['channelId'],
        owner: data['owner'],
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        shoppingItems: [
          for (var shoppingItem in data['shoppingItems'])
            ShoppingItem.fromJson(shoppingItem)
        ]);
  }
}
