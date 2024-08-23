import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class CropImageUseCase {
  final ShareRecipeRepository repository;
  CropImageUseCase({required this.repository});
  Future<Either<Failure, File?>> call({required File source}) async {
    return repository.cropImage(source);
  }
}
