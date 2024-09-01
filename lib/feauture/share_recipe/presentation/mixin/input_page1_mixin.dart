import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';

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

  /// this method ovveried in view.
  void showScaffoldSnackBar(BuildContext context) {
    CustomSnackBars.showRecipeScaffoldSnackBar(
      context: context,
      text: 'Lütfen bir resim seçiniz.',
    );
  }

  bool validateFields() {
    if (page1FormKey.currentState!.validate()) {
      if (context.read<ShareRecipeViewModel>().croppedImage == null) {
        showScaffoldSnackBar(context);
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  void nextPage() {
    FocusScope.of(context).unfocus();
    final isValidate = validateFields();
    if (isValidate) {
      context.read<ShareRecipeViewModel>().setInputsPage1(
            recipeName: recipeNameController.text,
            recipeDescription: recipeDescriptionController.text,
          );
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  void getDefaultValues() {
    recipeNameController.text = context.read<ShareRecipeViewModel>().recipeName;
    recipeDescriptionController.text =
        context.read<ShareRecipeViewModel>().recipeDescription;
  }
}
