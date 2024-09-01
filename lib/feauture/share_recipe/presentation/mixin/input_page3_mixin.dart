import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_ingredient_input_model.dart';

mixin InputPage3Mixin on State<InputPage3> {
  List<RecipeIngredientInputModel> ingredientInputs = [];

  @override
  void initState() {
    getDefaultValues();
    super.initState();
  }

  @override
  void dispose() {
    for (final input in ingredientInputs) {
      input.focusNode.dispose();
      input.controller.dispose();
    }
    ingredientInputs.clear();
    super.dispose();
  }

  bool canAddNewIngredient() {
    return ingredientInputs.every((input) => input.controller.text.isNotEmpty);
  }

  void addIngredientField() {
    if (canAddNewIngredient()) {
      setState(() {
        final newIngredient = RecipeIngredientInputModel(
          controller: TextEditingController(),
          focusNode: FocusNode(),
        );
        ingredientInputs.add(newIngredient);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(newIngredient.focusNode);
        });
      });
    } else {
      CustomSnackBars.showRecipeScaffoldSnackBar(
        context: context,
        text:
            'Please fill in the empty ingredient field before adding a new one.',
      );
    }
  }

  void deleteIngredientField(BuildContext context, int index) {
    setState(() {
      ingredientInputs[index].focusNode.dispose();
      ingredientInputs[index].controller.dispose();
      ingredientInputs.removeAt(index);
    });
  }

  void updateIngredientField(int index, String newValue) {
    setState(() {
      ingredientInputs[index] = ingredientInputs[index].copyWith(
        ingredient: newValue,
        controller: TextEditingController(text: newValue),
      );
    });
  }

  void updateViewModelIngredients() {
    context.read<ShareRecipeViewModel>().updateIngredientList(
          ingredientInputs
              .map((input) => input.controller.text.trim())
              .toList(),
        );
  }

  void previousPage() {
    FocusScope.of(context).unfocus();
    updateViewModelIngredients();
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void nextPage() {
    FocusScope.of(context).unfocus();
    updateViewModelIngredients();
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void getDefaultValues() {
    final viewModel = context.read<ShareRecipeViewModel>();
    ingredientInputs = viewModel.ingredients.map((ingredient) {
      return RecipeIngredientInputModel(
        controller: TextEditingController(text: ingredient),
        focusNode: FocusNode(),
      );
    }).toList();
  }
}
