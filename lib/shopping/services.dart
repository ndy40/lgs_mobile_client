import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/repositories.dart';

class ShoppingListService extends GetxService {
  final _repository = apiClient.getService<ShoppingListRepository>();

  Future<HydraCollection<ShoppingList>> getCollection({Map<String, dynamic> filter}) async {
    final shoppingLists = await _repository.getAllResources(query: filter);

    return shoppingLists.body;
  }

  Future<ShoppingList> create(ShoppingList shoppingList) async {
    final response = await _repository.createResource(shoppingList);
    return response.body;
  }

  Future<bool> delete(int id) async {
    final response = await _repository.deleteResource(id);

    return response.statusCode == 204;
  }
}
