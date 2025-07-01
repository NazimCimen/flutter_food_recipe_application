import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/product/constants/custom_shadows.dart';

class CustomTitleTextShadowWidget extends StatelessWidget {
  final String text;
  const CustomTitleTextShadowWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.surface,
            shadows: CustomShadows.customLowShadow(),
          ),
    );
  }
}
