import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(
        0xFF1FCC79), //background scaffold and appbar. check light themedata for  appbar and scaffold theme
    onPrimary: Colors.white,
    secondary: Color(
        0xFF24D37F), // used for icons. and third main color of app(black white blue)
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white, //default card color
    onSurface: Colors.black,
    tertiary: Colors.grey, // used for hint and field colors
  );
  static const darkSheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors
        .black, //background scaffold and appbar. check light themedata for  appbar and scaffold theme
    onPrimary: Colors.white,
    secondary: Color(
        0xff5479f7), // used for icons. and third main color of app(black white blue)
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Color(0xff171717), //default card color
    onSurface: Colors.white,
    tertiary: Colors.grey,
  );
}
