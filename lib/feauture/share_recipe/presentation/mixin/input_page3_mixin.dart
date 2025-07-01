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
    // Dispose all focus nodes and text controllers for the ingredient input fields.
    for (final input in ingredientInputs) {
      input.focusNode.dispose();
      input.controller.dispose();
    }
    ingredientInputs.clear();
    super.dispose();
  }

  /// Checks if a new ingredient field can be added by ensuring all existing fields are filled.
  bool canAddNewIngredient() {
    return ingredientInputs.every((input) => input.controller.text.isNotEmpty);
  }

  /// Adds a new ingredient input field to the list if all existing fields are filled.
  void addIngredientField() {
    if (canAddNewIngredient()) {
      setState(() {
        final newIngredient = RecipeIngredientInputModel(
          controller: TextEditingController(),
          focusNode: FocusNode(),
        );
        ingredientInputs.add(newIngredient);
        // Automatically focuses on the new input field after it's added.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(newIngredient.focusNode);
        });
      });
    } else {
      // Shows a snackbar if there's an empty field when trying to add a new one.
      FocusScope.of(context).unfocus();
      CustomSnackBars.showRecipeScaffoldSnackBar(
        context: context,
        text:
            'Please fill in the empty ingredient field before adding a new one.',
      );
    }
  }

  /// Deletes an ingredient input field at the specified index.
  void deleteIngredientField(BuildContext context, int index) {
    setState(() {
      ingredientInputs[index].focusNode.dispose();
      ingredientInputs[index].controller.dispose();
      ingredientInputs.removeAt(index);
    });
  }

  /// Updates the ingredient field at the specified index with a new value.
  void updateIngredientField(int index, String newValue) {
    setState(() {
      ingredientInputs[index] = ingredientInputs[index].copyWith(
        ingredient: newValue,
        controller: TextEditingController(text: newValue),
      );
    });
  }

  /// Updates the ViewModel's ingredient list with the current input values.
  void updateViewModelIngredients() {
    cleanEmptyDatasInIngredientList();
    context.read<ShareRecipeViewModel>().updateIngredientList(
          ingredientList: ingredientInputs
              .map((input) => input.controller.text.trim())
              .toList(),
        );
  }

  /// Removes any ingredient fields that are empty from the list.
  void cleanEmptyDatasInIngredientList() {
    ingredientInputs.removeWhere(
      (element) => element.controller.text.trim().isEmpty,
    );
  }

  /// Navigates to the previous page in the PageView and updates the ingredient list in the ViewModel.
  void previousPage() {
    FocusScope.of(context).unfocus();
    updateViewModelIngredients();
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Navigates to the next page in the PageView and updates the ingredient list in the ViewModel.
  void nextPage() {
    FocusScope.of(context).unfocus();
    updateViewModelIngredients();
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  /// Retrieves the default values for the ingredient list from the ViewModel and sets them in the input fields.
  void getDefaultValues() {
    final viewModel = context.read<ShareRecipeViewModel>();
    if (viewModel.recipeEntity.recipeIngredients != null) {
      ingredientInputs =
          viewModel.recipeEntity.recipeIngredients!.map((ingredient) {
        return RecipeIngredientInputModel(
          controller: TextEditingController(text: ingredient),
          focusNode: FocusNode(),
        );
      }).toList();
    }
  }
}
