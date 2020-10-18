import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/shareable.dart';

class ErrorController extends GetxController {
  Rx<ErrorMessage> _error = ErrorMessage(null).obs;

  ErrorMessage get error => _error.value;

  clear() => _error.value = ErrorMessage(null);
}
