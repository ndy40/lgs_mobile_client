import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/repositories.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/repositories.dart';

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
    String result = '';

    if (json is ConvertToJsonInterface) {
      print(json.toJson());
      result = JsonEncoder().convert(json.toJson());
    } else {
      result = json as String;
    }
    return result;
  }
}

class AuthInterceptor extends RequestInterceptor {
  @override
  Future<Request> onRequest(Request request) async {
    final params = {
      'content-type': 'application/ld+json',
    };

    final token = await getx.Get.find<UserPreferenceService>().getAccessToken();

    if (null != token) {
      params['Authorization'] = 'Bearer $token';
    }

    return applyHeaders(request, params);
  }
}

final apiClient = ChopperClient(
    baseUrl: 'https://lsg.ndifreke-ekott.com',
    services: [
      ShoppingListRepository.create(),
      ShoppingItemRepository.create(),
      AuthRepository.create()
    ],
    interceptors: [HttpLoggingInterceptor(), AuthInterceptor()],
    converter: HydraConverter({
      ShoppingList: (json) => ShoppingList.fromJson(json),
      ShoppingItem: (json) => ShoppingItem.fromJson(json),
      Token: (json) => Token.fromJson(json),
      User: (json) => User.fromJson(json)
    }));
