import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

mixin InputPage2Mixin on State<InputPage2> {
  late TextEditingController recipeWorlKitchenController;
  late TextEditingController recipeCookingTypeController;

  @override
  void initState() {
    recipeWorlKitchenController = TextEditingController();
    recipeCookingTypeController = TextEditingController();
    getDefaultValues();
    super.initState();
  }

  @override
  void dispose() {
    recipeWorlKitchenController.dispose();
    recipeCookingTypeController.dispose();
    super.dispose();
  }

  /// Navigates to the previous page in the PageView when the user wants to go back.
  void previousPage() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Navigates to the next page in the PageView when the user wants to proceed.
  void nextPage() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Retrieves the default values for the recipe's world kitchen and cooking type
  /// from the ViewModel and sets them in the corresponding text controllers.
  void getDefaultValues() {
    recipeWorlKitchenController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.worldKitchen ?? '';
    recipeCookingTypeController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.cookingType ?? '';
  }
}
