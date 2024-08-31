import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';

class RecipeStepInputModel extends Equatable {
  const RecipeStepInputModel({
    required this.controller,
    required this.focusNode,
    required this.stepEntity,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final RecipeStepEntity stepEntity;

  @override
  List<Object?> get props => [
        controller,
        focusNode,
        stepEntity,
      ];
  RecipeStepInputModel copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    RecipeStepEntity? stepEntity,
  }) {
    return RecipeStepInputModel(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      stepEntity: stepEntity ?? this.stepEntity,
    );
  }
}
