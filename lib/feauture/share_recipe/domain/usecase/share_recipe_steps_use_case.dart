import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';

class ShareRecipeStepsUseCase {
  final ShareRecipeRepository repository;
  ShareRecipeStepsUseCase(this.repository);
  Future<Either<Failure, bool>> call({
    required List<RecipeStepEntity> recipeStepEntityList,
    required String postId,
  }) async {
    return repository.shareRecipeSteps(
        recipeStepEntityList: recipeStepEntityList, postId: postId);
  }
}
