import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData prefixIconData;
  final String? Function(String?)? validator;
  const CustomTextFieldWidget({
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    required this.prefixIconData,
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
          color: Theme.of(context).colorScheme.onTertiary,
          width: 2,
        ),
        borderRadius: context.borderRadiusAllMedium,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.borderRadiusAllMedium,
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      prefixIcon: Icon(
        prefixIconData,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      focusColor: Theme.of(context).colorScheme.tertiary,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }
}
