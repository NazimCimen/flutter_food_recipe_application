import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

mixin SplashMixin on State<SplashView> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GetIt.instance<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOnBoardVisibility();
    });
  }

  Future<void> _checkOnBoardVisibility() async {
    final result = await _viewModel.checkOnboardShown();
    await Future<void>.delayed(const Duration(seconds: 1));
    if (mounted) {
      _navigateFromSplash(result);
    }
  }

  void _navigateFromSplash(bool result) {
    result
        ? NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeView)
        : NavigatorService.pushNamedAndRemoveUntil(AppRoutes.onboardView);
  }
}
