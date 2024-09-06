import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

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
      FocusScope.of(context).unfocus();
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
    cleanEmptyDatasInIngredientList();
    context.read<ShareRecipeViewModel>().updateIngredientList(
          ingredientList: ingredientInputs
              .map((input) => input.controller.text.trim())
              .toList(),
        );
  }

  void cleanEmptyDatasInIngredientList() {
    ingredientInputs.removeWhere(
      (element) => element.controller.text.trim().isEmpty,
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

  ///MARK:fix ingredinet nullblty
  void getDefaultValues() {
    final viewModel = context.read<ShareRecipeViewModel>();

    ingredientInputs =
        viewModel.recipeEntity.recipeIngredients!.map((ingredient) {
      return RecipeIngredientInputModel(
        controller: TextEditingController(text: ingredient),
        focusNode: FocusNode(),
      );
    }).toList();
  }
}
