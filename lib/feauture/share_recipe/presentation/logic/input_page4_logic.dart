import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/product/models/recipe_step_input_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';

class InputPage4Logic {
  final List<RecipeStepInputModel> _inputSteps = [];

  List<RecipeStepInputModel> get steps => _inputSteps;

  void addStep({required RecipeStepEntity recipeStep}) {
    _inputSteps.add(RecipeStepInputModel(
      controller: TextEditingController(),
      focusNode: FocusNode(),
      stepEntity: recipeStep,
    ));
  }

  void removeStep(RecipeStepEntity recipeStep) {
    final stepModel = _inputSteps.firstWhere(
      (step) => step.stepEntity == recipeStep,
      orElse: () => throw Exception('Step not found'),
    );

    stepModel.controller.dispose();
    stepModel.focusNode.dispose();
    _inputSteps.remove(stepModel);
  }

  bool isCurrentStepValid() {
    return _inputSteps.every((step) => step.controller.text.isNotEmpty);
  }

  void updateRecipeStep(RecipeStepEntity recipeStep, String description) {
    final index = _inputSteps.indexWhere(
      (step) => step.stepEntity == recipeStep,
    );

    if (index != -1) {
      final updatedStepEntity =
          recipeStep.copyWith(stepDescription: description);
      _inputSteps[index] =
          _inputSteps[index].copyWith(stepEntity: updatedStepEntity);
    }
  }

  RecipeStepInputModel? getStepByEntity(RecipeStepEntity recipeStep) {
    return _inputSteps
        .firstWhereOrNull((step) => step.stepEntity == recipeStep);
  }

  void dispose() {
    for (final step in _inputSteps) {
      step.controller.dispose();
      step.focusNode.dispose();
    }
  }
}
