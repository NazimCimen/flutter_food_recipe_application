import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, RecipeEntity>> getRecipes();
}
