import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/product/decorations/input_decorations/custom_input_decoration.dart';

class CustomDropDownMenuWidget extends StatelessWidget {
  const CustomDropDownMenuWidget({
    required this.controller,
    required this.dropBoxList,
    required this.labelText,
    required this.titleText,
    super.key,
  });
  final List<DropdownMenuEntry<String>> dropBoxList;
  final String labelText;
  final String titleText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        DropdownMenu(
          width: context.dynamicWidht(0.9),
          trailingIcon: const Icon(
            Icons.arrow_drop_down,
          ),
          controller: controller,
          inputDecorationTheme: CustomInputDecoration.decorationTheme(context),
          label: buildText(context),
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
          onSelected: (value) {},
          dropdownMenuEntries: dropBoxList,
        ),
      ],
    );
  }

  Text buildText(BuildContext context) {
    return Text(labelText, style: Theme.of(context).textTheme.bodyMedium);
  }
}
