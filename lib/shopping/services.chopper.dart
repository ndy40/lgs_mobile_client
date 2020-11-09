// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ShoppingListService extends ShoppingListService {
  _$ShoppingListService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ShoppingListService;

  @override
  Future<Response<HydraCollection<ShoppingList>>> getAllResources(
      {Map<String, dynamic> query}) {
    final $url = '/api/shopping_lists';
    final $params = query;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<HydraCollection<ShoppingList>, ShoppingList>($request);
  }

  @override
  Future<Response<ShoppingList>> getResource(int id,
      [Map<String, dynamic> query]) {
    final $url = '/api/shopping_lists/$id';
    final $params = query;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ShoppingList, ShoppingList>($request);
  }

  @override
  Future<Response<ShoppingList>> createResource(ShoppingList data) {
    final $url = '/api/shopping_lists';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ShoppingList, ShoppingList>($request);
  }

  @override
  Future<Response<dynamic>> deleteResource(int id) {
    final $url = '/api/shopping_lists/$id';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ShoppingList>> patchResource(
      int id, Map<String, dynamic> body) {
    final $url = '/api/shopping_lists/$id';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<ShoppingList, ShoppingList>($request);
  }

  @override
  Future<Response<ShoppingList>> putResource(
      int id, Map<String, dynamic> body) {
    final $url = '/api/shopping_lists/$id';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ShoppingList, ShoppingList>($request);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ShoppingItemService extends ShoppingItemService {
  _$ShoppingItemService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ShoppingItemService;

  @override
  Future<Response<HydraCollection<ShoppingItem>>> getAllResources(
      {Map<String, dynamic> $query, dynamic header}) {
    final $url = '/api/shopping_items';
    final $params = $query;
    final $headers = {'header': header};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<HydraCollection<ShoppingItem>, ShoppingItem>($request);
  }

  @override
  Future<Response<ShoppingItem>> getResource(int id) {
    final $url = '/api/shopping_items/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ShoppingItem, ShoppingItem>($request);
  }

  @override
  Future<Response<ShoppingItem>> createResource(ShoppingItem data) {
    final $url = '/api/shopping_items';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ShoppingItem, ShoppingItem>($request);
  }

  @override
  Future<Response<dynamic>> deleteResource(int id) {
    final $url = '/api/shopping_items/$id';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ShoppingItem>> patchResource(
      int id, Map<String, dynamic> body) {
    final $url = '/api/shopping_items/$id';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<ShoppingItem, ShoppingItem>($request);
  }

  @override
  Future<Response<ShoppingItem>> putResource(
      int id, Map<String, dynamic> body) {
    final $url = '/api/shopping_items/$id';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ShoppingItem, ShoppingItem>($request);
  }
}
