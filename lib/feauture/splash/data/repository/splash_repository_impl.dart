import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;
  final SplashRemoteDataSource splashRemoteDataSource;

  SplashRepositoryImpl(this.splashLocalDataSource, this.splashRemoteDataSource);

  /// CHECKING CACHE FOR ONBOARD SCREEN VISIBILITY FLAG
  @override
  Future<Either<Failure, bool?>> checkCacheOnboardShown() async {
    try {
      final result = await splashLocalDataSource.checkCacheOnboardShown();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'cache error'));
    }
  }

  @override
  Future<Either<Failure, AppVersionModel>> getAppVersionNumberFromDatabase({
    required String platform,
  }) async {
    final response = await splashRemoteDataSource.getAppDatabaseVersionNumber(
      platform: platform,
    );
    return response.fold(
      (failure) => Left(failure),
      (versionModel) => Right(versionModel),
    );
  }
}
