import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/config/app_config_export.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

abstract class ApplicationTheme {
  ThemeData get themeData;
  ColorScheme get colorScheme;
}

/// Custom light theme for project design
final class CustomLightTheme implements ApplicationTheme {
  @override
  ColorScheme get colorScheme => CustomColorScheme.lightScheme;
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: CustomColorScheme.lightScheme,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ),
      );
}

/// Custom Dark theme for project design
final class CustomDarkTheme implements ApplicationTheme {
  @override
  ColorScheme get colorScheme => CustomColorScheme.darkSheme;
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkSheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      );
}
