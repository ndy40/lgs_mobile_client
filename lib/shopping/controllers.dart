import 'package:get/get.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

class ShoppingListController extends GetxController {
  RxList<ShoppingList> _shoppingLists = <ShoppingList>[].obs;

  List<ShoppingList> get shoppingLists => _shoppingLists.value;

  ShoppingListService _service;

  ShoppingListController(this._service);

  @override
  void onInit() async {
    final response = await _service.getAll();
    _shoppingLists.value = response.isEmpty ? [] : response;
  }

  refresh() async {
    final response = await _service.getAll();
    _shoppingLists.value = response;
  }

  deleteShoppingList(int id) async {
    return await _service.delete(id);
  }
}

class AddShoppingListController extends GetxController {
  Rx<ShoppingList> _shoppingList =
      ShoppingList(status: ShoppingList.draftStatus, shoppingItems: []).obs;

  ShoppingList get shoppingList => _shoppingList.value;

  ShoppingListService _service;

  AddShoppingListController(this._service);

  set shoppingList(ShoppingList shoppingList) =>
      _shoppingList.value = shoppingList;

  RxList<String> _shoppingListStatuses = ShoppingList.statuses.obs;

  List<String> get shoppingListStatuses => _shoppingListStatuses.value;

  void setStatus(String status) {
    _shoppingList.value.status = status;
  }

  void setTitle(String title) {
    _shoppingList.value.title = title;
  }

  Future<ShoppingList> save(ShoppingList shoppingList) async {
    final response = await _service.create(shoppingList);
    return response;
  }

  void addItem(ShoppingItem shoppingItem) async {}
}
