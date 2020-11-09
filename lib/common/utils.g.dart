// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
