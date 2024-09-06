import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageManagementRepository {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  });
  Future<Either<Failure, String?>> getImageUrl(File imageFile);
}
