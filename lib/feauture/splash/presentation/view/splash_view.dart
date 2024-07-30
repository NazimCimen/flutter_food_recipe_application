import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Image.asset(
          ImageEnums.appLogo.toPathPng,
          fit: BoxFit.cover,
          height: context.dynamicHeight(0.15),
        ),
      ),
    );
  }
}
