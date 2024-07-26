import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/view/onboard_view.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/presentation/viewmodel/onboard_view_model.dart';
import 'package:provider/provider.dart';

mixin OnBoardMixin on State<OnBoardView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<OnboardViewModel>(context, listen: false)
        .eitherFailureOrOnBoardDatas();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void nextPageButton(int index) {
    final onboardDataList =
        Provider.of<OnboardViewModel>(context, listen: false).onBoardDatas;

    if (index < ((onboardDataList != null) ? onboardDataList.length - 1 : 0)) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      /*  Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );*/
    }
  }
}
