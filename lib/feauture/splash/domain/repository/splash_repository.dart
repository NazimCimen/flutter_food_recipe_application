import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';
import 'package:flutter_food_recipe_application/feauture/splash/domain/entity/app_version_entity.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool?>> checkCacheOnboardShown();
  Future<Either<Failure, AppVersionEntity>> getAppVersionNumberFromDatabase({
    required String platform,
  });
}
