import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

mixin SplashMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateBasedOnSplash();
    });
  }

  Future<void> _navigateBasedOnSplash() async {
    await Provider.of<SplashViewModel>(context, listen: false)
        .checkSplashShown();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    navigateFromSplash();
  }

  void navigateFromSplash() {
    final onBoardShown = context.read<SplashViewModel>().onBoardShown;
    if (onBoardShown != null) {
      onBoardShown
          ? NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeView)
          : NavigatorService.pushNamedAndRemoveUntil(AppRoutes.onboardView);
    } else {
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.onboardView);
    }
  }
}
