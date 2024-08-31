import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomInputDecoration {
  CustomInputDecoration._();
  static InputDecoration inputDecoration({
    required BuildContext context,
    required String hintText,
  }) =>
      InputDecoration(
        fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.3),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.surface,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.7),
            ),
          ],
        ),
        errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.error,
          shadows: [
            Shadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.7),
            ),
          ],
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error.withOpacity(0.3),
          ),
          borderRadius: context.borderRadiusAllLow,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
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
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.3),
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.surface,
        shadows: [
          Shadow(
            offset: const Offset(1.5, 1.5),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.borderRadiusAllLow,
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.borderRadiusAllLow,
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: context.borderRadiusAllLow,
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
        ),
      ),
    );
  }
}
