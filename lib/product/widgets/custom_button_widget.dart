import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class CustomButtonWidget extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onPressed;
  const CustomButtonWidget({
    required this.context,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: ContinuousRectangleBorder(
          borderRadius: context.borderRadiusAllMedium,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
