import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    required this.maxLines,
    required this.hintText,
    required this.controller,
    super.key,
  });
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: context.dynamicHeight(0.02)),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: CustomInputDecoration.inputDecoration(
            context: context,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
