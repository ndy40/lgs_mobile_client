import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/shopping/bloc/shopping_lists_bloc.dart';
import 'package:lgs_mobile_client/shopping/controllers.dart';
import 'package:lgs_mobile_client/shopping/screens/AddShoppingListScreen.dart';

class MyShoppingLists extends StatelessWidget implements HasActionButtons {
  static const routeName = '/shopping_lists';

  static const icon = Icons.list_alt;

  static const title = 'Lists';

  final ShoppingListController controller = getx.Get.find();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShoppingListsBloc>(context).add(ShoppingListsFetchInitial());
    return BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
        builder: (context, state) {
          if (state is ShoppingListsLoaded) {
            final ShoppingListsLoaded currentState = state;
            return SafeArea(
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemCount: currentState.collection.totalItems,
                    itemBuilder: (context, position) {
                      return buildShoppingListItemCard(
                          currentState.collection.members[position], (value) async {
                            //TODO: to delete shopping list
                        // final response =
                        // await controller.deleteShoppingList(value.id);
                        //
                        // if (response == true) await controller.refresh();
                      });
                    },
                  ),
                  onRefresh: () async {
                    //TODO: refresh on pull
                  },
                ));
          }

          return Text('No shopping list created');

    });
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
