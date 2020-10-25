import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:lgs_mobile_client/models/models.dart';

part 'api_resources.chopper.dart';

class HydraConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  HydraConverter(this.typeToJsonFactoryMap);

  @override
  Request convertRequest(Request request) {
    Request newRequest = request.copyWith(body: _convertToJson(request.body));

    return newRequest;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
        base: response.base,
        body: _convertToBodyType(super.convertResponse(response).body,
            typeToJsonFactoryMap[InnerType]));
  }

  T _convertToBodyType<T, InnerType>(
      Map<String, dynamic> json, Function jsonParser) {
    if (T.runtimeType is HydraCollection<InnerType>) {
      return HydraCollection<InnerType>.fromJson(json) as T;
    }

    return jsonParser(json) as T;
  }

  String _convertToJson(dynamic json) {
    if (json is ConvertToJsonInterface) {
      return jsonEncode(json.toJson());
    }

    return json;
  }
}

@ChopperApi(baseUrl: '/api/shopping_lists')
abstract class ShoppingListService extends ChopperService {
  static ShoppingListService create([ChopperClient client]) =>
      _$ShoppingListService(client);

  @Get()
  Future<Response<HydraCollection<ShoppingList>>> getAllResources(
      {@QueryMap() Map<String, dynamic> $query, @Header() header});

  @Get(path: '/{id}')
  Future<Response<ShoppingList>> getResource(@Path() int id,
      [@Header() header]);

  // Future<T> getResourceByIri(String url) => client.get(url);

  @Post()
  Future<Response<ShoppingList>> createResource(@Body() String data,
      [@Header() header]);

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
  Future<Response<ShoppingItem>> getResource(@Path() int id,
      [@Header() header]);

  @Post()
  Future<Response<ShoppingItem>> createResource(@Body() String data,
      [@Header() header]);

  @Delete(path: '/{id}')
  Future<Response> deleteResource(@Path() int id);

  @Patch(path: '/{id}')
  Future<Response<ShoppingItem>> patchResource(
      @Path() int id, @Body() Map<String, dynamic> body);

  @Post(path: '/{id}')
  Future<Response<ShoppingItem>> putResource(
      @Path() int id, @Body() Map<String, dynamic> body);
}

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient $client]) => _$AuthService($client);

  @Post(path: '/authentication_token')
  Future<Response<Token>> authenticate(@Body() Login login);

  @Post(path: '/api/users/reset_password')
  Future<Response> resetPassword(@Body() Email email);

  @Post(path: '/refresh_token')
  Future<Response<Token>> refreshToken(@Body() RefreshToken token);

  @Post(path: '/api/users/register')
  Future<Response<User>> register(@Body() RegistrationModel body);
}

class AuthInterceptor extends RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    return applyHeaders(request, {
      'content-type': 'application/ld+json',
    });
  }
}

final apiClient = ChopperClient(
    baseUrl: 'https://lsg.ndifreke-ekott.com',
    services: [
      ShoppingListService.create(),
      ShoppingItemService.create(),
      AuthService.create()
    ],
    interceptors: [HttpLoggingInterceptor(), AuthInterceptor()],
    converter: HydraConverter({
      ShoppingList: (json) => ShoppingList.fromJson(json),
      ShoppingItem: (json) => ShoppingItem.fromJson(json),
      Token: (json) => Token.fromJson(json),
      User: (json) => User.fromJson(json)
    }));

/// Utility method for fetching ShoppingItem resource using IRI
Future<Response<ShoppingItem>> getItem(String url) async {
  return await apiClient.getService<ShoppingItemService>().getResource(1);
}
