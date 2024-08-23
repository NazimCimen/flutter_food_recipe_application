import 'dart:io';

import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/domain/repository/share_recipe_repository.dart';
import 'package:image_picker/image_picker.dart';

class GetImageUrlUseCase {
  final ShareRecipeRepository repository;
  GetImageUrlUseCase({required this.repository});
  Future<Either<Failure, String?>> call({required File imageFile}) async {
    return repository.getImageUrl(imageFile);
  }
}
