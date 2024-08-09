import 'package:flutter_food_recipe_application/feauture/splash/domain/entity/app_version_entity.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class GetAppDatabaseVersionNumber {
  final SplashRepository repository;
  GetAppDatabaseVersionNumber(this.repository);
  Future<Either<Failure, AppVersionEntity>> checkAppDbVersion({
    required String platform,
  }) async {
    return repository.getAppVersionNumberFromDatabase(platform: platform);
  }
}
