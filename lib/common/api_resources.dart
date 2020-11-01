import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

class HydraConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  HydraConverter(this.typeToJsonFactoryMap);

  @override
  Request convertRequest(Request request) {
    return request.copyWith(body: _convertToJson(request.body));
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
        base: response.base,
        body: _convertToBodyType<BodyType, InnerType>(
            super.convertResponse(response).body,
            typeToJsonFactoryMap[InnerType]));
  }

  T _convertToBodyType<T, InnerType>(dynamic json, Function jsonParser) {
    if (json is Map) {
      if (json.containsKey('@type') && json['@type'] == 'hydra:Collection') {
        return HydraCollection<InnerType>.fromJson(json) as T;
      }

      return jsonParser(json) as T;
    }

    return json;
  }

  String _convertToJson(dynamic json) {
    if (json is ConvertToJsonInterface) {
      return jsonEncode(json.toJson());
    }

    return json;
  }
}

class AuthInterceptor extends RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    final params = {
      'content-type': 'application/ld+json',
    };

    final token = await getx.Get.find<UserPreference>().getAccessToken();

    if (null != token) {
      params['Authorization'] = 'Bearer $token';
    }

    return applyHeaders(request, params);
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
