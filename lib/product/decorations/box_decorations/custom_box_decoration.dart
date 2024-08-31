import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomBoxDecoration {
  CustomBoxDecoration._();
  static BoxDecoration customBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
      borderRadius: context.borderRadiusAllLow,
      border: Border.all(
        width: 2,
        color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
      ),
    );
  }

  static BoxDecoration customBoxDecorationImageArea(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
      borderRadius: context.borderRadiusAllMedium,
      border: Border.all(
        width: 2,
        color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
      ),
    );
  }
}
