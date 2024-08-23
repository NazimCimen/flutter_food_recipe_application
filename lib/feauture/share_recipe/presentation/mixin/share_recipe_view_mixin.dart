import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';

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
}
