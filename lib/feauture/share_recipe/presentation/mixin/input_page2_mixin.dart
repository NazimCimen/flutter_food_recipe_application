import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';

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

  void previousPage() {
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void nextPage() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void getDefaultValues() {
    recipeWorlKitchenController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.worldKitchen ?? '';
    recipeCookingTypeController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.cookingType ?? '';
  }
}
