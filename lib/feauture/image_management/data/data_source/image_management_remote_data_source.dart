import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_model.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_step_model.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_converter.dart';

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
