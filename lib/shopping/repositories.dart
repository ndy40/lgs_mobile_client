import 'package:chopper/chopper.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';

part 'repositories.chopper.dart';

@ChopperApi(baseUrl: '/api/shopping_lists')
abstract class ShoppingListRepository extends ChopperService {
  static ShoppingListRepository create([ChopperClient client]) =>
      _$ShoppingListRepository(client);

  @Get()
  Future<Response<HydraCollection<ShoppingList>>> getAllResources(
      {@QueryMap() Map<String, dynamic> query});

  @Get(path: '/{id}')
  Future<Response<ShoppingList>> getResource(@Path() int id,
      [@QueryMap() Map<String, dynamic> query]);

  Future<Response<ShoppingList>> getResourceByIri(String url) =>
      client.get(url);

  @Post()
  Future<Response<ShoppingList>> createResource(@Body() ShoppingList data);

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
abstract class ShoppingItemRepository extends ChopperService {
  static ShoppingItemRepository create([ChopperClient client]) =>
      _$ShoppingItemRepository(client);

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
      .getService<ShoppingItemRepository>()
      .getResource(int.parse(matched));
}
