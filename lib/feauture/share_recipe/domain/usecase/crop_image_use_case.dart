import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:image_cropper/image_cropper.dart';

class CropImageUseCase {
  final ShareRecipeRepository repository;
  CropImageUseCase({required this.repository});
  Future<Either<Failure, File?>> call({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  }) async {
    return repository.cropImage(
      cropAspectRatio: cropAspectRatio,
      imageFile: imageFile,
    );
  }
}
