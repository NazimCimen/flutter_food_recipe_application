import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';
import 'package:flutter_food_recipe_application/product/widgets/custom_title_text_shadow_widget.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    required this.maxLines,
    required this.hintText,
    required this.controller,
    required this.validator,
    super.key,
  });
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleTextShadowWidget(text: widget.hintText),
        SizedBox(height: context.dynamicHeight(0.01)),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          maxLines: widget.maxLines,
          decoration: CustomInputDecoration.inputDecoration(
            context: context,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
