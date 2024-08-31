import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/viewmodel/share_recipe_view_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:uuid/uuid.dart';

mixin InputPage4Mixin on State<InputPage4> {
  late final ShareRecipeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<ShareRecipeViewModel>();
    initialStep();
  }

  void initialStep() {
    viewModel.createInitialStep(
      step: RecipeStepEntity(
        id: const Uuid().v1(),
        stepNumber: 1,
        stepDescription: '',
        stepImageUrl: '',
      ),
    );
  }
}
