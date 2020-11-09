import 'package:json_annotation/json_annotation.dart' as js;
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

part 'models.g.dart';

@js.JsonSerializable(createToJson: false)
class ShoppingItem implements ConvertToJsonInterface {
  static const pickedStatus = 'PICKED';
  static const notPickedStatus = 'NOT_PICKED';
  static const statuses = [pickedStatus, notPickedStatus];

  @js.JsonKey(name: '@id')
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

@js.JsonSerializable(createToJson: false)
class ShoppingList implements ConvertToJsonInterface {
  static const draftStatus = 'DRAFT';
  static const templateStatus = 'TEMPLATE';
  static const publishedStatus = 'PUBLISHED';
  static const closedStatus = 'CLOSED';

  static const statuses = [
    draftStatus,
    templateStatus,
    publishedStatus,
    closedStatus
  ];

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

class _ShoppingItemConverter
    implements js.JsonConverter<List<ShoppingItem>, List<dynamic>> {
  const _ShoppingItemConverter();

  @override
  List<ShoppingItem> fromJson(List<dynamic> json) {
    final items = List<ShoppingItem>();

    json.forEach((element) => getItemByIri(element).then((value) {
          print(value.body.id);
          items.add(value.body);
        }));

    return items;
  }

  @override
  List<dynamic> toJson(List<ShoppingItem> object) {
    return [
      for (var item in object) '/api/shopping_items/' + item.id.toString()
    ];
  }
}
