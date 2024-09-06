import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

class CustomDropDownMenuWidget extends StatelessWidget {
  const CustomDropDownMenuWidget({
    required this.dropBoxList,
    required this.hintText,
    required this.titleText,
    required this.onSelected,
    required this.controller,
    super.key,
  });
  final List<DropdownMenuEntry<String>> dropBoxList;
  final String hintText;
  final String titleText;
  final TextEditingController controller;
  final ValueSetter<String> onSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleTextShadowWidget(text: titleText),
        SizedBox(height: context.dynamicHeight(0.01)),
        DropdownMenu(
          width: context.dynamicWidht(0.9),
          initialSelection: '',
          trailingIcon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.primary,
            shadows: CustomShadows.customLowShadow(),
          ),
          inputDecorationTheme: CustomInputDecoration.decorationTheme(context),
          hintText: hintText,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                shadows: CustomShadows.customLowShadow(),
              ),
          onSelected: (value) {
            onSelected.call(value ?? '');
          },
          dropdownMenuEntries: dropBoxList,
          controller: controller,
        ),
      ],
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      hintText,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.surface,
            shadows: CustomShadows.customLowShadow(),
          ),
    );
  }
}
