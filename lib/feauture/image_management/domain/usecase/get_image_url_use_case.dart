import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';

class GetImageUrlUseCase {
  final ImageManagementRepository repository;
  GetImageUrlUseCase({required this.repository});
  Future<Either<Failure, String?>> call({required File imageFile}) async {
    return repository.getImageUrl(imageFile);
  }
}
