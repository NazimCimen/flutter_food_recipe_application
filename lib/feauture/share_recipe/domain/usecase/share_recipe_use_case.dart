import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

class ShareRecipeUseCase {
  final ShareRecipeRepository repository;
  ShareRecipeUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required RecipeEntity recipeEntity,
  }) async {
    return repository.shareRecipe(recipeEntity);
  }
}
