import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';

mixin ShareRecipeViewMixin on State<ShareRecipeView> {
  final PageController pageController = PageController();
  late TextEditingController recipeNameController;
  late TextEditingController recipeDescriptionController;
  late TextEditingController cookingTypeController;
  late TextEditingController worldKitchenController;

  @override
  void initState() {
    recipeNameController = TextEditingController();
    recipeDescriptionController = TextEditingController();
    cookingTypeController = TextEditingController();
    worldKitchenController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    recipeNameController.dispose();
    recipeDescriptionController.dispose();
    cookingTypeController.dispose();
    worldKitchenController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void previusPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  Future<void> shareRecipe() async {
    final shareRecipeViewModel = context.read<ShareRecipeViewModel>();

    await shareRecipeViewModel.getImageUrl();

    final navigate = await shareRecipeViewModel.shareRecipe(
      recipeTitle: recipeNameController.text,
      recipeDescription: recipeDescriptionController.text,
      worldKitchen: worldKitchenController.text,
      cookingType: cookingTypeController.text,
    );
    shareRecipeViewModel.reset();
    if (navigate == true) {
      await NavigatorService.pushNamedAndRemoveUntil(
        AppRoutes.navBarView,
      );
    }
  }
}
