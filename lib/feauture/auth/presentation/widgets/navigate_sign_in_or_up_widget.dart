import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class NavigateSignInOrUpWidget extends StatelessWidget {
  final VoidCallback backButtonOnTap;
  final VoidCallback navigateButtonOnTap;
  final String text;
  final String buttonText;

  const NavigateSignInOrUpWidget({
    required this.backButtonOnTap,
    required this.navigateButtonOnTap,
    required this.text,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: backButtonOnTap,
          child: Icon(
            //  Icons.arrow_back_ios_new_outlined,
            Icons.home,
            color: Theme.of(context).colorScheme.surface,
            shadows: [
              Shadow(
                offset: const Offset(1.5, 1.5),
                blurRadius: 2,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: const Offset(1.5, 1.5),
                blurRadius: 2,
                color:
                    Theme.of(context).colorScheme.onTertiary.withOpacity(0.5),
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.dynamicWidht(0.03),
        ),
        GestureDetector(
          onTap: navigateButtonOnTap,
          child: Container(
            height: context.dynamicHeight(0.04),
            width: context.dynamicWidht(0.25),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: context.borderRadiusAllLow,
              border: Border.all(
                color: Theme.of(context).colorScheme.onTertiary,
                width: 2,
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 2,
                        color: Theme.of(context)
                            .colorScheme
                            .onTertiary
                            .withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
