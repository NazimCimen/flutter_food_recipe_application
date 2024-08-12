import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CustomPasswordFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final VoidCallback changeObsecureText;
  const CustomPasswordFormField({
    required this.controller,
    required this.labelText,
    required this.validator,
    required this.obsecureText,
    required this.changeObsecureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: Theme.of(context).colorScheme.tertiary,
      style: Theme.of(context).textTheme.bodyLarge,
      textInputAction: TextInputAction.next,
      decoration: _buildInputDecoration(context),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
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
      focusColor: Theme.of(context).colorScheme.tertiary,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      prefixIcon: Icon(
        Icons.lock_outline,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          changeObsecureText();
        },
        icon: Icon(
          obsecureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    );
  }
}
