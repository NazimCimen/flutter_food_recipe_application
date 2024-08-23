import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_step_model.g.dart';

@JsonSerializable()
class RecipeStepModel extends RecipeStepEntity {
  const RecipeStepModel({
    required super.id,
    required super.stepNumber,
    required super.stepDescription,
    required super.stepImageUrl,
  });

  factory RecipeStepModel.fromJson(Map<String, dynamic> json) {
    return _$RecipeStepModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecipeStepModelToJson(this);
  factory RecipeStepModel.fromEntity(RecipeStepEntity entity) {
    return RecipeStepModel(
      id: entity.id,
      stepNumber: entity.stepNumber,
      stepDescription: entity.stepDescription,
      stepImageUrl: entity.stepImageUrl,
    );
  }

  RecipeStepEntity toEntity() {
    return RecipeStepEntity(
      id: id,
      stepNumber: stepNumber,
      stepDescription: stepDescription,
      stepImageUrl: stepImageUrl,
    );
  }
}
