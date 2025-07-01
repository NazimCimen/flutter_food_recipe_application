import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RecipeEntity?>?>> getRecipes();
}
