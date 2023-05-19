import 'package:flutter/material.dart';

class MyTheme {
  static const darkBlue = Color(0xFF1F1273);
  static const almostWhite = Color(0xFFF2F2F2);
  static const fullWhite = Color(0xFFFFFFFF);
  static const red = Color(0xFFf20505);
  static const lightblue = Color(0xFF565AA7);
  static const almostBlack = Color(0xFF0D0D0D);
  static const fullBlack = Color(0xFF000000);

  static const primaryFont = 'RobotoSlab';
  static const secundaryFont = 'Nunito';

  static const colorScheme1 = ColorScheme(
    background: almostWhite,
    onBackground: almostBlack,
    brightness: Brightness.light,
    error: red,
    onError: almostWhite,
    primary: darkBlue,
    onPrimary: almostWhite,
    secondary: red,
    onSecondary: almostWhite,
    surface: darkBlue, // lightblue,
    onSurface: almostWhite,
  );
}
