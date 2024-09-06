import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

abstract class ShareRecipeRemoteDataSource {
  Future<Either<Failure, bool>> shareRecipe(RecipeModel recipeModel);
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepModel> recipeStepModelList,
    required String postId,
  });
}

class ShareRecipeRemoteDataSourceImpl extends ShareRecipeRemoteDataSource {
  final FirebaseStorage storage;
  final FirebaseFirestore firestore;
  final FirebaseConverter<RecipeModel> recipeFirebaseConverter;
  final FirebaseConverter<RecipeStepModel> stepFirebaseConverter;

  ShareRecipeRemoteDataSourceImpl({
    required this.storage,
    required this.firestore,
    required this.recipeFirebaseConverter,
    required this.stepFirebaseConverter,
  });

  @override
  Future<Either<Failure, bool>> shareRecipe(RecipeModel recipeModel) async {
    try {
      await recipeFirebaseConverter
          .collectionRef(FirebaseCollectionEnum.recipes)
          .doc(
            recipeModel.postId,
          )
          .set(recipeModel);
      return const Right(true);
    } catch (e) {
      print("Firestore Error: $e");
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> shareRecipeSteps({
    required List<RecipeStepModel> recipeStepModelList,
    required String postId,
  }) async {
    try {
      final stepsCollectionRef = stepFirebaseConverter
          .collectionRef(FirebaseCollectionEnum.recipes)
          .doc(postId)
          .collection('steps');

      for (var recipeStep in recipeStepModelList) {
        await stepsCollectionRef.doc(recipeStep.id).set(recipeStep.toJson());
      }

      return const Right(true);
    } catch (e) {
      print("Firestore Error: $e");
      return Left(
        ServerFailure(
          errorMessage: 'Error sharing recipe steps: ${e.toString()}',
        ),
      );
    }
  }
}
