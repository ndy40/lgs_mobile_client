import 'package:flutter/material.dart';
import 'package:lgs_mobile_client/styles.dart';

final appTheme = ThemeData(
  primarySwatch: primaryColourSwatch,
  accentColor: secondaryColourSwatch[200],
  buttonTheme: ButtonThemeData(buttonColor: secondaryColourSwatch.shade200),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
