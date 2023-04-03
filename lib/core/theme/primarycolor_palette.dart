import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff6998AB, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff6998AB), //10%
      100: Color(0xff6998AB), //20%
      200: Color(0xff6998AB), //30%
      300: Color(0xff6998AB), //40%
      400: Color(0xff6998AB), //50%
      500: Color(0xff6998AB), //60%
      600: Color(0xff6998AB), //70%
      700: Color(0xff6998AB), //80%
      800: Color(0xff6998AB), //90%
      900: Color(0xff6998AB), //100%
    },
  );
}
