// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      postId: json['postId'] as String?,
      userId: json['userId'] as String?,
      recipeTitle: json['recipeTitle'] as String?,
      recipeDescription: json['recipeDescription'] as String?,
      imageUrl: json['imageUrl'] as String?,
      worldKitchen: json['worldKitchen'] as String?,
      cookingDuration: json['cookingDuration'] as String?,
      recipeIngredients: (json['recipeIngredients'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sharedTime: json['sharedTime'] == null
          ? null
          : (json['sharedTime'] as Timestamp).toDate().toLocal(),
      likesCount: (json['likesCount'] as num?)?.toInt() ?? 0,
      commentsCount: (json['commentsCount'] as num?)?.toInt() ?? 0,
      recipeStepIds: (json['recipeStepIds'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'recipeTitle': instance.recipeTitle,
      'recipeDescription': instance.recipeDescription,
      'imageUrl': instance.imageUrl,
      'recipeIngredients': instance.recipeIngredients,
      'sharedTime': instance.sharedTime?.toUtc(),
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'recipeSteps': instance.recipeStepIds,
      'worldKitchen': instance.worldKitchen,
      'cookingDuration': instance.cookingDuration,
    };
