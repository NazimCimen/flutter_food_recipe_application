import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/repository/home_repository.dart';

class GetRecipesFollowersUseCase {
  HomeRepository repository;
  GetRecipesFollowersUseCase(this.repository);
  Future<Either<Failure, List<RecipeEntity?>?>> call() async {
    return repository.getRecipes();
  }
}
