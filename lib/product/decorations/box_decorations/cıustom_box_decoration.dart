import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomBoxDecoration {
  CustomBoxDecoration._();
  static BoxDecoration customBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: context.borderRadiusAllMedium,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
