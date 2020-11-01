import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/models.dart';

class MyShoppingLists extends StatelessWidget {
  static const routeName = '/shopping_lists';

  static const icon = Icons.list_alt;

  static const title = 'Lists';

  final ShoppingListController controller = getx.Get.find();

  @override
  Widget build(BuildContext context) {
    return getx.Obx(() => RefreshIndicator(
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
        ));
  }

  refresh() {
    controller.refresh();
  }

  Widget _buildListItem(ShoppingList item) {
    print(item);
    return Center(
      child: Text(item.title),
    );
  }
}
