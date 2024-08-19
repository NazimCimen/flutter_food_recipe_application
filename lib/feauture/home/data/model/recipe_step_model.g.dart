// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStepModel _$RecipeStepModelFromJson(Map<String, dynamic> json) =>
    RecipeStepModel(
      id: json['id'] as String?,
      stepNumber: (json['stepNumber'] as num?)?.toInt(),
      stepDescription: json['stepDescription'] as String?,
      stepImageUrl: json['stepImageUrl'] as String?,
    );

Map<String, dynamic> _$RecipeStepModelToJson(RecipeStepModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepNumber': instance.stepNumber,
      'stepDescription': instance.stepDescription,
      'stepImageUrl': instance.stepImageUrl,
    };
