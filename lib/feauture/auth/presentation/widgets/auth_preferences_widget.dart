import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class AuthPreferencesWidget extends StatelessWidget {
  final String owWith;
  final String navigateToFirst;
  final String navigateToSecond;
  final VoidCallback pressNavigate;
  const AuthPreferencesWidget({
    super.key,
    required this.owWith,
    required this.navigateToFirst,
    required this.navigateToSecond,
    required this.pressNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDivider(context),
        SizedBox(height: context.dynamicHeight(0.025)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildContainerIcon(
              context: context,
              iconPath: ImageEnums.googleIcon.toPathPng,
            ),
            buildContainerIcon(
              context: context,
              iconPath: ImageEnums.appleIcon.toPathPng,
            ),
          ],
        ),
        SizedBox(height: context.dynamicHeight(0.025)),
        InkWell(
          onTap: pressNavigate,
          child: Text.rich(
            TextSpan(
              text: '$navigateToFirst ',
              children: [
                TextSpan(
                  text: ' $navigateToSecond',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildContainerIcon(
      {required BuildContext context, required String iconPath}) {
    return Container(
      height: context.dynamicHeight(0.08),
      width: context.dynamicHeight(0.08),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: context.borderRadiusAllMedium,
      ),
      child: Image.asset(
        iconPath,
        height: context.dynamicHeight(0.1),
      ),
    );
  }

  Row buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onTertiary,
            height: 2,
          ),
        ),
        Text('  $owWith  '),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onTertiary,
            height: 2,
          ),
        )
      ],
    );
  }
}
