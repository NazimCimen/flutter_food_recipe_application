import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RecipeStepInputModel extends Equatable {
  const RecipeStepInputModel({
    required this.controller,
    required this.focusNode,
    required this.stepImageFile,
    required this.loading,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final File? stepImageFile;
  final bool loading;
  @override
  List<Object?> get props => [controller, focusNode, stepImageFile];
  RecipeStepInputModel copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    File? stepImageFile,
    bool? loading,
  }) {
    return RecipeStepInputModel(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      stepImageFile: stepImageFile ?? this.stepImageFile,
      loading: loading ?? this.loading,
    );
  }
}
