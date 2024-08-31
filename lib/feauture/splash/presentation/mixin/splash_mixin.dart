import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

mixin SplashMixin on State<SplashView> {
  late final SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GetIt.instance<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final onboardVisibility = await _viewModel.checkOnboardShown();
      final devicePlatform = _viewModel.getDevicePlatform();
      final appDatabaseVersionNumber = await _viewModel.getAppDatabaseVersion(
        devicePlatform: devicePlatform,
      );
      final appDeviceVersionNumber =
          await _viewModel.getDeviceAppVersionNumber();
      final isForceUpdate = await _viewModel.checkForceUpdate(
        appDatabaseVersionNumber,
        appDeviceVersionNumber,
      );
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
      CustomDialogs.showForceUpdateDialog(
        context: context,
        title: StringConstants.titleForceUpdate,
        description: StringConstants.descriptionForceUpdate,
      );
    } else {
      onboardScreenVisible
          ? NavigatorService.pushNamedAndRemoveUntil(AppRoutes.navBarView)
          : NavigatorService.pushNamedAndRemoveUntil(AppRoutes.onboardView);
    }
  }
}
