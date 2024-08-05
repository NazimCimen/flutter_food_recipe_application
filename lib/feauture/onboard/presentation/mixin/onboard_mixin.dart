import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

mixin OnBoardMixin on State<OnBoardView> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locale = context.locale;
      Provider.of<OnboardViewModel>(context, listen: false)
          .eitherFailureOrOnBoardDatas(locale: locale);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextPageButton() {
    final onboardDataList =
        Provider.of<OnboardViewModel>(context, listen: false).onBoardDatas;
    if (currentPage <
        ((onboardDataList != null) ? onboardDataList.length - 1 : 0)) {
      currentPage++;
      setState(() {});
    } else {
      if (mounted) {
        navigateToHomeView();
      }
    }
  }

  void previousPageButton() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void navigateToHomeView() {
    Provider.of<OnboardViewModel>(context, listen: false)
        .setOnBoardShownUseCase();
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeView);
  }
}
