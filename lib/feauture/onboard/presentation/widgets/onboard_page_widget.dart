import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardPageWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;

  const OnBoardPageWidget({
    required this.title,
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ValueKey<String?>(title),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageEnums.onboardBackground.toPathPng),
          ),
        ),
        padding: context.paddingAllXlarge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.06),
                  ),
                  FadeInLeft(
                    child: Text(
                      textAlign: TextAlign.start,
                      title ?? '',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: context.dynamicWidht(0.09),
                        letterSpacing: 1.3,
                        color: Theme.of(context).colorScheme.surface,
                        shadows: [
                          Shadow(
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.03),
                  ),
                  FadeInRight(
                    child: Text(
                      description ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: context.dynamicWidht(0.04),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.06),
                  ),
                  Center(
                    child: FadeInLeft(
                      child: Image.asset(
                        imagePath ?? ImageEnums.defaultOnBoardImage.toPathPng,
                        height: context.dynamicHeight(0.4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.06),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
