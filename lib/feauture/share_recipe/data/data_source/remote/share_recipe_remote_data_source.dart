import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_model.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_collection_enum.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_converter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ShareRecipeRemoteDataSource {
  Future<Either<Failure, File?>> getImage(ImageSource source);
  Future<Either<Failure, File?>> cropImage(File imageFile);
  Future<Either<Failure, String?>> getImageUrl(File imageFile);
  Future<Either<Failure, bool>> shareRecipe(RecipeModel recipeModel);
}

class ShareRecipeRemoteDataSourceImpl extends ShareRecipeRemoteDataSource {
  final FirebaseStorage storage;
  final FirebaseFirestore firestore;
  final FirebaseConverter<RecipeModel> firebaseConverter;

  ShareRecipeRemoteDataSourceImpl(
      {required this.storage,
      required this.firestore,
      required this.firebaseConverter});
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
        return Left(ServerFailure(errorMessage: 'no image cropped'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'no image cropped'));
    }
  }

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

  @override
  Future<Either<Failure, bool>> shareRecipe(RecipeModel recipeModel) async {
    try {
      await firebaseConverter
          .collectionRef(FirebaseCollectionEnum.recipes)
          .add(recipeModel);
      return const Right(true);
    } catch (e) {
      print("Firestore Error: $e");
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
