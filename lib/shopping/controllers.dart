import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

class ShoppingListController extends GetxController {
  RxList<ShoppingList> _shoppingLists = <ShoppingList>[].obs;

  List<ShoppingList> get shoppingLists => _shoppingLists.value;

  ShoppingListService _service;

  ShoppingListController() {
    _service = apiClient.getService<ShoppingListService>();
  }

  @override
  void onInit() {
    _service.getAllResources().then((value) {
      print(value);
      _shoppingLists.value = value.body.members;
    });
  }
}
