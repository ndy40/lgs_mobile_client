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
      _shoppingLists.value = value.body.members;
    }).catchError((onError) => _shoppingLists.value = <ShoppingList>[]);
  }

  refresh() async {
    final response = await _service.getAllResources();
    _shoppingLists.value = response.body.members;
  }

  deleteShoppingList(int id) async {
    return await _service.deleteResource(id);
  }
}

class AddShoppingListController extends GetxController {
  Rx<ShoppingList> _shoppingList = ShoppingList().obs;

  ShoppingList get shoppingList => _shoppingList.value;

  set shoppingList(ShoppingList shoppingList) =>
      _shoppingList.value = shoppingList;

  RxList<String> _shoppingListStatuses = ShoppingList.statuses.obs;

  List<String> get shoppingListStatuses => _shoppingListStatuses.value;

  final ShoppingListService service =
      apiClient.getService<ShoppingListService>();

  void save(ShoppingList shoppingList) async {}

  void addItem(ShoppingItem shoppingItem) async {}
}
