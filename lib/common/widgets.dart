import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/styles.dart';

RaisedButton appRaisedButton(String text, Function callback,
    {Color color: const Color(secondaryColourLight),
    TextStyle textStyle: appTextOnSecondary}) {
  return RaisedButton(
    color: secondaryColourSwatch[200],
    onPressed: callback,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: textStyle,
    ),
  );
}

SizedBox spaceSizeBox({double height: 26.0}) {
  return SizedBox(
    height: height,
  );
}

enum PopupAction { DELETE, VIEW }

buildShoppingListItemCard(
    ShoppingList shoppingList, void onDelete(ShoppingList list)) {
  return ListTile(
    leading: Icon(Icons.shopping_basket),
    title: Text(shoppingList.title),
    subtitle: Text(shoppingList.createdAt.toIso8601String()),
    trailing: PopupMenuButton<PopupAction>(
      icon: Icon(Icons.more_vert_sharp),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: PopupAction.DELETE,
          child: Text('Delete'),
        )
      ],
      onSelected: (value) {
        if (value == PopupAction.DELETE) onDelete(shoppingList);
      },
    ),
  );
}

class PageScaffold extends StatelessWidget {
  final String title;
  final int selectedNavIndex;
  final List<Widget> body;
  final BottomNavigationBar bottomNavigationBar;
  final List<Widget> appBarActions;
  final AppBar appBar;

  PageScaffold({
    @required this.title,
    this.appBar,
    this.body,
    this.appBarActions,
    this.bottomNavigationBar,
    this.selectedNavIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(child: Column(
        children: body,
      ),),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

abstract class HasActionButtons {
  List<Widget> getActionButtons();
}
