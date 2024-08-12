import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class GetAppDatabaseVersionNumberUseCase {
  final SplashRepository repository;
  GetAppDatabaseVersionNumberUseCase(this.repository);
  Future<Either<Failure, AppVersionEntity>> call({
    required String platform,
  }) async {
    return repository.getAppVersionNumberFromDatabase(platform: platform);
  }
}
