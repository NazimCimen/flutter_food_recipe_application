import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

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
