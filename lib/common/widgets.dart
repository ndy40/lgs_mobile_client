import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgs_mobile_client/styles.dart';

RaisedButton appRaisedButton(String text, Function callback,
    {Color color: const Color(secondaryColourLight),
    TextStyle textStyle: appTextOnSecondary}) {
  return RaisedButton(
    color: secondaryColourSwatch[200],
    onPressed: callback,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
