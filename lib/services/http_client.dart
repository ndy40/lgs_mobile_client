import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/services/auth_services.dart';

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
    final token = Get.find<UserPreference>().getAccessToken();
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

class ApiClient {
  static Dio _dio;

  factory ApiClient() {
    if (_dio == null) {
      _dio = Dio(_defaultOption);
      _dio.interceptors.addAll([_AuthTokenInterceptor()]);
    }

    return ApiClient._internal();
  }

  ApiClient._internal();

  get(String url, {Map<String, dynamic> query, Map<String, dynamic> header}) {
    return _dio.get(
      url,
      queryParameters: query ?? Map(),
    );
  }

  post(String url, {Map<String, dynamic> data, Map<String, dynamic> header}) {
    return _dio.post(
      url,
      data: data ?? Map<String, dynamic>(),
      options: Options(
        headers: header ?? Map(),
      ),
    );
  }

  patch(String url, {Map<String, dynamic> data, Map<String, dynamic> header}) {
    final headerParam = header ?? Map<String, dynamic>();
    headerParam['content-type'] = 'application/merge-patch+json';

    return _dio.patch(url, data: data, options: Options(headers: headerParam));
  }

  delete(String url) {
    return _dio.delete(url);
  }
}
