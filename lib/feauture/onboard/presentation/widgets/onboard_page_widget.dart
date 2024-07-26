import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class OnBoardPageWidget extends StatelessWidget {
  final String? pageColor;
  final String? title;
  final String? description;
  final String? imagePath;
  const OnBoardPageWidget({
    required this.pageColor,
    required this.title,
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingAllXlarge,
      color: pageColor != null ? HexColor.fromHex(pageColor!) : Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imagePath ?? ImageEnums.defaultOnBoardImage.toPathPng,
                  height: context.dynamicHeight(0.4),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.06),
              ),
              Text(
                textAlign: TextAlign.start,
                title ?? '',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Text(
                description ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: context.dynamicWidht(0.04),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
