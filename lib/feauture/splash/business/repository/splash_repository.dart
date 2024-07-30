import 'package:flutter_food_recipe_application/feauture/onboard/onboard_export.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool?>> checkCacheOnboardShown();
}
