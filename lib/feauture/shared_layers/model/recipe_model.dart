import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_step_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/product/firebase/base_firebase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeModel extends RecipeEntity
    implements BaseFirebaseModel<RecipeModel> {
  const RecipeModel({
    super.postId,
    super.userId,
    super.recipeTitle,
    super.recipeDescription,
    super.imageUrl,
    super.recipeIngredients,
    super.sharedTime,
    super.worldKitchen,
    super.likesCount,
    super.commentsCount,
    super.recipeStepIds = const [],
  });

  @override
  RecipeModel fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  factory RecipeModel.fromEntity(RecipeEntity entity) {
    return RecipeModel(
      postId: entity.postId,
      userId: entity.userId,
      recipeTitle: entity.recipeTitle,
      recipeDescription: entity.recipeDescription,
      imageUrl: entity.imageUrl,
      recipeIngredients: entity.recipeIngredients,
      sharedTime: entity.sharedTime,
      worldKitchen: entity.worldKitchen,
      likesCount: entity.likesCount,
      commentsCount: entity.commentsCount,
      recipeStepIds: entity.recipeStepIds,
    );
  }

  RecipeEntity toEntity() {
    return RecipeEntity(
      postId: postId,
      userId: userId,
      recipeTitle: recipeTitle,
      recipeDescription: recipeDescription,
      imageUrl: imageUrl,
      recipeIngredients: recipeIngredients,
      sharedTime: sharedTime,
      worldKitchen: worldKitchen,
      likesCount: likesCount,
      commentsCount: commentsCount,
      recipeStepIds: recipeStepIds,
    );
  }
}
