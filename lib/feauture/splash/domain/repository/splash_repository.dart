import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool?>> checkCacheOnboardShown();
  Future<Either<Failure, AppVersionEntity>> getAppVersionNumberFromDatabase({
    required String platform,
  });
}
