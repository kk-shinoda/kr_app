import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    brightness: Brightness.light,
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    backgroundColor: Colors.grey[100],
    // primarySwatch: CustomColors.theme[500],
    primaryColor: CustomColors.theme[500],
    primaryColorBrightness: Brightness.light,
    accentColor: CustomColors.accent[500]);

class CustomColors {
  CustomColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> theme = const <int, Color>{
    500: const Color(0xFFFBC812),
    600: const Color(0xFFFEAD22),
  };

  static const Map<int, Color> accent = const <int, Color>{
    500: const Color(0xFFF57C00),
  };
}
