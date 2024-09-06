import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/repository/image_managemenT_repository.dart';

class GetImageUrlUseCase {
  final ImageManagementRepository repository;
  GetImageUrlUseCase({required this.repository});
  Future<Either<Failure, String?>> call({required File imageFile}) async {
    return repository.getImageUrl(imageFile);
  }
}
