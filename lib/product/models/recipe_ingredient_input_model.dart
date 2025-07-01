import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RecipeIngredientInputModel extends Equatable {
  const RecipeIngredientInputModel({
    required this.controller,
    required this.focusNode,
  });
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  List<Object?> get props => [
        controller,
        focusNode,
      ];
  RecipeIngredientInputModel copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? ingredient,
  }) {
    return RecipeIngredientInputModel(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
    );
  }
}
