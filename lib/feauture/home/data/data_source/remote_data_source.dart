import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/model/recipe_model.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, RecipeModel>> getRecipesFromFirebase();
}

enum FirebaseEnum { recipes }

class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseFirestore firestore;

  RemoteDataSourceImpl(this.firestore);

  @override
  Future<Either<Failure, RecipeModel>> getRecipesFromFirebase() async {
    try {
      final querySnapshot = await firestore
          .collection(FirebaseEnum.recipes.name)
          .withConverter<RecipeModel>(
            fromFirestore: (snapshot, options) =>
                RecipeModel.fromJson(snapshot.data()!),
            toFirestore: (recipe, options) => recipe.toJson(),
          )
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Left(ServerFailure(errorMessage: "No recipes found"));
      }

      // Sadece ilk tarifi alıyoruz
      final recipeModel = querySnapshot.docs.first.data();
      return Right(recipeModel);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
