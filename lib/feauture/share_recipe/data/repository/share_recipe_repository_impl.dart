import 'dart:io';

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/data/data_source/share_recipe_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_step_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// connectivity check !!!!!
class ShareRecipeRepositoryImpl extends ShareRecipeRepository {
  final ShareRecipeRemoteDataSource remoteDataSource;
  final INetworkInfo connectivity;
  ShareRecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, bool>> shareRecipe(RecipeEntity recipeEntity) async {
    final recipeModel = RecipeModel.fromEntity(recipeEntity);
    final result = await remoteDataSource.shareRecipe(recipeModel);
    return result;
  }

  @override
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepEntity> recipeStepEntityList,
    required String postId,
  }) async {
    final recipeStepModelList = <RecipeStepModel>[];
    for (var i = 0; i < recipeStepEntityList.length; i++) {
      final recipeStepModel =
          RecipeStepModel.fromEntity(recipeStepEntityList[i]);
      recipeStepModelList.add(recipeStepModel);
    }
    final result = await remoteDataSource.shareRecipeSteps(
      recipeStepModelList: recipeStepModelList,
      postId: postId,
    );
    return result;
  }
}
