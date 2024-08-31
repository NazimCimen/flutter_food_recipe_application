import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RecipeIngredientInputModel extends Equatable {
  const RecipeIngredientInputModel({
    required this.controller,
    required this.focusNode,
    required this.ingredient,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String ingredient;

  @override
  List<Object?> get props => [
        controller,
        focusNode,
        ingredient,
      ];
  RecipeIngredientInputModel copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? ingredient,
  }) {
    return RecipeIngredientInputModel(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      ingredient: ingredient ?? this.ingredient,
    );
  }
}
