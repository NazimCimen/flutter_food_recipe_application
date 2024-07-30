import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            ImageEnums.appLogo.toPathPng,
            fit: BoxFit.cover,
            height: context.dynamicHeight(0.15),
          ),
        ),
      ),
    );
  }
}
