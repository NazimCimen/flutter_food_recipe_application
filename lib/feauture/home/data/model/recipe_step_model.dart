import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_step_entity.dart';
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
}
