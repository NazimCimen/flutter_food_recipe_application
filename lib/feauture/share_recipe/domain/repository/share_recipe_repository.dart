import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

abstract class ShareRecipeRepository {
  Future<Either<Failure, bool>> shareRecipe(RecipeEntity recipeEntity);
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepEntity> recipeStepEntityList,
    required String postId,
  });
}
