import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/config/app_config_export.dart';

abstract class ApplicationTheme {
  ThemeData get themeData;
}

/// Custom light theme for project design
final class CustomLightTheme implements ApplicationTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: CustomColorScheme.lightScheme,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: CustomColorScheme.lightScheme.primary),
        scaffoldBackgroundColor: CustomColorScheme.lightScheme.primary,
      );
}

/// Custom Dark theme for project design
final class CustomDarkTheme implements ApplicationTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkSheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: CustomColorScheme.darkSheme.primary,
        ),
        scaffoldBackgroundColor: CustomColorScheme.darkSheme.primary,
      );
}
