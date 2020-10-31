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

buildShoppingListItemCard(ShoppingList shoppingList) {
  return ListTile(
    leading: Icon(Icons.shopping_basket),
    title: Text(shoppingList.title),
    subtitle: Text(shoppingList.createdAt.toIso8601String()),
    trailing: IconButton(
      icon: Icon(Icons.more_vert_sharp),
    ),
  );
}
