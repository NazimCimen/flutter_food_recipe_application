import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(
      0xFFFFAD00,
    ), //background scaffold and appbar. check light themedata for  appbar and scaffold theme
    onPrimary: Colors.white,
    secondary: Color(
        0xFF202E3B), // used for icons. and third main color of app(black white blue)
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white, //default card and text color
    onSurface: Colors.black,
    tertiary: Color(0xffF3F4F6),
    onTertiary: Colors.grey,
    onPrimaryContainer: Color(0xffFFF5E6),
    outline: Colors.white,
  );
  static const darkSheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(
      0xFFFFAD00,
    ), //background scaffold and appbar. check light themedata for  appbar and scaffold theme
    onPrimary: Colors.white,
    secondary: Color(
        0xFF202E3B), // used for icons. and third main color of app(black white blue)
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimaryContainer: Color(0xffFFF5E6),

    surface: Colors.white, //default card and text color
    onSurface: Colors.black,

    tertiary: Color(0xffF3F4F6),
    onTertiary: Colors.grey,
    outline: Colors.white,
  );
}
