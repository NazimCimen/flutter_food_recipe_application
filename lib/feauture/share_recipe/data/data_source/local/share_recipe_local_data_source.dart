import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/core/utils/crop_ui_settings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class ShareRecipeLocalDataSource {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  });
}

class ShareRecipeLocalDataSourceImpl extends ShareRecipeLocalDataSource {
  ShareRecipeLocalDataSourceImpl();
  @override
  Future<Either<Failure, File?>> getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        return Right(File(pickedFile.path));
      } else {
        return Left(ServerFailure(errorMessage: 'no image selected'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'no image selected'));
    }
  }

  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  }) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: cropAspectRatio,
        uiSettings: [
          CropperUiSettings.getAndroidUiSettings(),
          CropperUiSettings.getIosUiSettings(),
        ],
      );

      if (croppedFile != null) {
        return Right(File(croppedFile.path));
      } else {
        return Left(ServerFailure(errorMessage: 'Kırpma işlemi iptal edildi'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Hata: ${e.toString()}'));
    }
  }
}
