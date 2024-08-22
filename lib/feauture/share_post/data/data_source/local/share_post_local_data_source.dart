import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class SharePostLocalDataSource {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage(File imageFile);
}

class SharePostLocalDataSourceImpl extends SharePostLocalDataSource {
  @override
  Future<Either<Failure, File?>> getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        return Right(File(pickedFile.path));
      } else {
        return Left(CacheFailure(errorMessage: 'no image selected'));
      }
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'no image selected'));
    }
  }

  @override
  Future<Either<Failure, File?>> cropImage(File imageFile) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
          ),
        ],
      );
      if (croppedFile != null) {
        return Right(File(croppedFile.path));
      } else {
        return Left(CacheFailure(errorMessage: 'no image cropped'));
      }
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'no image cropped'));
    }
  }
}
