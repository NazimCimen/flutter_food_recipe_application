import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomInputDecoration {
  CustomInputDecoration._();
  static InputDecoration inputDecoration(
          {required BuildContext context, required String hintText}) =>
      InputDecoration(
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 2,
          ),
          borderRadius: context.borderRadiusAllLow,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.borderRadiusAllLow,
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );

  static InputDecorationTheme decorationTheme(BuildContext context) {
    return InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onTertiary),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onTertiary),
      ),
    );
  }
}
