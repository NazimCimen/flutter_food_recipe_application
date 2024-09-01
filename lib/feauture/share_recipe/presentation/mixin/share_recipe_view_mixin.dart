import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';

mixin ShareRecipeViewMixin on State<ShareRecipeView> {
  late PageController pageController;

  int _currentPage = 0;
  int get currentPage => _currentPage;
  final int _totalPages = 4;
  int get totalPage => _totalPages;

  void onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /* void nextPage() {
    FocusScope.of(context).unfocus();
    if (_currentPage == 0) {
     final isValidate = validateFields();
      if (isValidate) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linearToEaseOut,
        );
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
    }
  }
*/
  void previusPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /* Future<void> shareRecipe() async {
    final shareRecipeViewModel = context.read<ShareRecipeViewModel>();

    await shareRecipeViewModel.getImageUrl();

    final navigate = await shareRecipeViewModel.shareRecipe(
      recipeTitle: recipeNameController.text,
      recipeDescription: recipeDescriptionController.text,
    );
    shareRecipeViewModel.reset();
    if (navigate == true) {
      await NavigatorService.pushNamedAndRemoveUntil(
        AppRoutes.navBarView,
      );
    }
  }*/
}
