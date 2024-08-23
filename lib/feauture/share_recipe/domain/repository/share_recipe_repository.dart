import 'dart:io';

import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class ShareRecipeRepository {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage(File imageFile);
  Future<Either<Failure, String?>> getImageUrl(File imageFile);
  Future<Either<Failure, bool>> shareRecipe(RecipeEntity recipeEntity);
}
