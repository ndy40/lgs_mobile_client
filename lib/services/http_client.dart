import 'package:dio/dio.dart';
import 'package:lgs_mobile_client/services/local_storage.dart';

const String userRegistration = '/api/users/register';
const String userChangePassword = '/api/users/change_password';
const String userResetPassword = '/api/users/reset_password';
const String userProfile = '/api/users/{id}';

final BaseOptions _defaultOption = BaseOptions(
    baseUrl: "https://lsg.ndifreke-ekott.com/",
    headers: {"content-type": "application/ld+json"});

class _AuthTokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    final token = UserPreference().getToken();
    const pathPattern = r"docs|authentication_token|register|refresh_token";

    token.whenComplete(() {
      if (token != null && options.path.contains(RegExp(pathPattern))) {
        options.headers['authorization'] = 'Bearer $token';
      }
    });
    print(options.headers);
    return super.onRequest(options);
  }
}

class _ContentTypeInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    if (options?.method == 'patch') {
      options.headers['content-type'] = "application/merge-patch+json";
    }

    return super.onRequest(options);
  }
}

class ApiClient {
  static Dio _dio;

  static Dio instance() {
    if (ApiClient._dio == null) {
      ApiClient._dio = Dio(_defaultOption);
      ApiClient._dio.interceptors
          .addAll([_ContentTypeInterceptor(), _AuthTokenInterceptor()]);
    }
    return ApiClient._dio;
  }
}
