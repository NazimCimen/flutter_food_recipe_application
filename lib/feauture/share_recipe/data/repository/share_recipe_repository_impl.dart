import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

class ShareRecipeRepositoryImpl extends ShareRecipeRepository {
  final ShareRecipeRemoteDataSource remoteDataSource;
  final INetworkInfo connectivity;
  ShareRecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  /// Shares the main recipe by converting the [RecipeEntity] to a [RecipeModel] and sending it to the remote data source
  /// Checks for internet connectivity before attempting to share the recipe
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

  /// Shares the recipe steps by converting the list of [RecipeStepEntity] to [RecipeStepModel] and sending them to the remote data source
  /// Checks for internet connectivity before attempting to share the steps
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
