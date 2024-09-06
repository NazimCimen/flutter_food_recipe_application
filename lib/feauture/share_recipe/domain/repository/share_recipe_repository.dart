import 'dart:io';

import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_step_entity.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class ShareRecipeRepository {
  Future<Either<Failure, bool>> shareRecipe(RecipeEntity recipeEntity);
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepEntity> recipeStepEntityList,
    required String postId,
  });
}
