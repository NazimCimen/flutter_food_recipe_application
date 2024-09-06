import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';

class ShareRecipeUseCase {
  final ShareRecipeRepository repository;
  ShareRecipeUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required RecipeEntity recipeEntity,
  }) async {
    return repository.shareRecipe(recipeEntity);
  }
}
