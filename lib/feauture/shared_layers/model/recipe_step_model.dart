import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/product/firebase/base_firebase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_step_model.g.dart';

@JsonSerializable()
class RecipeStepModel extends RecipeStepEntity
    implements BaseFirebaseModel<RecipeStepModel> {
  const RecipeStepModel({
    super.id,
    super.stepDescription,
    super.stepImageUrl,
    super.stepNumber,
  });

  @override
  RecipeStepModel fromJson(Map<String, dynamic> json) =>
      _$RecipeStepModelFromJson(json);

  @override
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
