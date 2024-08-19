import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/model/recipe_step_model.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

/*@JsonSerializable(explicitToJson: true)
class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.id,
    required super.userId,
    required super.recipeTitle,
    required super.recipeDescription,
    required super.imageUrl,
    required super.recipeIngredients,
    required super.sharedTime,
    super.likesCount,
    super.commentsCount,
    required List<DocumentReference> recipeSteps, // Store DocumentReferences
  }) : super(recipeSteps: recipeSteps);

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}*/

@JsonSerializable(explicitToJson: true)
class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.id,
    required super.userId,
    required super.recipeTitle,
    required super.recipeDescription,
    required super.imageUrl,
    required super.recipeIngredients,
    required super.sharedTime,
    super.likesCount,
    super.commentsCount,
    super.recipeStepIds = const [],
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
