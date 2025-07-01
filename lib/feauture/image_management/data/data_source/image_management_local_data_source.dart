import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';

abstract class ImageManagementLocalDataSource {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  });
}

class ImageManagementLocalDataSourceImpl
    extends ImageManagementLocalDataSource {
  ImageManagementLocalDataSourceImpl();
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

  @override
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
