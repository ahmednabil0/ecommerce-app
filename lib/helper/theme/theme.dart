import 'package:flutter/material.dart';

import '../helpers/conest.dart';

ThemeData getThemeDate() {
  return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      primaryColor: primaryColor,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Color(0x000000ff),
          secondary: Color(0x000000ff),
          onSecondary: Color(0x000000ff),
          error: Colors.red,
          onError: Colors.red,
          background: Colors.transparent,
          onBackground: Colors.transparent,
          surface: Color(0x000000ff),
          onSurface: Color(0x000000ff)));
}
