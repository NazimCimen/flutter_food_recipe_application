import 'package:equatable/equatable.dart';

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
  final String? cookingDuration;
  final String? cookingType;
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
    this.cookingDuration,
    this.cookingType,
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
        worldKitchen,
        cookingDuration,
        cookingType,
      ];
}
