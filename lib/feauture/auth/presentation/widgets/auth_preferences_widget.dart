import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class AuthPreferencesWidget extends StatelessWidget {
  final VoidCallback onPressedGoogle;
  final VoidCallback onPressedApple;

  const AuthPreferencesWidget({
    required this.onPressedGoogle,
    required this.onPressedApple,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDivider(context),
        SizedBox(height: context.dynamicHeight(0.025)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildContainerIcon(
              context: context,
              text: StringConstants.continueWithGoogle,
              iconPath: ImageEnums.googleIcon.toPathPng,
              onPressed: onPressedGoogle,
            ),
            SizedBox(height: context.dynamicHeight(0.025)),
            buildContainerIcon(
              context: context,
              iconPath: ImageEnums.appleIcon.toPathPng,
              text: StringConstants.continueWithApple,
              onPressed: onPressedApple,
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector buildContainerIcon({
    required BuildContext context,
    required String iconPath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: context.dynamicHeight(0.06),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: context.borderRadiusAllMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: context.dynamicHeight(0.1),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onTertiary,
            thickness: 2,
          ),
        ),
        Text(StringConstants.or),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onTertiary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
