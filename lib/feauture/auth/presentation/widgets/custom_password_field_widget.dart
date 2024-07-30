import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class CustomPasswordFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPasswordFormField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //   obscureText: context.watch<AuthController>().obsecureText,
      validator: (value) => null,
      controller: controller,
      keyboardType: TextInputType.text,
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
      focusColor: Theme.of(context).colorScheme.tertiary,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.labelMedium,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        onPressed: () {
          // context.read<AuthController>().changeObsecureText();
        },
        icon: Icon(
          //context.watch<AuthController>().obsecureText
          //    ? Icons.visibility_off_outlined
          //:
          Icons.visibility_outlined,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
