import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class CookingDurationWidget extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onSliderChanged;

  const CookingDurationWidget({
    required this.sliderValue,
    required this.onSliderChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cooking Duration (in minutes)',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildText(
              context: context,
              text: '<10',
              sliderValue: 0,
            ),
            _buildText(
              context: context,
              text: '30',
              sliderValue: 30,
            ),
            _buildText(
              context: context,
              text: '>60',
              sliderValue: 60,
            ),
          ],
        ),
        Slider(
          inactiveColor: Theme.of(context).colorScheme.tertiary,
          value: sliderValue,
          max: 60,
          divisions: 2,
          label: sliderValue.round() == 0
              ? '<10'
              : sliderValue.round() == 30
                  ? sliderValue.round().toString()
                  : '>60',
          onChanged: onSliderChanged,
        ),
      ],
    );
  }

  Text _buildText({
    required BuildContext context,
    required String text,
    required int sliderValue,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: this.sliderValue >= sliderValue
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}
