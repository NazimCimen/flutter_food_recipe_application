import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/usecase/get_recipes_followers_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/usecase/get_recipes_world_kitchen_use_case.dart';
import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

class HomeViewModel extends ChangeNotifier {
  final GetRecipesFollowersUseCase _getRecipesFollowersUseCase;
  final GetRecipesWorldKitchenUseCase _getRecipesWorldKitchenUseCase;

  HomeViewModel(
    this._getRecipesFollowersUseCase,
    this._getRecipesWorldKitchenUseCase,
  );
  RecipeEntity? recipeEntity;
  Future<void> failureOrGetRecipesFollowers() async {
    final response = await _getRecipesFollowersUseCase.call();
    response.fold(
      (failure) {},
      (entity) {
        recipeEntity = entity;
        notifyListeners();
      },
    );
  }
}
