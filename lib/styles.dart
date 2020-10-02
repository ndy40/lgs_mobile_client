import 'dart:ui';

import 'package:flutter/material.dart';

const primaryColour = 0xFF58C69D;

const secondaryColourLight = 0xFF96F6C6;

const lgsPrimaryColour = Color(primaryColour);

const lgsSecondaryColour = Color(secondaryColourLight);

const primaryColourSwatch = MaterialColor(primaryColour, <int, Color>{
  50: Color(0xFFE1FEEF),
  100: Color(0xFFB6FAD8),
  200: Color(0xFF96F6C6),
  300: Color(0xFF7EEBB8),
  400: Color(0xFF66DCA9),
  500: Color(0xFF58C69D),
  600: Color(0xFF49B392),
  700: Color(0xFF449B8A),
  800: Color(0xFF3C8481),
  900: Color(0xFF1B5E20)
});

const secondaryColourSwatch = MaterialColor(secondaryColourLight, <int, Color>{
  50: Color(0xFFDED5F9),
  100: Color(0xFFAA99FB),
  200: Color(0xFF8464F0),
  300: Color(0xFF5019D9),
  400: Color(0xFF1B00B7),
  500: Color(0xFF000096),
  600: Color(0xFF00007B),
  700: Color(0xFF00005E),
  800: Color(0xFF000046),
  900: Color(0xFF000027)
});

const appTextOnSecondary = TextStyle(
    color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.normal);
