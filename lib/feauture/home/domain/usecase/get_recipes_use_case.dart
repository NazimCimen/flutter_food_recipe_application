import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/repository/home_repository.dart';

class GetRecipesUseCase {
  HomeRepository repository;
  GetRecipesUseCase(this.repository);
  Future<Either<Failure, RecipeEntity>> call() async {
    return repository.getRecipes();
  }
}
