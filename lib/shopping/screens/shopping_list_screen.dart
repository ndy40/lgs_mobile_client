import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/screens/AddShoppingListScreen.dart';

class MyShoppingLists extends StatelessWidget implements HasActionButtons {
  static const routeName = '/shopping_lists';

  static const icon = Icons.list_alt;

  static const title = 'Lists';

  final ShoppingListController controller = getx.Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: getx.Obx(() => RefreshIndicator(
              child: ListView.builder(
                itemCount: controller.shoppingLists.length,
                itemBuilder: (context, position) {
                  return buildShoppingListItemCard(
                      controller.shoppingLists[position], (value) async {
                    final Response response =
                        await controller.deleteShoppingList(value.id);

                    if (response.statusCode == 204) {
                      controller.refresh();
                    }
                  });
                },
              ),
              onRefresh: () async {
                await controller.refresh();
              },
            )));
  }

  @override
  List<Widget> getActionButtons() {
    return [
      IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Create Shopping List',
        onPressed: () => getx.Get.toNamed(AddShoppingListScreen.routeName),
      )
    ];
  }
}
