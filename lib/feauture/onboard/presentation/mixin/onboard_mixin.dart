import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

mixin OnBoardMixin on State<OnBoardView> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = context.locale;
    Provider.of<OnboardViewModel>(context, listen: false)
        .eitherFailureOrOnBoardDatas(locale: locale);
  }

  void nextPageButton(int index) {
    final onboardDataList =
        Provider.of<OnboardViewModel>(context, listen: false).onBoardDatas;
    if (index < ((onboardDataList != null) ? onboardDataList.length - 1 : 0)) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      navigateToLoginView();
    }
  }

  void navigateToLoginView() {
    Provider.of<OnboardViewModel>(context, listen: false)
        .setOnBoardShownUseCase();
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginView);
  }
}
