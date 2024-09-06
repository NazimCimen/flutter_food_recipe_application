import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

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
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.bold,
                shadows: CustomShadows.customLowShadow(),
              ),
          decoration: CustomInputDecoration.inputDecoration(
            context: context,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
