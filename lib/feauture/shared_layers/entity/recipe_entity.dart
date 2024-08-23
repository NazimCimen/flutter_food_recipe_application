import 'package:equatable/equatable.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_step_model.dart';

class RecipeEntity extends Equatable {
  final String? postId;
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
    this.postId,
    this.userId,
    this.recipeTitle,
    this.recipeDescription,
    this.imageUrl,
    this.recipeIngredients,
    this.sharedTime,
    this.worldKitchen,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.recipeStepIds = const [],
  });

  @override
  List<Object?> get props => [
        postId,
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
