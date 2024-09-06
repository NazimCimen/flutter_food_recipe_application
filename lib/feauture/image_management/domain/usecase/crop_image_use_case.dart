import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';

class CropImageUseCase {
  final ImageManagementRepository repository;
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
