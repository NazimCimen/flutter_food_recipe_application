import 'package:equatable/equatable.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/model/recipe_step_model.dart';

class RecipeEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? recipeTitle;
  final String? recipeDescription;
  final String? imageUrl;
  final List<String?>? recipeIngredients;
  final DateTime? sharedTime;
  final int? likesCount;
  final int? commentsCount;
  final String? worldKitchen;
  final List<String?>? recipeStepIds;

  const RecipeEntity({
    required this.id,
    required this.userId,
    required this.recipeTitle,
    required this.recipeDescription,
    required this.imageUrl,
    required this.recipeIngredients,
    required this.sharedTime,
    required this.worldKitchen,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.recipeStepIds = const [],
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        recipeTitle,
        recipeDescription,
        imageUrl,
        recipeIngredients,
        sharedTime,
        likesCount,
        commentsCount,
        recipeStepIds,
        worldKitchen
      ];
}
