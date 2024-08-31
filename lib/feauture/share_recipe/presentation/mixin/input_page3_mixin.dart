import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/product/componets/custom_snack_bars.dart';

mixin InputPage3Mixin on State<InputPage3> {
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<ShareRecipeViewModel>();
    focusNodes =
        List.generate(viewModel.ingredients.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  bool canAddNewIngredient(List<String> ingredients) {
    return !ingredients.any((ingredient) => ingredient.isEmpty);
  }

  void addIngredientField() {
    final viewModel = context.read<ShareRecipeViewModel>();
    final ingredients = viewModel.ingredients;
    if (canAddNewIngredient(ingredients)) {
      setState(() {
        viewModel.ingredients.add('');
        focusNodes.add(FocusNode());
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(focusNodes.last);
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
    final viewModel = context.read<ShareRecipeViewModel>();
    setState(() {
      viewModel.ingredients.removeAt(index);
      focusNodes.removeAt(index);
    });
  }
}
