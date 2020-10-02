import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/styles.dart';

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shopping_lists';

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: loadingScreen());
  }

  Widget loadingScreen() {
    return Container(
        child: Center(
            heightFactor: 10,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(45),
                  child: Text(
                    "Loading..",
                    style: TextStyle(
                        fontSize: 18, color: primaryColourSwatch[500]),
                  ),
                ),
              ],
            )));
  }
}
