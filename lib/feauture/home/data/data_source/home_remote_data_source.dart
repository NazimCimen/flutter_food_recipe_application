import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/model/recipe_model.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_collection_enum.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_converter.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, List<RecipeModel?>?>> getRecipesFromFirebase();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final FirebaseConverter<RecipeModel> firebaseConverter;
  HomeRemoteDataSourceImpl({required this.firebaseConverter});

  @override
  Future<Either<Failure, List<RecipeModel?>?>> getRecipesFromFirebase() async {
    try {
      final querySnapshot = await firebaseConverter
          .collectionRef(FirebaseCollectionEnum.recipes)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Left(ServerFailure(errorMessage: 'Tarif bulunamadı'));
      }

      final recipeModelList = <RecipeModel>[];
      for (final doc in querySnapshot.docs) {
        //HANDLE HERE EXCEPTION
        recipeModelList.add(doc.data());
      }
      return Right(recipeModelList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
