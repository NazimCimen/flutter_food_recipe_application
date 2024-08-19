import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class HomeViewModel extends ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  HomeViewModel(this._getRecipesUseCase);
  RecipeEntity? recipeEntity;
  Future<void> failureOrGetRecipes() async {
    final response = await _getRecipesUseCase.call();
    response.fold(
      (failure) {},
      (entity) {
        recipeEntity = entity;
        notifyListeners();
      },
    );
  }
}
