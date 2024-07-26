import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/core/utils/extensions.dart';
import 'package:flutter_food_recipe_application/core/utils/left_triangle_clipper.dart';

class LeftTriangelWidget extends StatelessWidget {
  final String? butonColor;
  final VoidCallback onPressed;
  final double? widht;
  final double? height;
  const LeftTriangelWidget({
    super.key,
    required this.onPressed,
    required this.butonColor,
    this.height,
    this.widht,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LeftTriangleClipper(triangelRadius: context.dynamicWidht(0.08)),
      child: Container(
          color: Colors.white,
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
                    butonColor ?? '#000000',
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor.fromHex(
                        butonColor ?? '#000000',
                      ).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: GestureDetector(
                onTap: onPressed,
                child: FittedBox(
                  child: Icon(
                    Icons.chevron_right_outlined,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
