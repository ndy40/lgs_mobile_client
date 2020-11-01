import 'package:flutter/material.dart';

class ActiveShopping extends StatelessWidget {
  static const routeName = '/active_shopping';

  static const icon = Icons.play_circle_fill;

  static const title = 'Active';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Active sales'),
    );
  }
}
