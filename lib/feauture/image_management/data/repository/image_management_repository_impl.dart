import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/connection/network_info.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/data/data_source/image_management_local_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/data/data_source/image_management_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/image_management/domain/repository/image_management_repository.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageManagementRepositoryImpl implements ImageManagementRepository {
  final ImageManagementLocalDataSource localDataSource;
  final ImageManagementRemoteDataSource remoteDataSource;

  final INetworkInfo connectivity;
  ImageManagementRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, File?>> getImage(ImageSource source) async {
    final result = await localDataSource.getImage(source);
    return result;
  }

  @override
  Future<Either<Failure, File?>> cropImage({
    required File imageFile,
    required CropAspectRatio cropAspectRatio,
  }) async {
    final result = await localDataSource.cropImage(
        imageFile: imageFile, cropAspectRatio: cropAspectRatio);
    return result;
  }

  @override
  Future<Either<Failure, String?>> getImageUrl(File imageFile) async {
    final result = await remoteDataSource.getImageUrl(imageFile);
    return result;
  }
}
