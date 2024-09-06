import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';
import 'dart:io';

abstract class ImageManagementRepository {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  });
  Future<Either<Failure, String?>> getImageUrl(File imageFile);
}
