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
  final double? cookingDuration;
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
  RecipeEntity copyWith({
    String? postId,
    String? userId,
    String? recipeTitle,
    String? recipeDescription,
    String? imageUrl,
    List<String?>? recipeIngredients,
    DateTime? sharedTime,
    int? likesCount,
    int? commentsCount,
    String? worldKitchen,
    double? cookingDuration,
    String? cookingType,
    List<String?>? recipeStepIds,
  }) {
    return RecipeEntity(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      recipeTitle: recipeTitle ?? this.recipeTitle,
      recipeDescription: recipeDescription ?? this.recipeDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      recipeIngredients: recipeIngredients ?? this.recipeIngredients,
      sharedTime: sharedTime ?? this.sharedTime,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      worldKitchen: worldKitchen ?? this.worldKitchen,
      cookingDuration: cookingDuration ?? this.cookingDuration,
      cookingType: cookingType ?? this.cookingType,
      recipeStepIds: recipeStepIds ?? this.recipeStepIds,
    );
  }
}
