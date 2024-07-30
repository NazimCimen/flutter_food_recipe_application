import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class CustomAuthButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  const CustomAuthButtonWidget({
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 0,
        minimumSize: Size(double.infinity, context.dynamicHeight(0.06)),
        shape: RoundedRectangleBorder(
          borderRadius: context.borderRadiusAllMedium,
        ),
      ),
      onPressed: onPressed,
      child: /*context.watch<AuthController>().isRequestAvaible
          ? CircularProgressIndicator(
              color: AppColors.white,
            )
          :*/
          Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
      ),
    );
  }
}
