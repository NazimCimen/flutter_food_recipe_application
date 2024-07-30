import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;
  SplashRepositoryImpl(this.splashLocalDataSource);
  @override
  Future<Either<Failure, bool?>> checkCacheOnboardShown() async {
    try {
      final result = await splashLocalDataSource.checkCacheOnboardShown();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'cache error'));
    }
  }
}
