import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/services.dart';
import 'package:lgs_mobile_client/styles.dart';

class AddShoppingListScreen extends StatelessWidget {
  static const routeName = '/add_shopping_list';

  final AddShoppingListController _controller = Get.find();

  final appService = apiClient.getService<ShoppingListService>();

  final _appBar = AppBar(
    title: Container(
      child: Text(
        'Add Shopping List',
        style: appTextOnPrimary.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Add Shopping List',
      appBar: _appBar,
      body: [
        ShoppingListCard(_controller, ShoppingListCardMode.create),
        Row(
          children: [
            Expanded(
              child: appRaisedButton('Create', () async {
                try {
                  final resp =
                      await appService.createResource(_controller.shoppingList);
                  print(resp.body);
                  Get.back();
                } catch (e) {
                  print(e);
                }
              }),
            )
          ],
        )
      ],
    );
  }
}

enum ShoppingListCardMode { create, edit }

class ShoppingListCard extends StatelessWidget {
  final AddShoppingListController _controller;

  final ShoppingListCardMode mode;

  ShoppingListCard(this._controller, this.mode);

  final RxString selectedStatus = ShoppingList.draftStatus.obs;

  final RxList<String> statuses = ShoppingList.statuses.obs;

  final TextEditingController shoppingListName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: this.shoppingListName,
                  decoration: InputDecoration(
                      hintText: "Enter shopping list title",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: lgsPrimaryColour))),
                  onChanged: (value) {
                    _controller.shoppingList.title = value;
                    _controller.shoppingList = _controller.shoppingList;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(() => DropdownButton<String>(
                        value: selectedStatus.value,
                        items: statuses.value
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                            .toList(),
                        onChanged: (value) {
                          selectedStatus.value = value;
                          _controller.shoppingList.status = value;
                          _controller.shoppingList = _controller.shoppingList;
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
