import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

mixin InputPage1Mixin on State<InputPage1> {
  late TextEditingController recipeNameController;
  late TextEditingController recipeDescriptionController;
  late GlobalKey<FormState> page1FormKey;
  late AppValidators validators;

  @override
  void initState() {
    page1FormKey = GlobalKey<FormState>();
    validators = AppValidators();
    recipeNameController = TextEditingController();
    recipeDescriptionController = TextEditingController();
    getDefaultValues();
    super.initState();
  }

  @override
  void dispose() {
    recipeNameController.dispose();
    recipeDescriptionController.dispose();
    super.dispose();
  }

  /// Shows a snackbar with a message to prompt the user to select an image.
  /// This method is meant to be overridden in the view.
  void showScaffoldSnackBar(BuildContext context) {
    CustomSnackBars.showRecipeScaffoldSnackBar(
      context: context,
      text: 'Lütfen bir resim seçiniz.',
    );
  }

  /// Validates the form fields and checks if an image is selected.
  /// Returns true if validation is successful and an image is selected,
  /// otherwise shows a snackbar and returns false.
  bool validateFields() {
    if (page1FormKey.currentState!.validate()) {
      if (context.read<ShareRecipeViewModel>().selectedRecipeImage == null) {
        showScaffoldSnackBar(context);
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  /// Proceeds to the next page if the form fields are valid and an image is selected.
  /// It also saves the recipe title and description to the ViewModel.
  void nextPage() {
    FocusScope.of(context).unfocus();
    final isValidate = validateFields();
    if (isValidate) {
      context.read<ShareRecipeViewModel>().setRecipeTitleAndDesc(
            recipeName: recipeNameController.text,
            recipeDescription: recipeDescriptionController.text,
          );
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  /// Retrieves the default values for the recipe name and description from the ViewModel
  /// and sets them in the corresponding text controllers.
  void getDefaultValues() {
    recipeNameController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.recipeTitle ?? '';
    recipeDescriptionController.text =
        context.read<ShareRecipeViewModel>().recipeEntity.recipeDescription ??
            '';
  }
}
