import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFieldWidget({
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).colorScheme.tertiary,
      style: Theme.of(context).textTheme.bodyLarge,
      textInputAction: TextInputAction.next,
      decoration: buildInputDecoration(context),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
          width: 2,
        ),
        borderRadius: context.borderRadiusAllMedium,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.borderRadiusAllMedium,
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      prefixIcon: const Icon(Icons.mail_outline_rounded),
      focusColor: Theme.of(context).colorScheme.tertiary,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.labelMedium,
    );
  }
}
