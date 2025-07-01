import 'package:dartz/dartz.dart';
import 'package:flutter_food_recipe_application/core/app_core_export.dart';
import 'package:flutter_food_recipe_application/core/error/failure.dart';
import 'package:flutter_food_recipe_application/feauture/home/data/data_source/home_remote_data_source.dart';
import 'package:flutter_food_recipe_application/feauture/shared_layers/entity/recipe_entity.dart';
import 'package:flutter_food_recipe_application/feauture/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final INetworkInfo networkInfo;

  HomeRepositoryImpl(this.networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, List<RecipeEntity?>?>> getRecipes() async {
    final connectivity = await networkInfo.currentConnectivityResult;

    if (connectivity) {
      try {
        // remote call
        final remoteRecipesResult =
            await _remoteDataSource.getRecipesFromFirebase();

        /// FİX DÖNÜŞÜMÜ DÜZGÜN YAP
        return remoteRecipesResult.fold((failure) => Left(failure),
            (recipeModel) => Right(recipeModel) // Model'den Entity'ye dönüşüm
            );
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      // İnternet yoksa
      return Left(ConnectionFailure(errorMessage: ''));
    }
  }
}
