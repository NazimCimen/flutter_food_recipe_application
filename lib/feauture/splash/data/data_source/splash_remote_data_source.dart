import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';
import 'package:flutter_food_recipe_application/product/firebase/firebase_collection_enum.dart';

abstract class SplashRemoteDataSource {
  Future<Either<Failure, AppVersionModel>> getAppDatabaseVersionNumber({
    required String platform,
  });
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final FirebaseFirestore firestore;
  final INetworkInfo networkInfo;

  ///network info
  SplashRemoteDataSourceImpl(
    this.firestore,
    this.networkInfo,
  );

  /// CHECKING APPLICATION DB NUMBER FOR FORCE UPDATE
  @override
  Future<Either<Failure, AppVersionModel>> getAppDatabaseVersionNumber({
    required String platform,
  }) async {
    final connection = await networkInfo.currentConnectivityResult;
    if (connection == true) {
      try {
        final response = await firestore
            .collection(FirebaseCollectionEnum.version.name)
            .doc(platform)
            .get();
        if (response.data() != null) {
          return Right(AppVersionModel.fromJson(response.data()!));
        } else {
          return Left(ServerFailure(errorMessage: 'data is null'));
        }
      } catch (e) {
        return Left(ServerFailure(errorMessage: 'data is null'));
      }
    } else {
      return Left(ConnectionFailure(errorMessage: 'no internet'));
    }
  }
}
