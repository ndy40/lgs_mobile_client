import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/styles.dart';

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shopping_lists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Lets Go Shopping", style: appTextOnPrimary)),
      ),
      body: Center(
        child: _MyShoppingLists(),
      ),
    );
  }
}

class _ActiveShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Active sales'),
    );
  }
}

class _MyShoppingLists extends StatelessWidget {
  final ShoppingListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.shoppingLists.length,
      itemBuilder: (context, position) {
        return buildShoppingListItemCard(controller.shoppingLists[position]);
      },
    );
  }

  Widget _buildListItem(ShoppingList item) {
    print(item);
    return Center(
      child: Text(item.title),
    );
  }
}

class _Socials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Social screens'),
    );
  }
}
