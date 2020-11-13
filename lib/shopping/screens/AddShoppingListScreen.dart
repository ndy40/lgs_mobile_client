import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/api_resources.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/repositories.dart';
import 'package:lgs_mobile_client/styles.dart';

class AddShoppingListScreen extends StatelessWidget {
  static const routeName = '/add_shopping_list';

  final AddShoppingListController _controller = Get.find();
  final ShoppingListController _shoppingListController = Get.find();

  final appService = apiClient.getService<ShoppingListRepository>();

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
                  final shoppingList =
                      await _controller.save(_controller.shoppingList);
                  if (shoppingList is ShoppingList)
                    await _shoppingListController.refresh();
                  Get.back();
                } catch (e) {
                  Get.showSnackbar(GetBar(
                    message: 'Error saving Shopping List',
                  ));
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
                      _controller.setTitle(value);
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
                            _controller.setStatus(value);
                          },
                        )),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
