import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/constants/custom_shadows.dart';

class AddStepButton extends StatelessWidget {
  final VoidCallback addButton;
  final String btnText;

  const AddStepButton({
    required this.addButton,
    required this.btnText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: TextButton.icon(
        onPressed: addButton,
        icon: Icon(
          Icons.add,
          shadows: CustomShadows.customLowShadow(),
        ),
        label: Text(
          btnText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                shadows: CustomShadows.customLowShadow(),
              ),
        ),
      ),
    );
  }
}
