import 'package:json_annotation/json_annotation.dart';
import 'package:lgs_mobile_client/shopping/models.dart';

part 'utils.g.dart';

abstract class ConvertToJsonInterface {
  Map<String, dynamic> toJson();
}

T convertFromJson<T>(Object json) {
  Object data;

  Map<String, dynamic> input = json as Map<String, dynamic>;

  switch (input['@type']) {
    case 'ShoppingList':
      data = ShoppingList.fromJson(input);
      break;
    case 'ShoppingItem':
      data = ShoppingItem.fromJson(input);
      break;
  }

  return data;
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
