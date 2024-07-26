import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class LeftTriangelWidget extends StatelessWidget {
  final String? butonColor;
  final VoidCallback onPressed;
  final double? widht;
  final double? height;
  const LeftTriangelWidget({
    required this.onPressed,
    required this.butonColor,
    this.height,
    this.widht,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LeftTriangleClipper(triangelRadius: context.dynamicWidht(0.08)),
      child: Container(
        color: Theme.of(context).colorScheme.outline,
        width: widht,
        height: height,
        child: Padding(
          padding: context.paddingAllXlarge,
          child: Container(
            height: context.dynamicWidht(0.01),
            width: context.dynamicWidht(0.01),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HexColor.fromHex(
                butonColor ?? '#FFFFFF',
              ),
              boxShadow: [
                BoxShadow(
                  color: HexColor.fromHex(
                    butonColor ?? '#FFFFFF',
                  ).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: FittedBox(
                child: Icon(
                  Icons.chevron_right_outlined,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
