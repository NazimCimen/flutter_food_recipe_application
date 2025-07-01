import 'dart:io';
import 'package:flutter_food_recipe_application/feauture/image_management/image_management_export.dart';

abstract class ImageManagementRemoteDataSource {
  Future<Either<Failure, String?>> getImageUrl(File imageFile);
}

class ImageManagementRemoteDataSourceImpl
    extends ImageManagementRemoteDataSource {
  final FirebaseStorage storage;

  ImageManagementRemoteDataSourceImpl({
    required this.storage,
  });

  @override
  Future<Either<Failure, String?>> getImageUrl(File imageFile) async {
    try {
      final ref =
          storage.ref('userPostImages/').child('posts').child('image.name');
      await ref.putFile(File(imageFile.path));
      String url = await ref.getDownloadURL();
      print(url);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'errorMessage'));
    }
  }
}
