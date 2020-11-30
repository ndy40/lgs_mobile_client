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
    BlocProvider.of<ShoppingListsBloc>(context).add(ShoppingListsFetchStarted());

    return BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
      buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is ShoppingListsLoaded) {
            final ShoppingListsLoaded currentState = state;

            if (currentState.collection.totalItems < 1) {
              return Text('No shopping list created');
            }

            return SafeArea(
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemCount: currentState.collection.totalItems,
                    itemBuilder: (context, position) {
                      return buildShoppingListItemCard(
                          currentState.collection.members[position], (value) async {
                        BlocProvider.of<ShoppingListsBloc>(context).add(ShoppingListDeleted(shoppingList: value));
                      });
                    },
                  ),
                  onRefresh: () async {
                    BlocProvider.of<ShoppingListsBloc>(context).add(ShoppingListsFetchStarted());
                  },
                ));
          }

          return Center(child: CircularProgressIndicator(),);
    });
  }

  @override
  List<Widget> getActionButtons(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Create Shopping List',
        onPressed: () => Navigator.of(context).pushNamed(AddShoppingListScreen.routeName),
      )
    ];
  }
}
