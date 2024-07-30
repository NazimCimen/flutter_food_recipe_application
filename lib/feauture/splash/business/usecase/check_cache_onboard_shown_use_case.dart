import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class CheckCacheOnboardShownUseCase {
  final SplashRepository splashRepository;
  CheckCacheOnboardShownUseCase(this.splashRepository);
  Future<Either<Failure, bool?>> call() async {
    return splashRepository.checkCacheOnboardShown();
  }
}
