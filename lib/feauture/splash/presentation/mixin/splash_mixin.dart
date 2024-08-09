import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

mixin SplashMixin on State<SplashView> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GetIt.instance<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final onboardVisibility = await _viewModel.checkOnboardShown();
      final isForceUpdate = await _viewModel.checkForceUpdate();
      _navigateFromSplash(
        isForceUpdate: isForceUpdate,
        onboardScreenVisible: onboardVisibility,
      );
    });
  }

  void _navigateFromSplash({
    required bool onboardScreenVisible,
    required bool isForceUpdate,
  }) {
    if (isForceUpdate) {
      AppDialogs.showForceUpdateDialog(
        context: context,
        title: StringConstants.titleForceUpdate,
        description: StringConstants.descriptionForceUpdate,
      );
    } else {
      onboardScreenVisible
          ? NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeView)
          : NavigatorService.pushNamedAndRemoveUntil(AppRoutes.onboardView);
    }
  }
}
