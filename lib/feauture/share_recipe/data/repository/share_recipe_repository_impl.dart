import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

/// connectivity check !!!!!
class ShareRecipeRepositoryImpl extends ShareRecipeRepository {
  final ShareRecipeRemoteDataSource remoteDataSource;
  final INetworkInfo connectivity;

  ShareRecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, bool>> shareRecipe(RecipeEntity recipeEntity) async {
    final isConnected = await connectivity.currentConnectivityResult;
    if (!isConnected) {
      return Left(ConnectionFailure(errorMessage: 'No internet connection'));
    }
    final recipeModel = RecipeModel.fromEntity(recipeEntity);
    final result = await remoteDataSource.shareRecipe(recipeModel);
    return result;
  }

  @override
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepEntity> recipeStepEntityList,
    required String postId,
  }) async {
    final isConnected = await connectivity.currentConnectivityResult;
    if (!isConnected) {
      return Left(ConnectionFailure(errorMessage: 'No internet connection'));
    }
    final recipeStepModelList = <RecipeStepModel>[];
    for (var i = 0; i < recipeStepEntityList.length; i++) {
      final recipeStepModel =
          RecipeStepModel.fromEntity(recipeStepEntityList[i]);
      recipeStepModelList.add(recipeStepModel);
    }
    final result = await remoteDataSource.shareRecipeSteps(
      recipeStepModelList: recipeStepModelList,
      postId: postId,
    );
    return result;
  }
}
