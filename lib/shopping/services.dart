import 'package:chopper/chopper.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';

part 'services.chopper.dart';

@ChopperApi(baseUrl: '/api/shopping_lists')
abstract class ShoppingListService extends ChopperService {
  static ShoppingListService create([ChopperClient client]) =>
      _$ShoppingListService(client);

  @Get()
  Future<Response<HydraCollection<ShoppingList>>> getAllResources(
      {@QueryMap() Map<String, dynamic> query});

  @Get(path: '/{id}')
  Future<Response<ShoppingList>> getResource(@Path() int id,
      [@QueryMap() Map<String, dynamic> query]);

  // Future<T> getResourceByIri(String url) => client.get(url);

  @Post()
  Future<Response<ShoppingList>> createResource(@Body() String data);

  @Delete(path: '/{id}')
  Future<Response> deleteResource(@Path() int id);

  @Patch(path: '/{id}')
  Future<Response<ShoppingList>> patchResource(
      @Path() int id, @Body() Map<String, dynamic> body);

  @Post(path: '/{id}')
  Future<Response<ShoppingList>> putResource(
      @Path() int id, @Body() Map<String, dynamic> body);
}

@ChopperApi(baseUrl: '/api/shopping_items')
abstract class ShoppingItemService extends ChopperService {
  static ShoppingItemService create([ChopperClient client]) =>
      _$ShoppingItemService(client);
  @Get()
  Future<Response<HydraCollection<ShoppingItem>>> getAllResources(
      {@QueryMap() Map<String, dynamic> $query, @Header() header});

  @Get(path: '/{id}')
  Future<Response<ShoppingItem>> getResource(@Path() int id);

  @Post()
  Future<Response<ShoppingItem>> createResource(@Body() ShoppingItem data);

  @Delete(path: '/{id}')
  Future<Response> deleteResource(@Path() int id);

  @Patch(path: '/{id}')
  Future<Response<ShoppingItem>> patchResource(
      @Path() int id, @Body() Map<String, dynamic> body);

  @Post(path: '/{id}')
  Future<Response<ShoppingItem>> putResource(
      @Path() int id, @Body() Map<String, dynamic> body);
}

/// Utility method for fetching ShoppingItem resource using IRI
Future<Response<ShoppingItem>> getItemByIri(String url) async {
  final matched = RegExp(r'(\d+)$').stringMatch(url);
  return await apiClient
      .getService<ShoppingItemService>()
      .getResource(int.parse(matched));
}
